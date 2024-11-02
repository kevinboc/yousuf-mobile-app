import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/models/chat.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({required this.chat, super.key});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chat.title),
      ),
      body: const Text("TODO"),
    );
  }
}
