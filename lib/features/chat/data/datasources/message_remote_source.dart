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
}

class MessageRemoteDataSourceImpl implements MessageRemoteDataSource {
  final DioClient dio;
  MessageRemoteDataSourceImpl(this.dio);
  FlutterSecureStorage storage = FlutterSecureStorage();
  @override
  Future<Either<Failure, ChatMessages>> getChatMessages(
      ChatMessagesParams params) async {
    final response = await dio.getRequest("/chats/${params.chatID}",
        converter: (response) {
      List<Message> messageList = [];
      for (final i in response) {
        // String id = i['id'];
        // String session_id = i['session_id'];
        String type = i['history']['type'];
        String content = i['history']['data']['content'];
        messageList.add(Message(message: content, fromUser: type == 'human'));
      }
      return ChatMessages(messageList: messageList);
    },
        isIsolate: false,
        token: await storage.read(key: 'login_token') as String);
    print("response");

    print(response);
    return response;
  }

  @override
  Future<Either<Failure, Message>> message(MessageParams params) async {
    final response = await dio.postRequest('/chats/${params.chatID}/message',
        //pass in prompt as form
        data: {'prompt': params.prompt},
        converter: (response) =>
            Message.fromJson(response as Map<String, dynamic>),
        token: true,
        isIsolate: false,
        tokenVal: await storage.read(key: 'login_token') as String);
    return response;
  }
}
