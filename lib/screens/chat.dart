import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/core/api/api_list.dart';
import 'package:yousuf_mobile_app/core/api/dio_client.dart';
import 'package:yousuf_mobile_app/models/chat.dart';
import 'package:yousuf_mobile_app/models/chat_message.dart';
import 'package:yousuf_mobile_app/widgets/chat_list.dart';
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
  var _loadingMessages = false;
  var _loadingResponse = false;

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

    return response.fold((error) {
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

  @override
  void initState() {
    _chatFuture = widget.loadingChat;
    _loadingMessages = true;
    _fetchChatMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_chatTitle),
      ),
      body: FutureBuilder<Chat>(
        future: _chatFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                _chatTitle = snapshot.data!.title;
              });
            });

            if (_loadingMessages) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
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
        },
      ),
    );
  }
}
