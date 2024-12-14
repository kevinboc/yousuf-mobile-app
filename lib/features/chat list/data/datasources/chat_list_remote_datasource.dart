import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/chat_entity.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/user_chat_list.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Logger _logger = Logger();

abstract class ChatListRemoteDataSource {
  Future<Either<Failure, UserChatList>> getChats();
  Future<Either<Failure, ChatEntity>> newChat(String chatName);
}

class ChatListRemoteDataSourceImpl implements ChatListRemoteDataSource {
  final DioClient dio;
  ChatListRemoteDataSourceImpl({required this.dio});
  FlutterSecureStorage storage = const FlutterSecureStorage();
  @override
  Future<Either<Failure, UserChatList>> getChats() async {
    String? token = await storage.read(key: 'login_token');
    final response = await dio.getRequest(
      APIList.chats,
      token: token,
      converter: (response) {
        /*
         * response.data is passed in from dio as response
         * response is a list of chats with [{id: 6705debd, user_id: 341adkjas, title: chattitleex }]
         * response is of type list<dynamic>
         * response.map<ChatEntity> takes every object and calls fromJson on it
         * returning Iterable<ChatEntity>
         * to list turns in into a list as it is what UserChatList expects
         * maybe get rid of UserChatList and just leave as List<ChatEntity>
        */

        // return UserChatList(
        //     userChatList: response
        //         .map<ChatEntity>((json) => ChatEntity.fromJson(json))
        //         .toList());
        return UserChatList.fromJson({'userChatList': response});
      },
      isIsolate: false,
    );
    return response;
  }

  @override
  Future<Either<Failure, ChatEntity>> newChat(String chatName) async {
    String? token = await storage.read(key: 'login_token');
    _logger.i("Making new chat\n token value:");
    _logger.i(token);
    final response = await dio.postRequest(APIList.chats,
        data: {'title': chatName}, converter: (response) {
      return ChatEntity(response['id'], response['title']);
    }, token: true, isIsolate: false, tokenVal: token);
    _logger.i("response:");
    _logger.i(response);
    return response;
  }
}
