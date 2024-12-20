import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/message.dart';
import 'package:yousuf_mobile_app/features/chat/domain/repository/message_repository.dart';

part 'post_chat_message.freezed.dart';
part 'post_chat_message.g.dart';

//returns type message and says it will only take in
//objects of type messageparams as input for its functions
class PostChatMessage extends UseCase<Message, MessageParams> {
  final MessageRepository _repo;
  PostChatMessage(this._repo);

  @override
  Future<Either<Failure, Message>> call(MessageParams params) {
    //call to messagepero with params
    return _repo.message(params);
    //returns this to the provider
  }
}

@freezed
class MessageParams with _$MessageParams {
  const factory MessageParams(
      {required String prompt, required String chatID}) = _MessageParams;

  factory MessageParams.fromJson(Map<String, dynamic> json) =>
      _$MessageParamsFromJson(json);
}
