import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'message_model.dart';

class ChatScreenController extends GetxController {
  // final List<Message> messageList = <Message>[].obs;
  // final messageList = RxList<Message>();
  final messageList = <Message>[].obs;
  newUserMessage(String messageInput) => {
        messageList.add(Message(messageInput, true, TimeOfDay.now())),
      };
}
