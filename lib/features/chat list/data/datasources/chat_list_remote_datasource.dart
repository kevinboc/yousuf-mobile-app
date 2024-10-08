import 'package:dartz/dartz.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/chat_entity.dart';
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
      converter: (response) {
        final List<ChatEntity> chatEntities = [];
        for (final i in response) {
          chatEntities.add(ChatEntity(i['id'], i['title']));
        }
        return UserChatList(userChatList: chatEntities);
      },
      isIsolate: false,
    );
    return response;
  }
}
