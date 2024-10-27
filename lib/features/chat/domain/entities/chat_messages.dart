import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/message.dart';

part 'chat_messages.freezed.dart';

part 'chat_messages.g.dart';

@freezed
class ChatMessages with _$ChatMessages {
  const factory ChatMessages({@Default([]) List<Message> messageList}) =
      _ChatMessages;

  factory ChatMessages.fromJson(Map<String, dynamic> json) =>
      _$ChatMessagesFromJson(json);
}
