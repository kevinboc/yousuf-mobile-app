import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({required this.chatMessage, super.key});

  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: chatMessage.isUser
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: chatMessage.isUser
                ? Colors.grey[300]
                : Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Text(
            chatMessage.message,
            style: TextStyle(
              color: chatMessage.isUser
                  ? Colors.black
                  : Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ],
    );
  }
}
