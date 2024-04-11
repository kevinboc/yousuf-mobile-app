// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterParamsImpl _$$RegisterParamsImplFromJson(Map<String, dynamic> json) =>
    _$RegisterParamsImpl(
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
      first_name: json['first_name'] as String? ?? "",
      last_name: json['last_name'] as String? ?? "",
    );

Map<String, dynamic> _$$RegisterParamsImplToJson(
        _$RegisterParamsImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
    };
