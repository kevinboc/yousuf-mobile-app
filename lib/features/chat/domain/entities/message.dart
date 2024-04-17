import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message(
      {required String text,
      required bool fromUser,
      @JsonKey(name: 'DateTime') required DateTime time}) = _Message;
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
