import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/models/chat_message.dart';
import 'package:yousuf_mobile_app/widgets/message_bubble.dart';

class ChatList extends StatelessWidget {
  const ChatList({required this.messages, super.key});

  final List<ChatMessage> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: MessageBubble(chatMessage: messages[index]),
        );
      },
    );
  }
}
