// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_chat_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageParamsImpl _$$ChatMessageParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatMessageParamsImpl(
      chatID: json['chatID'] as String,
      offset: json['offset'] as int? ?? 0,
      limit: json['limit'] as int? ?? 16,
    );

Map<String, dynamic> _$$ChatMessageParamsImplToJson(
        _$ChatMessageParamsImpl instance) =>
    <String, dynamic>{
      'chatID': instance.chatID,
      'offset': instance.offset,
      'limit': instance.limit,
    };
