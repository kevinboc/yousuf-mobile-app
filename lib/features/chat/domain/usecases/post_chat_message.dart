import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/message.dart';
import 'package:yousuf_mobile_app/features/chat/domain/repository/message_repository.dart';

part 'post_chat_message.freezed.dart';
part 'post_chat_message.g.dart';

class PostChatMessage extends UseCase<Message, MessageParams> {
  final MessageRepository _repo;
  PostChatMessage(this._repo);

  @override
  Future<Either<Failure, Message>> call(MessageParams params) {
    return _repo.message(params);
  }
}

@freezed
class MessageParams with _$MessageParams {
  const factory MessageParams(
      {required String messageContent,
      required int chatID,
      required int userID}) = _MessageParams;

  factory MessageParams.fromJson(Map<String, dynamic> json) =>
      _$MessageParamsFromJson(json);
}
