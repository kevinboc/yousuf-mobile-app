import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:yousuf_mobile_app/models/chat_message.dart';
import 'package:yousuf_mobile_app/widgets/message_bubble.dart';

const FlutterSecureStorage storage = FlutterSecureStorage();

class ChatList extends StatefulWidget {
  const ChatList({required this.chatMessages, super.key});

  final List<ChatMessage> chatMessages;

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  late List<ChatMessage> chatMessages;

  @override
  void initState() {
    chatMessages = widget.chatMessages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: chatMessages.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: MessageBubble(chatMessage: chatMessages[index]),
        );
      },
    );
  }
}
