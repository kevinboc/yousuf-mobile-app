import 'package:dartz/dartz.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/user_chat_list.dart';

abstract class ChatListRemoteDataSource {
  Future<Either<Failure, UserChatList>> getChats();
}

class ChatListRemoteDataSourceImpl implements ChatListRemoteDataSource {
  final DioClient dio;
  ChatListRemoteDataSourceImpl({required this.dio});
  @override
  Future<Either<Failure, UserChatList>> getChats() async {
    final response = await dio.getRequest(
      "/chats",
      queryParamaters: {"token": "t"},
      converter: (response) =>
          UserChatList.fromJson(response as Map<String, dynamic>),
      isIsolate: false,
    );
    return response;
  }
}
