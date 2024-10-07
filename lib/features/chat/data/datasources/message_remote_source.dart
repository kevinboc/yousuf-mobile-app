import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/chat_messages.dart';
import 'package:dartz/dartz.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/message.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/post_chat_message.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/retrieve_chat_messages.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class MessageRemoteDataSource {
  Future<Either<Failure, ChatMessages>> getChatMessages(
      ChatMessagesParams messageListParams);
  Future<Either<Failure, Message>> message(MessageParams messageParams);
  // Future<Either<Failure, Message>> newChat(NewChatParams newChatParams);
}

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final DioClient dio;
  MessageRemoteDataSourceImpl(this.dio);
  FlutterSecureStorage storage = FlutterSecureStorage();
  @override
  Future<Either<Failure, ChatMessages>> getChatMessages(
      ChatMessagesParams params) async {
    final response = await dio.getRequest("",
        queryParamaters: params.toJson(),
        converter: (response) =>
            ChatMessages.fromJson(response as Map<String, dynamic>),
        isIsolate: true,
        token: await storage.read(key: 'login_token') as String);
    return response;
  }

  @override
  Future<Either<Failure, Message>> message(MessageParams params) async {
    final response = await dio.postRequest('/chats/<chat_id>/message',
        //pass in prompt as form
        data: params.toJson(),
        converter: (response) =>
            Message.fromJson(response as Map<String, dynamic>),
        token: true,
        isIsolate: false,
        tokenVal: await storage.read(key: 'login_token') as String);
    return response;
  }

  // @override
  // Future<Either<Failure, Message>> newChat(NewChatParams newChatParams) async{
  //   final response = await dio.postRequest("url",
  //       data: newChatParams.toJson(),
  //       converter: (response) =>
  //           Message.fromJson(response as Map<String, dynamic>));
  //   return response;
  // }
}

// class NewChatParams {
//   final String userEmail;
//   final int aiID;
//   final String messageContent;
//   const NewChatParams(
//       {required this.userEmail,
//       required this.aiID,
//       required this.messageContent});
//   Map<String, dynamic> toJson() =>
//       {"userEmail": userEmail, "aiID": aiID, "messageContent": messageContent};
// }
