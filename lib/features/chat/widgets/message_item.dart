import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/features/chat/data/models/message_model.dart';

Widget messageItem(Message content) {
  var alignment =
      content.isFromUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
  return Column(crossAxisAlignment: alignment, children: [
    const Text("name"),
    Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.blue),
      child: Text(content.message),
    ),
    Text(
      content.time.toString().substring(10, content.time.toString().length - 1),
      style: const TextStyle(fontSize: 12),
    )
  ]);
}
