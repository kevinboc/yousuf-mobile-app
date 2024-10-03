// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_chat_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserChatList _$UserChatListFromJson(Map<String, dynamic> json) {
  return _UserChatList.fromJson(json);
}

/// @nodoc
mixin _$UserChatList {
  List<ChatEntity>? get userChatList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserChatListCopyWith<UserChatList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserChatListCopyWith<$Res> {
  factory $UserChatListCopyWith(
          UserChatList value, $Res Function(UserChatList) then) =
      _$UserChatListCopyWithImpl<$Res, UserChatList>;
  @useResult
  $Res call({List<ChatEntity>? userChatList});
}

/// @nodoc
class _$UserChatListCopyWithImpl<$Res, $Val extends UserChatList>
    implements $UserChatListCopyWith<$Res> {
  _$UserChatListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userChatList = freezed,
  }) {
    return _then(_value.copyWith(
      userChatList: freezed == userChatList
          ? _value.userChatList
          : userChatList // ignore: cast_nullable_to_non_nullable
              as List<ChatEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserChatListImplCopyWith<$Res>
    implements $UserChatListCopyWith<$Res> {
  factory _$$UserChatListImplCopyWith(
          _$UserChatListImpl value, $Res Function(_$UserChatListImpl) then) =
      __$$UserChatListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChatEntity>? userChatList});
}

/// @nodoc
class __$$UserChatListImplCopyWithImpl<$Res>
    extends _$UserChatListCopyWithImpl<$Res, _$UserChatListImpl>
    implements _$$UserChatListImplCopyWith<$Res> {
  __$$UserChatListImplCopyWithImpl(
      _$UserChatListImpl _value, $Res Function(_$UserChatListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userChatList = freezed,
  }) {
    return _then(_$UserChatListImpl(
      userChatList: freezed == userChatList
          ? _value._userChatList
          : userChatList // ignore: cast_nullable_to_non_nullable
              as List<ChatEntity>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserChatListImpl implements _UserChatList {
  const _$UserChatListImpl({final List<ChatEntity>? userChatList})
      : _userChatList = userChatList;

  factory _$UserChatListImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserChatListImplFromJson(json);

  final List<ChatEntity>? _userChatList;
  @override
  List<ChatEntity>? get userChatList {
    final value = _userChatList;
    if (value == null) return null;
    if (_userChatList is EqualUnmodifiableListView) return _userChatList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserChatList(userChatList: $userChatList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserChatListImpl &&
            const DeepCollectionEquality()
                .equals(other._userChatList, _userChatList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_userChatList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserChatListImplCopyWith<_$UserChatListImpl> get copyWith =>
      __$$UserChatListImplCopyWithImpl<_$UserChatListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserChatListImplToJson(
      this,
    );
  }
}

abstract class _UserChatList implements UserChatList {
  const factory _UserChatList({final List<ChatEntity>? userChatList}) =
      _$UserChatListImpl;

  factory _UserChatList.fromJson(Map<String, dynamic> json) =
      _$UserChatListImpl.fromJson;

  @override
  List<ChatEntity>? get userChatList;
  @override
  @JsonKey(ignore: true)
  _$$UserChatListImplCopyWith<_$UserChatListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
