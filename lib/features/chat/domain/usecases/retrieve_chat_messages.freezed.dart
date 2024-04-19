// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'retrieve_chat_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMessagesParams _$ChatMessagesParamsFromJson(Map<String, dynamic> json) {
  return _ChatMessageParams.fromJson(json);
}

/// @nodoc
mixin _$ChatMessagesParams {
  int get chatID => throw _privateConstructorUsedError;
  int get userID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessagesParamsCopyWith<ChatMessagesParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessagesParamsCopyWith<$Res> {
  factory $ChatMessagesParamsCopyWith(
          ChatMessagesParams value, $Res Function(ChatMessagesParams) then) =
      _$ChatMessagesParamsCopyWithImpl<$Res, ChatMessagesParams>;
  @useResult
  $Res call({int chatID, int userID});
}

/// @nodoc
class _$ChatMessagesParamsCopyWithImpl<$Res, $Val extends ChatMessagesParams>
    implements $ChatMessagesParamsCopyWith<$Res> {
  _$ChatMessagesParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatID = null,
    Object? userID = null,
  }) {
    return _then(_value.copyWith(
      chatID: null == chatID
          ? _value.chatID
          : chatID // ignore: cast_nullable_to_non_nullable
              as int,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageParamsImplCopyWith<$Res>
    implements $ChatMessagesParamsCopyWith<$Res> {
  factory _$$ChatMessageParamsImplCopyWith(_$ChatMessageParamsImpl value,
          $Res Function(_$ChatMessageParamsImpl) then) =
      __$$ChatMessageParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int chatID, int userID});
}

/// @nodoc
class __$$ChatMessageParamsImplCopyWithImpl<$Res>
    extends _$ChatMessagesParamsCopyWithImpl<$Res, _$ChatMessageParamsImpl>
    implements _$$ChatMessageParamsImplCopyWith<$Res> {
  __$$ChatMessageParamsImplCopyWithImpl(_$ChatMessageParamsImpl _value,
      $Res Function(_$ChatMessageParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatID = null,
    Object? userID = null,
  }) {
    return _then(_$ChatMessageParamsImpl(
      chatID: null == chatID
          ? _value.chatID
          : chatID // ignore: cast_nullable_to_non_nullable
              as int,
      userID: null == userID
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageParamsImpl implements _ChatMessageParams {
  const _$ChatMessageParamsImpl({required this.chatID, required this.userID});

  factory _$ChatMessageParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageParamsImplFromJson(json);

  @override
  final int chatID;
  @override
  final int userID;

  @override
  String toString() {
    return 'ChatMessagesParams(chatID: $chatID, userID: $userID)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageParamsImpl &&
            (identical(other.chatID, chatID) || other.chatID == chatID) &&
            (identical(other.userID, userID) || other.userID == userID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, chatID, userID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageParamsImplCopyWith<_$ChatMessageParamsImpl> get copyWith =>
      __$$ChatMessageParamsImplCopyWithImpl<_$ChatMessageParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageParamsImplToJson(
      this,
    );
  }
}

abstract class _ChatMessageParams implements ChatMessagesParams {
  const factory _ChatMessageParams(
      {required final int chatID,
      required final int userID}) = _$ChatMessageParamsImpl;

  factory _ChatMessageParams.fromJson(Map<String, dynamic> json) =
      _$ChatMessageParamsImpl.fromJson;

  @override
  int get chatID;
  @override
  int get userID;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessageParamsImplCopyWith<_$ChatMessageParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
