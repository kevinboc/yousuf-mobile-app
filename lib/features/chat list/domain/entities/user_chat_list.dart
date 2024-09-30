import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/chat_entity.dart';

part 'user_chat_list.freezed.dart';
part 'user_chat_list.g.dart';

@freezed
class UserChatList with _$UserChatList {
  const factory UserChatList({List<ChatEntity>? userChatList}) = _UserChatList;
  factory UserChatList.fromJson(Map<String, dynamic> json) =>
      _$UserChatListFromJson(json);
}
