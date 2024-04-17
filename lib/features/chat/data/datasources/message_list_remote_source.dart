import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat/data/models/message_model.dart';
import 'package:dartz/dartz.dart';

class MessageParams {
  final String messageContent;
  final String userEmail;
  final int chatID;
  //maybe add userID or another way to know what chat it is
  const MessageParams(
      {required this.messageContent,
      required this.chatID,
      required this.userEmail});
  Map<String, dynamic> toJson() => {
        "messageContent": messageContent,
        "chatID": chatID,
        "userEmail": userEmail
      };
}

class MessageListParams {
  final String userEmail;
  final int chatID;
  const MessageListParams({required this.userEmail, required this.chatID});

  Map<String, dynamic> toJson() {
    return {
      "userEmail": userEmail,
      "chatID": chatID,
    };
  }
}

class NewChatParams {
  final String userEmail;
  final int aiID;
  final String messageContent;
  const NewChatParams(
      {required this.userEmail,
      required this.aiID,
      required this.messageContent});
  Map<String, dynamic> toJson() =>
      {"userEmail": userEmail, "aiID": aiID, "messageContent": messageContent};
}

abstract class MessageRemoteDataSource {
  Future<Either<Failure, Message>> getConversation(
      MessageListParams messageListParams); //change to list?
  Future<Either<Failure, Message>> message(MessageParams messageParams);
  Future<Either<Failure, Message>> newChat(NewChatParams newChatParams);
}

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final DioClient dio;
  MessageRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Failure, Message>> getConversation(
      MessageListParams messageListParams) {
    //TODO: RN IS JUST BS
    //find a way to get all messages and store them
    final response = dio.getRequest(
      "",
      queryParamaters: messageListParams.toJson(),
      converter: (response) =>
          Message.fromJson(response as Map<String, dynamic>),
    );
    return response;
  }

  @override
  Future<Either<Failure, Message>> message(MessageParams messageParams) {
    final response = dio.postRequest(
      '',
      data: messageParams.toJson(),
      converter: (response) =>
          Message.fromJson(response as Map<String, dynamic>),
    );
    return response;
  }

  @override
  Future<Either<Failure, Message>> newChat(NewChatParams newChatParams) {
    final response = dio.postRequest("url",
        converter: (response) =>
            Message.fromJson(response as Map<String, dynamic>));
    return response;
  }
}
