// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessagesImpl _$$ChatMessagesImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessagesImpl(
      chatID: json['chatID'] as int?,
      messageList: (json['messageList'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      title: json['title'] as String?,
      userID: json['userID'] as int,
    );

Map<String, dynamic> _$$ChatMessagesImplToJson(_$ChatMessagesImpl instance) =>
    <String, dynamic>{
      'chatID': instance.chatID,
      'messageList': instance.messageList,
      'title': instance.title,
      'userID': instance.userID,
    };
