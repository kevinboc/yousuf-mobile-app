import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/features/chat/data/models/message_model.dart';
import 'package:yousuf_mobile_app/features/chat/domain/repository/message_repository.dart';

class MessageListRemoteDataSourceImpl implements MessageListRemoteDataSource {
  final Dio dio;
  MessageListRemoteDataSourceImpl(this.dio);

  @override
  Future<Message> getMessage() async {
    final response = await dio.post('localhost:5000/messages');

    if (response.statusCode == 200) {
      print(response);
      // Message(response.data, false, TimeOfDay.now*());

      return Message(
          message: "name",
          userEmail: "email",
          time: TimeOfDay.now(),
          isFromUser: false);
    } else {
      throw Error();
    }
  }

  @override
  Future<List<Message>> getMessages(String userEmail, int chatID) async {
    // TODO: implement getMessages
    final response = await dio.post('localhost:5000/messages');

    if (response.statusCode == 200) {
      print(response);
      // Message(response.data, false, TimeOfDay.now*());

      return <Message>[
        Message(
            message: "name",
            userEmail: "email",
            time: TimeOfDay.now(),
            isFromUser: false)
      ];
    } else {
      throw Error();
    }
  }

  @override
  Future<Message> getResponse(
      String requestMessage, String userEmail, int chatID) async {
    final response = await dio.post('localhost:5000/messages');

    if (response.statusCode == 200) {
      print(response);
      // Message(response.data, false, TimeOfDay.now*());

      return Message(
          message: "name",
          userEmail: "email",
          time: TimeOfDay.now(),
          isFromUser: false);
    } else {
      throw Error();
    }
  }
}
