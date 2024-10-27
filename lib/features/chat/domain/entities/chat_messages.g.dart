// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessagesImpl _$$ChatMessagesImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessagesImpl(
      messageList: (json['messageList'] as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChatMessagesImplToJson(_$ChatMessagesImpl instance) =>
    <String, dynamic>{
      'messageList': instance.messageList,
    };
