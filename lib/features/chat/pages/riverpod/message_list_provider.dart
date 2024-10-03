import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/chat_messages.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/message.dart';
import 'package:yousuf_mobile_app/features/chat/domain/providers/retrieve_chat_messages_provider.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/retrieve_chat_messages.dart';

// @freezed
// class ChatMessagesState with _$ChatMessagesState{
//   const factory ChatMessagesState({
//     @Default(true) bool isLoading,
//     required ChatMessages chatMessages,
//   }) = _ChatMessagesState;

//   const ChatMessagesState._();
// }

// class ChatMessagesNotifier extends StateNotifier<ChatMessagesState>{
//   ChatMessagesNotifier() : super(const ChatMessagesState(chatMessages: ChatMessages()));

//   loadMessages() async {
//     state = state.copyWith(isLoading: true);

//     final chatMessagesResponse = await retrieveChatMessagesProvider
//   }
// }

class MessageList extends StateNotifier<List<Message>> {
  final StateNotifierProviderRef messageListRef;
  @override
  MessageList(this.messageListRef) : super([]) {
    retrieveChatHistory();
  }
  late final RetrieveChatMessages chatHistoryProvider =
      messageListRef.watch(retrieveChatMessagesProvider);
  // late final SendNewMessage newMessageProvider =
  //     messageListRef.watch(AddMessageProvider);
  Future<void> retrieveChatHistory() async {
    final messages = await chatHistoryProvider
        .call(const ChatMessagesParams(chatID: 0, userID: 0));
    messages.fold((l) => null, (r) => state = r.messageList);
  }

  // FutureOr<void> addMessage(
  //     String text, bool fromUser, int chatID, int userID) {
  //   //TODO: if statement(if post request is success then message gets added to state)
  //   final response = newMessageProvider();
  //   response.fold((l) {
  //     //show error message(unset message stays in textfield?)
  //   }, (r) {
  //     //clear controller
  //     state = [
  //       ...state,
  //       Message(text: text, fromUser: fromUser, time: DateTime.now())
  //     ];
  //   });
  // }

  List<Message> get messageList => state;
}

final messageListProvider =
    StateNotifierProvider<MessageList, List<Message>>((ref) {
  return MessageList(ref);
});
