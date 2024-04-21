import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/chat_messages.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/message.dart';
import 'package:yousuf_mobile_app/features/chat/domain/providers/retrieve_chat_messages_provider.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/retrieve_chat_messages.dart';

// @freezed
// class ChatMessagesState with $_ChatMessagesState{
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
  @override
  final ref;
  MessageList(this.ref) : super([]) {
    retrieveChatHistory();
  }
  Future<void> retrieveChatHistory() async {
    final RetrieveChatMessages chatHistoryProvider =
        ref.watch(retrieveChatMessagesProvider);
    final messages = await chatHistoryProvider
        .call(const ChatMessagesParams(chatID: 0, userID: 0));
    messages.fold((l) => null, (r) => state = r.messageList);
  }

  void addMessage(String text, bool fromUser, int chatID, int userID) {
    state = [
      ...state,
      Message(text: text, fromUser: fromUser, time: DateTime.now())
    ];
  }

  List<Message> get messageList => state;
}

final messageListProvider =
    StateNotifierProvider<MessageList, List<Message>>((ref) {
  return MessageList(ref);
});
