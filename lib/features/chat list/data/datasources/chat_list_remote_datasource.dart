import 'package:dartz/dartz.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/user_chat_list.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ChatListRemoteDataSource {
  Future<Either<Failure, UserChatList>> getChats();
}

class ChatListRemoteDataSourceImpl implements ChatListRemoteDataSource {
  final DioClient dio;
  ChatListRemoteDataSourceImpl({required this.dio});
  FlutterSecureStorage storage = FlutterSecureStorage();
  @override
  Future<Either<Failure, UserChatList>> getChats() async {
    String? token = await storage.read(key: 'login_token');
    final response = await dio.getRequest(
      "/chats",
      token: token,
      converter: (response) =>
          UserChatList.fromJson(response as Map<String, dynamic>),
      isIsolate: false,
    );
    return response;
  }
}
