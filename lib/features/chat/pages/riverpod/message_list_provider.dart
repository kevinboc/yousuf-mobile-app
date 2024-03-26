import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat/data/models/message_model.dart';

class MessageList extends StateNotifier<List<Message>> {
  @override
  MessageList() : super([]);
  void addMessage(String text, bool fromUser) =>
      state = [...state, Message(text, fromUser, TimeOfDay.now())];
  List<Message> get messageList => state;
}

final messageListProvider =
    StateNotifierProvider<MessageList, List<Message>>((ref) => MessageList());
