import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/chat_messages.dart';
import 'package:yousuf_mobile_app/features/chat/domain/repository/message_repository.dart';

part 'retrieve_chat_messages.freezed.dart';
part 'retrieve_chat_messages.g.dart';

class RetrieveChatMessages extends UseCase<ChatMessages, ChatMessagesParams> {
  final MessageRepository _repo;

  RetrieveChatMessages(this._repo);

  @override
  Future<Either<Failure, ChatMessages>> call(ChatMessagesParams params) {
    return _repo.getChatMessages(params);
  }
}

@freezed
class ChatMessagesParams with _$ChatMessagesParams {
  const factory ChatMessagesParams(
      {required String chatID,
      @Default(0) int offset,
      @Default(16) int limit}) = _ChatMessageParams;
  factory ChatMessagesParams.fromJson(Map<String, dynamic> json) =>
      _$ChatMessagesParamsFromJson(json);
}
