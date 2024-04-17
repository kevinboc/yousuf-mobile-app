import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat/data/models/message_model.dart';
import 'package:dio/dio.dart';

class MessageList extends StateNotifier<List<Message>> {
  @override
  MessageList() : super([]);
  void addMessage(String text, bool fromUser, int chatID, int userID) =>
      state = [
        ...state,
        Message(
            message: text,
            userEmail: "testEmail",
            isFromUser: fromUser,
            time: TimeOfDay.now())
      ];
  List<Message> get messageList => state;

  void computerResponse() async {
    final Dio dio = Dio();
    final response = await dio.post(
      'https://yousuf195.azurewebsites.net/login',
      data: {
        "first_name": "John",
        "last_name": "Doe",
        "email": "john.doe@example.com",
        "password": "password123"
      },
    );
    if (response.statusCode == 201) {
      print(response);
      // state = [
      //   ...state,
      //   Message(
      //       message: "name",
      //       userEmail: "email",
      //       time: TimeOfDay.now(),
      //       isFromUser: false)
      // ];
    } else {
      print("ERROR");
      throw Error();
    }
  }
}

final messageListProvider =
    StateNotifierProvider<MessageList, List<Message>>((ref) => MessageList());
