import 'package:dartz/dartz.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/user_chat_list.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/reopsitory/chat_list_repository.dart';

class GetUserChats extends UseCase<UserChatList, NoParams> {
  final ChatListRepository repo;
  GetUserChats(this.repo);

  @override
  Future<Either<Failure, UserChatList>> call(NoParams params) {
    return repo.getChats();
  }
}
