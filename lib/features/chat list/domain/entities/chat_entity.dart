import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_entity.freezed.dart';
part 'chat_entity.g.dart';

@freezed
class ChatEntity with _$ChatEntity {
  const factory ChatEntity(int? id, String? title) = _ChatEntity;
  factory ChatEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatEntityFromJson(json);
}
