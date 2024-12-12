import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/message.dart';

part 'chat_screen_state.freezed.dart';

enum ChatScreenConcreteState {
  loading,
  empty,
  failure,
  loaded,
  initial,
  waitingForResponse
}

@freezed
class ChatScreenState with _$ChatScreenState {
  const factory ChatScreenState(
      {@Default(false) bool hasData,
      @Default(ChatScreenConcreteState.initial) ChatScreenConcreteState state,
      @Default('') String message,
      @Default([]) List<Message> data,
      @Default(true) bool isEmpty}) = _ChatScrenState;
}
