import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/user_chat_list.dart';

part 'chat_list_state.freezed.dart';

enum ChatListConcreteState { initial, loading, loaded, failure }

@freezed
class ChatListState with _$ChatListState {
  const factory ChatListState(
      {@Default(false) bool hasData,
      @Default(UserChatList()) UserChatList chats,
      @Default(ChatListConcreteState.initial) ChatListConcreteState state,
      @Default('') String message,
      @Default(false) bool isLoading,
      @Default(true) bool isEmpty}) = _ChatListState;
}
