import 'package:dartz/dartz.dart';
import 'package:yousuf_mobile_app/core/error/failure.dart';
import 'package:yousuf_mobile_app/features/chat%20list/data/datasources/chat_list_remote_datasource.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/user_chat_list.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/reopsitory/chat_list_repository.dart';

class ChatListRepositoryImpl implements ChatListRepository {
  final ChatListRemoteDataSource remote;
  ChatListRepositoryImpl(this.remote);
  @override
  Future<Either<Failure, UserChatList>> getChats() {
    return remote.getChats();
  }
}
