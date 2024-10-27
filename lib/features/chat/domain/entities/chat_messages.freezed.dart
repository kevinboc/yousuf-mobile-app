// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_messages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatMessages _$ChatMessagesFromJson(Map<String, dynamic> json) {
  return _ChatMessages.fromJson(json);
}

/// @nodoc
mixin _$ChatMessages {
  List<Message> get messageList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatMessagesCopyWith<ChatMessages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessagesCopyWith<$Res> {
  factory $ChatMessagesCopyWith(
          ChatMessages value, $Res Function(ChatMessages) then) =
      _$ChatMessagesCopyWithImpl<$Res, ChatMessages>;
  @useResult
  $Res call({List<Message> messageList});
}

/// @nodoc
class _$ChatMessagesCopyWithImpl<$Res, $Val extends ChatMessages>
    implements $ChatMessagesCopyWith<$Res> {
  _$ChatMessagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageList = null,
  }) {
    return _then(_value.copyWith(
      messageList: null == messageList
          ? _value.messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessagesImplCopyWith<$Res>
    implements $ChatMessagesCopyWith<$Res> {
  factory _$$ChatMessagesImplCopyWith(
          _$ChatMessagesImpl value, $Res Function(_$ChatMessagesImpl) then) =
      __$$ChatMessagesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Message> messageList});
}

/// @nodoc
class __$$ChatMessagesImplCopyWithImpl<$Res>
    extends _$ChatMessagesCopyWithImpl<$Res, _$ChatMessagesImpl>
    implements _$$ChatMessagesImplCopyWith<$Res> {
  __$$ChatMessagesImplCopyWithImpl(
      _$ChatMessagesImpl _value, $Res Function(_$ChatMessagesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageList = null,
  }) {
    return _then(_$ChatMessagesImpl(
      messageList: null == messageList
          ? _value._messageList
          : messageList // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessagesImpl implements _ChatMessages {
  const _$ChatMessagesImpl({final List<Message> messageList = const []})
      : _messageList = messageList;

  factory _$ChatMessagesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessagesImplFromJson(json);

  final List<Message> _messageList;
  @override
  @JsonKey()
  List<Message> get messageList {
    if (_messageList is EqualUnmodifiableListView) return _messageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messageList);
  }

  @override
  String toString() {
    return 'ChatMessages(messageList: $messageList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessagesImpl &&
            const DeepCollectionEquality()
                .equals(other._messageList, _messageList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_messageList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessagesImplCopyWith<_$ChatMessagesImpl> get copyWith =>
      __$$ChatMessagesImplCopyWithImpl<_$ChatMessagesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessagesImplToJson(
      this,
    );
  }
}

abstract class _ChatMessages implements ChatMessages {
  const factory _ChatMessages({final List<Message> messageList}) =
      _$ChatMessagesImpl;

  factory _ChatMessages.fromJson(Map<String, dynamic> json) =
      _$ChatMessagesImpl.fromJson;

  @override
  List<Message> get messageList;
  @override
  @JsonKey(ignore: true)
  _$$ChatMessagesImplCopyWith<_$ChatMessagesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
