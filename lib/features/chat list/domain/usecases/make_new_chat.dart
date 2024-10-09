import 'package:dartz/dartz.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/chat_entity.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/reopsitory/chat_list_repository.dart';

class CreateNewChat extends UseCase<ChatEntity, CreateNewChatParams> {
  final ChatListRepository repo;
  CreateNewChat(this.repo);
  @override
  Future<Either<Failure, ChatEntity>> call(CreateNewChatParams params) {
    return repo.createNewChat(params.chatName);
  }
}

class CreateNewChatParams {
  final String chatName;
  CreateNewChatParams({required this.chatName});
}
