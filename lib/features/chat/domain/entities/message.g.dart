// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      text: json['text'] as String,
      fromUser: json['fromUser'] as bool,
      time: DateTime.parse(json['DateTime'] as String),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'fromUser': instance.fromUser,
      'DateTime': instance.time.toIso8601String(),
    };
