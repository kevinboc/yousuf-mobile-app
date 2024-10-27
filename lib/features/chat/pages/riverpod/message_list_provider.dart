import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/message.dart';
import 'package:yousuf_mobile_app/features/chat/domain/providers/post_chat_message_provider.dart';
import 'package:yousuf_mobile_app/features/chat/domain/providers/retrieve_chat_messages_provider.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/post_chat_message.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/retrieve_chat_messages.dart';
import 'package:yousuf_mobile_app/features/chat/pages/riverpod/states/chat_id_provider.dart';
import 'package:yousuf_mobile_app/features/chat/pages/riverpod/states/chat_screen_state.dart';

class ChatScreenNotifier extends AutoDisposeNotifier<ChatScreenState> {
  late final RetrieveChatMessages _retrieveChatMessages;
  late final PostChatMessage _postChatMessage;

  @override
  ChatScreenState build() {
    _postChatMessage = ref.watch(postChatMessagesProvider);
    _retrieveChatMessages = ref.watch(retrieveChatMessagesProvider);
    loadMessageHistory();
    state = const ChatScreenState();
    return state;
  }

  Future<void> sendMessage(String prompt, String chatID) async {
    //TODO: ADD USER MESSAGE TO STATE
    state = state.copyWith(
        state: ChatScreenConcreteState.waitingForResponse,
        data: [Message(message: prompt, fromUser: true), ...state.data]);
    final response = await _postChatMessage
        .call(MessageParams(prompt: prompt, chatID: chatID));
    response.fold((l) {
      state = state.copyWith(
          state: ChatScreenConcreteState.failure, message: l.toString());
    }, (success) {
      state = state.copyWith(
          data: [success, ...state.data],
          state: ChatScreenConcreteState.loaded);
    });
  }

  Future<void> loadMessageHistory() async {
    String chatID = await ref.read(chatIDProvider);
    state = state.copyWith(state: ChatScreenConcreteState.loading);
    final response =
        await _retrieveChatMessages.call(ChatMessagesParams(chatID: chatID));
    response.fold((l) {
      state = state.copyWith(
          state: ChatScreenConcreteState.failure, message: l.toString());
    }, (success) {
      state = state.copyWith(
          data: success.messageList,
          state: ChatScreenConcreteState.loaded,
          hasData: success.messageList.isNotEmpty,
          isEmpty: success.messageList.isEmpty);
    });
  }
}

final chatScreenNotifierProvider =
    NotifierProvider.autoDispose<ChatScreenNotifier, ChatScreenState>(() {
  return ChatScreenNotifier();
});
