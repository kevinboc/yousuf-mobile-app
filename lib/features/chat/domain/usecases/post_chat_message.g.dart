// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageParamsImpl _$$MessageParamsImplFromJson(Map<String, dynamic> json) =>
    _$MessageParamsImpl(
      messageContent: json['messageContent'] as String,
      chatID: json['chatID'] as int,
      userID: json['userID'] as int,
    );

Map<String, dynamic> _$$MessageParamsImplToJson(_$MessageParamsImpl instance) =>
    <String, dynamic>{
      'messageContent': instance.messageContent,
      'chatID': instance.chatID,
      'userID': instance.userID,
    };
