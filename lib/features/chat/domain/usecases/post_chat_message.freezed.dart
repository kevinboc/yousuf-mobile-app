// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageParams _$MessageParamsFromJson(Map<String, dynamic> json) {
  return _MessageParams.fromJson(json);
}

/// @nodoc
mixin _$MessageParams {
  String get prompt => throw _privateConstructorUsedError;
  String get chatID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageParamsCopyWith<MessageParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageParamsCopyWith<$Res> {
  factory $MessageParamsCopyWith(
          MessageParams value, $Res Function(MessageParams) then) =
      _$MessageParamsCopyWithImpl<$Res, MessageParams>;
  @useResult
  $Res call({String prompt, String chatID});
}

/// @nodoc
class _$MessageParamsCopyWithImpl<$Res, $Val extends MessageParams>
    implements $MessageParamsCopyWith<$Res> {
  _$MessageParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
    Object? chatID = null,
  }) {
    return _then(_value.copyWith(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      chatID: null == chatID
          ? _value.chatID
          : chatID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageParamsImplCopyWith<$Res>
    implements $MessageParamsCopyWith<$Res> {
  factory _$$MessageParamsImplCopyWith(
          _$MessageParamsImpl value, $Res Function(_$MessageParamsImpl) then) =
      __$$MessageParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String prompt, String chatID});
}

/// @nodoc
class __$$MessageParamsImplCopyWithImpl<$Res>
    extends _$MessageParamsCopyWithImpl<$Res, _$MessageParamsImpl>
    implements _$$MessageParamsImplCopyWith<$Res> {
  __$$MessageParamsImplCopyWithImpl(
      _$MessageParamsImpl _value, $Res Function(_$MessageParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
    Object? chatID = null,
  }) {
    return _then(_$MessageParamsImpl(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      chatID: null == chatID
          ? _value.chatID
          : chatID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageParamsImpl implements _MessageParams {
  const _$MessageParamsImpl({required this.prompt, required this.chatID});

  factory _$MessageParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageParamsImplFromJson(json);

  @override
  final String prompt;
  @override
  final String chatID;

  @override
  String toString() {
    return 'MessageParams(prompt: $prompt, chatID: $chatID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageParamsImpl &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.chatID, chatID) || other.chatID == chatID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, prompt, chatID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageParamsImplCopyWith<_$MessageParamsImpl> get copyWith =>
      __$$MessageParamsImplCopyWithImpl<_$MessageParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageParamsImplToJson(
      this,
    );
  }
}

abstract class _MessageParams implements MessageParams {
  const factory _MessageParams(
      {required final String prompt,
      required final String chatID}) = _$MessageParamsImpl;

  factory _MessageParams.fromJson(Map<String, dynamic> json) =
      _$MessageParamsImpl.fromJson;

  @override
  String get prompt;
  @override
  String get chatID;
  @override
  @JsonKey(ignore: true)
  _$$MessageParamsImplCopyWith<_$MessageParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
