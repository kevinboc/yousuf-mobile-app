import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/core/api/api.dart';
import 'package:yousuf_mobile_app/models/chat.dart';
import 'package:yousuf_mobile_app/screens/chat.dart';

final _dio = DioClient();
const FlutterSecureStorage storage = FlutterSecureStorage();

class NewChatMessage extends StatefulWidget {
  const NewChatMessage({super.key});

  @override
  State<NewChatMessage> createState() => _NewChatMessageState();
}

class _NewChatMessageState extends State<NewChatMessage> {
  final TextEditingController _controller = TextEditingController();
  final Logger _logger = Logger();

  Future<Chat> _createNewChat(String enteredMessage) async {
    String? token = await storage.read(key: 'login_token');

    final response = await _dio.postRequest(
      APIList.chats,
      data: {
        'title': enteredMessage,
      },
      converter: (res) {
        _logger.i("Chat created: $res");
        return Chat(
          id: res['id'],
          title: res['title'],
          lastUpdated: DateTime.now(),
        );
      },
      token: true,
      isIsolate: false,
      tokenVal: token,
    );

    return response.fold((error) {
      _logger.e("Error creating chat: $error");
      throw error;
    }, (chat) {
      return chat;
    });
  }

  void _sendMessage() async {
    final enteredMessage = _controller.text;

    if (enteredMessage.trim().isEmpty) {
      return;
    }

    FocusScope.of(context).unfocus();

    _controller.clear();

    // Navigate to new chat screen
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) =>
              ChatScreen(loadingChat: _createNewChat(enteredMessage))),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Send a message...'),
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
          )
        ],
      ),
    );
  }
}
