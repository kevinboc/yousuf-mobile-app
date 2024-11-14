import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/core/api/api_list.dart';
import 'package:yousuf_mobile_app/core/api/dio_client.dart';
import 'package:yousuf_mobile_app/models/chat.dart';
import 'package:yousuf_mobile_app/models/chat_message.dart';
import 'package:yousuf_mobile_app/widgets/chat_list.dart';
import 'package:yousuf_mobile_app/widgets/edit_chat.dart';
import 'package:yousuf_mobile_app/widgets/new_message.dart';

final _dio = DioClient();
final Logger _logger = Logger();
const FlutterSecureStorage _storage = FlutterSecureStorage();

class ChatScreen extends StatefulWidget {
  const ChatScreen({required this.loadingChat, super.key});

  final Future<Chat> loadingChat;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Future<Chat> _chatFuture;

  var _chatTitle = "Loading chat...";
  List<ChatMessage> _chatMessages = [];
  var _loadingChat = true;
  var _loadingMessages = false;
  var _loadingResponse = false;

  Future<void> _fetchChat() async {
    final chat = await _chatFuture;

    setState(() {
      _chatTitle = chat.title;
      _loadingChat = false;
    });
  }

  Future<bool> _updateChatTitle(String newTitle, String currTitle) async {
    setState(() {
      _chatTitle = newTitle;
    });

    final chat = await _chatFuture;

    String? token = await _storage.read(key: 'login_token');

    final response = await _dio.putRequest(
      "${APIList.chats}/${chat.id}",
      data: {
        'title': newTitle,
      },
      converter: (res) {
        _logger.i("Chat updated: $res");
        return true;
      },
      token: true,
      isIsolate: false,
      tokenVal: token,
    );

    return response.fold((error) {
      _logger.e("Error updating chat: $error");

      setState(() {
        _chatTitle = currTitle;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error syncing chat title update. Please try again."),
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(context).colorScheme.error,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ));

      return false;
    }, (success) {
      return success;
    });
  }

  Future<void> _fetchChatMessages() async {
    final chat = await _chatFuture;

    String? token = await _storage.read(key: 'login_token');

    final response = await _dio.getRequest(
      "${APIList.chats}/${chat.id}",
      token: token,
      converter: (response) {
        List<ChatMessage> messagesList = [];
        for (final msg in response) {
          messagesList.add(ChatMessage(
            message: msg['history']['data']['content'],
            isUser: msg['history']['type'] == 'human',
          ));
        }
        return messagesList;
      },
      isIsolate: false,
    );

    response.fold((error) {
      _logger.e("Error getting chat messages: $error");
      throw error;
    }, (messagesList) {
      setState(() {
        _logger.i("Chat messages fetched");
        _chatMessages = messagesList;
        _loadingMessages = false;
      });
    });
  }

  Future<void> _fetchResponse(String enteredMessage) async {
    final chat = await _chatFuture;

    String? token = await _storage.read(key: 'login_token');

    setState(() {
      _chatMessages.insert(
          0,
          ChatMessage(
            message: enteredMessage,
            isUser: true,
          ));
      _loadingResponse = true;
    });

    final response = await _dio.postRequest(
      "${APIList.chats}/${chat.id}/message",
      data: {
        'prompt': enteredMessage,
      },
      converter: (res) {
        _logger.i("Chat created: $res");
        return ChatMessage(
          message: res["message"],
          isUser: false,
        );
      },
      token: true,
      isIsolate: false,
      tokenVal: token,
    );

    return response.fold((error) {
      _logger.e("Error creating chat: $error");
      throw error;
    }, (msg) {
      setState(() {
        _chatMessages.insert(0, msg);
        _loadingResponse = false;
      });
    });
  }

  void _openEditChatOverlay() async {
    final chat = await _chatFuture;

    final newChatTitle = await showModalBottomSheet<String>(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => EditChat(chat: chat),
    );

    if (newChatTitle != null && newChatTitle != _chatTitle) {
      _updateChatTitle(newChatTitle, _chatTitle);
    }
  }

  @override
  void initState() {
    _chatFuture = widget.loadingChat;
    _loadingMessages = true;
    _fetchChat();
    _fetchChatMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: CircularProgressIndicator(),
    );

    if (!_loadingChat) {
      if (_loadingMessages) {
        content = const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        content = Column(
          children: [
            Expanded(
              child: ChatList(
                chatMessages: _chatMessages,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: NewMessage(
                enabled: !_loadingMessages && !_loadingResponse,
                onSend: _fetchResponse,
              ),
            ),
          ],
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_chatTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_document),
            onPressed: _openEditChatOverlay,
          ),
        ],
      ),
      body: content,
    );
  }
}
