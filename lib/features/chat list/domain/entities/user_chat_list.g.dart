// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_chat_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserChatListImpl _$$UserChatListImplFromJson(Map<String, dynamic> json) =>
    _$UserChatListImpl(
      userChatList: (json['userChatList'] as List<dynamic>?)
          ?.map((e) => ChatEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserChatListImplToJson(_$UserChatListImpl instance) =>
    <String, dynamic>{
      'userChatList': instance.userChatList,
    };
