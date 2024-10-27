// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatScreenState {
  bool get hasData => throw _privateConstructorUsedError;
  ChatScreenConcreteState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Message> get data => throw _privateConstructorUsedError;
  bool get isEmpty => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatScreenStateCopyWith<ChatScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatScreenStateCopyWith<$Res> {
  factory $ChatScreenStateCopyWith(
          ChatScreenState value, $Res Function(ChatScreenState) then) =
      _$ChatScreenStateCopyWithImpl<$Res, ChatScreenState>;
  @useResult
  $Res call(
      {bool hasData,
      ChatScreenConcreteState state,
      String message,
      List<Message> data,
      bool isEmpty});
}

/// @nodoc
class _$ChatScreenStateCopyWithImpl<$Res, $Val extends ChatScreenState>
    implements $ChatScreenStateCopyWith<$Res> {
  _$ChatScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasData = null,
    Object? state = null,
    Object? message = null,
    Object? data = null,
    Object? isEmpty = null,
  }) {
    return _then(_value.copyWith(
      hasData: null == hasData
          ? _value.hasData
          : hasData // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ChatScreenConcreteState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      isEmpty: null == isEmpty
          ? _value.isEmpty
          : isEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatScrenStateImplCopyWith<$Res>
    implements $ChatScreenStateCopyWith<$Res> {
  factory _$$ChatScrenStateImplCopyWith(_$ChatScrenStateImpl value,
          $Res Function(_$ChatScrenStateImpl) then) =
      __$$ChatScrenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hasData,
      ChatScreenConcreteState state,
      String message,
      List<Message> data,
      bool isEmpty});
}

/// @nodoc
class __$$ChatScrenStateImplCopyWithImpl<$Res>
    extends _$ChatScreenStateCopyWithImpl<$Res, _$ChatScrenStateImpl>
    implements _$$ChatScrenStateImplCopyWith<$Res> {
  __$$ChatScrenStateImplCopyWithImpl(
      _$ChatScrenStateImpl _value, $Res Function(_$ChatScrenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasData = null,
    Object? state = null,
    Object? message = null,
    Object? data = null,
    Object? isEmpty = null,
  }) {
    return _then(_$ChatScrenStateImpl(
      hasData: null == hasData
          ? _value.hasData
          : hasData // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ChatScreenConcreteState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      isEmpty: null == isEmpty
          ? _value.isEmpty
          : isEmpty // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChatScrenStateImpl implements _ChatScrenState {
  const _$ChatScrenStateImpl(
      {this.hasData = false,
      this.state = ChatScreenConcreteState.initial,
      this.message = '',
      final List<Message> data = const [],
      this.isEmpty = true})
      : _data = data;

  @override
  @JsonKey()
  final bool hasData;
  @override
  @JsonKey()
  final ChatScreenConcreteState state;
  @override
  @JsonKey()
  final String message;
  final List<Message> _data;
  @override
  @JsonKey()
  List<Message> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final bool isEmpty;

  @override
  String toString() {
    return 'ChatScreenState(hasData: $hasData, state: $state, message: $message, data: $data, isEmpty: $isEmpty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatScrenStateImpl &&
            (identical(other.hasData, hasData) || other.hasData == hasData) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.isEmpty, isEmpty) || other.isEmpty == isEmpty));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasData, state, message,
      const DeepCollectionEquality().hash(_data), isEmpty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatScrenStateImplCopyWith<_$ChatScrenStateImpl> get copyWith =>
      __$$ChatScrenStateImplCopyWithImpl<_$ChatScrenStateImpl>(
          this, _$identity);
}

abstract class _ChatScrenState implements ChatScreenState {
  const factory _ChatScrenState(
      {final bool hasData,
      final ChatScreenConcreteState state,
      final String message,
      final List<Message> data,
      final bool isEmpty}) = _$ChatScrenStateImpl;

  @override
  bool get hasData;
  @override
  ChatScreenConcreteState get state;
  @override
  String get message;
  @override
  List<Message> get data;
  @override
  bool get isEmpty;
  @override
  @JsonKey(ignore: true)
  _$$ChatScrenStateImplCopyWith<_$ChatScrenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
