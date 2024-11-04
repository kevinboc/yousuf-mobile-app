import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/core/api/api_list.dart';
import 'package:yousuf_mobile_app/core/api/dio_client.dart';
import 'package:yousuf_mobile_app/models/chat.dart';
import 'package:yousuf_mobile_app/models/chat_message.dart';
import 'package:yousuf_mobile_app/widgets/message_bubble.dart';

final _dio = DioClient();
final Logger _logger = Logger();
const FlutterSecureStorage storage = FlutterSecureStorage();

class ChatList extends StatefulWidget {
  const ChatList({required this.chat, super.key});

  final Chat chat;

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  late Chat chat;
  late Future<List<ChatMessage>> _chatMessagesFuture;

  Future<List<ChatMessage>> _fetchChatMessage() async {
    String? token = await storage.read(key: 'login_token');

    final response = await _dio.getRequest(
      APIList.chats + "/${chat.id}",
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
      return messagesList;
    });
  }

  @override
  void initState() {
    chat = widget.chat;
    _chatMessagesFuture = _fetchChatMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _chatMessagesFuture,
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
            final List<ChatMessage> messages =
                snapshot.data as List<ChatMessage>;

            return ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: MessageBubble(chatMessage: messages[index]),
                );
              },
            );
          }
        });
  }
}
