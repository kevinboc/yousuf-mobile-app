import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/chat_messages.dart';
import 'package:dartz/dartz.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/message.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/post_chat_message.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/retrieve_chat_messages.dart';

abstract class MessageRemoteDataSource {
  Future<Either<Failure, ChatMessages>> getChatMessages(
      ChatMessagesParams messageListParams); //change to list?
  Future<Either<Failure, Message>> message(MessageParams messageParams);
  Future<Either<Failure, Message>> newChat(NewChatParams newChatParams);
}

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final DioClient dio;
  MessageRemoteDataSourceImpl(this.dio);

  @override
  Future<Either<Failure, ChatMessages>> getChatMessages(
      ChatMessagesParams params) {
    //TODO: RN IS JUST BS
    //find a way to get all messages and store them
    final response = dio.getRequest(
      "",
      queryParamaters: params.toJson(),
      converter: (response) =>
          ChatMessages.fromJson(response as Map<String, dynamic>),
    );
    return response;
  }

  @override
  Future<Either<Failure, Message>> message(MessageParams params) {
    final response = dio.postRequest(
      '',
      data: params.toJson(),
      converter: (response) =>
          Message.fromJson(response as Map<String, dynamic>),
    );
    return response;
  }

  @override
  Future<Either<Failure, Message>> newChat(NewChatParams newChatParams) {
    final response = dio.postRequest("url",
        data: newChatParams.toJson(),
        converter: (response) =>
            Message.fromJson(response as Map<String, dynamic>));
    return response;
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
