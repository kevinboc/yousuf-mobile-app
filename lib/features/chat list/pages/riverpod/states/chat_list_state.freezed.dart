// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatListState {
  bool get hasData => throw _privateConstructorUsedError;
  UserChatList get chats => throw _privateConstructorUsedError;
  ChatListConcreteState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isEmpty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatListStateCopyWith<ChatListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatListStateCopyWith<$Res> {
  factory $ChatListStateCopyWith(
          ChatListState value, $Res Function(ChatListState) then) =
      _$ChatListStateCopyWithImpl<$Res, ChatListState>;
  @useResult
  $Res call(
      {bool hasData,
      UserChatList chats,
      ChatListConcreteState state,
      String message,
      bool isLoading,
      bool isEmpty});

  $UserChatListCopyWith<$Res> get chats;
}

/// @nodoc
class _$ChatListStateCopyWithImpl<$Res, $Val extends ChatListState>
    implements $ChatListStateCopyWith<$Res> {
  _$ChatListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasData = null,
    Object? chats = null,
    Object? state = null,
    Object? message = null,
    Object? isLoading = null,
    Object? isEmpty = null,
  }) {
    return _then(_value.copyWith(
      hasData: null == hasData
          ? _value.hasData
          : hasData // ignore: cast_nullable_to_non_nullable
              as bool,
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as UserChatList,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ChatListConcreteState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmpty: null == isEmpty
          ? _value.isEmpty
          : isEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserChatListCopyWith<$Res> get chats {
    return $UserChatListCopyWith<$Res>(_value.chats, (value) {
      return _then(_value.copyWith(chats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatListStateImplCopyWith<$Res>
    implements $ChatListStateCopyWith<$Res> {
  factory _$$ChatListStateImplCopyWith(
          _$ChatListStateImpl value, $Res Function(_$ChatListStateImpl) then) =
      __$$ChatListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasData,
      UserChatList chats,
      ChatListConcreteState state,
      String message,
      bool isLoading,
      bool isEmpty});

  @override
  $UserChatListCopyWith<$Res> get chats;
}

/// @nodoc
class __$$ChatListStateImplCopyWithImpl<$Res>
    extends _$ChatListStateCopyWithImpl<$Res, _$ChatListStateImpl>
    implements _$$ChatListStateImplCopyWith<$Res> {
  __$$ChatListStateImplCopyWithImpl(
      _$ChatListStateImpl _value, $Res Function(_$ChatListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasData = null,
    Object? chats = null,
    Object? state = null,
    Object? message = null,
    Object? isLoading = null,
    Object? isEmpty = null,
  }) {
    return _then(_$ChatListStateImpl(
      hasData: null == hasData
          ? _value.hasData
          : hasData // ignore: cast_nullable_to_non_nullable
              as bool,
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as UserChatList,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ChatListConcreteState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isEmpty: null == isEmpty
          ? _value.isEmpty
          : isEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatListStateImpl implements _ChatListState {
  const _$ChatListStateImpl(
      {this.hasData = false,
      this.chats = const UserChatList(),
      this.state = ChatListConcreteState.initial,
      this.message = '',
      this.isLoading = false,
      this.isEmpty = true});

  @override
  @JsonKey()
  final bool hasData;
  @override
  @JsonKey()
  final UserChatList chats;
  @override
  @JsonKey()
  final ChatListConcreteState state;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isEmpty;

  @override
  String toString() {
    return 'ChatListState(hasData: $hasData, chats: $chats, state: $state, message: $message, isLoading: $isLoading, isEmpty: $isEmpty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatListStateImpl &&
            (identical(other.hasData, hasData) || other.hasData == hasData) &&
            (identical(other.chats, chats) || other.chats == chats) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isEmpty, isEmpty) || other.isEmpty == isEmpty));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, hasData, chats, state, message, isLoading, isEmpty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatListStateImplCopyWith<_$ChatListStateImpl> get copyWith =>
      __$$ChatListStateImplCopyWithImpl<_$ChatListStateImpl>(this, _$identity);
}

abstract class _ChatListState implements ChatListState {
  const factory _ChatListState(
      {final bool hasData,
      final UserChatList chats,
      final ChatListConcreteState state,
      final String message,
      final bool isLoading,
      final bool isEmpty}) = _$ChatListStateImpl;

  @override
  bool get hasData;
  @override
  UserChatList get chats;
  @override
  ChatListConcreteState get state;
  @override
  String get message;
  @override
  bool get isLoading;
  @override
  bool get isEmpty;
  @override
  @JsonKey(ignore: true)
  _$$ChatListStateImplCopyWith<_$ChatListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
