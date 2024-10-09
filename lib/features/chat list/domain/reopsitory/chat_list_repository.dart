import 'package:dartz/dartz.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/chat_entity.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/user_chat_list.dart';

abstract class ChatListRepository {
  Future<Either<Failure, UserChatList>> getChats();
  Future<Either<Failure, ChatEntity>> createNewChat(String chatName);
}
