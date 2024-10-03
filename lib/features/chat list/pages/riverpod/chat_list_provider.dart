import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/chat_entity.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/user_chat_list.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/providers/get_user_chats_provider.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/usecases/get_user_chats.dart';
import 'package:yousuf_mobile_app/features/chat%20list/pages/riverpod/states/chat_list_state.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/retrieve_chat_messages.dart';

class ChatList extends StateNotifier<List<String>> {
  ChatList() : super([]) {
    getChatList();
  }
  void getChatList() {}
  void deleteChat(int chatID) {}
}

final chatListProvider =
    StateNotifierProvider<ChatList, List<String>>((ref) => ChatList());

// part 'chat_list_provider.g.dart';
// @riverpod
// class ChatListGen extends _$ChatListGen{
//   @override
//   Future<AsyncValue<void>> build() async{
//      return const AsyncData(null);
//   }
//   Future<void> loadChatList() async{
//     state= const AsyncLoading();
//     final newState = await AsyncValue.guard(() {
//       final chatsProvider = ref.watch(getUserChatsProvider);
//       return chatsProvider.call(NoParams());
//     });
//     if(mounted){
//       state = newState;
//     }
//   }
// }
class ChatListNotifier extends StateNotifier<ChatListState> {
  ChatListNotifier({required this.ref}) : super(const ChatListState());
  final StateNotifierProviderRef ref;
  late final GetUserChats chatListProvider = ref.watch(getUserChatsProvider);

  Future<void> loadChatList() async {
    state =
        state.copyWith(isLoading: true, state: ChatListConcreteState.loading);
    final response = await chatListProvider.call(NoParams());
    response.fold((l) {
      state = state.copyWith(
          isLoading: false,
          state: ChatListConcreteState.failure,
          message: l.toString());
    }, (success) {
      state = state.copyWith(
          chats: success,
          isLoading: false,
          state: ChatListConcreteState.loaded,
          hasData: success.userChatList!.isNotEmpty,
          isEmpty: success.userChatList!.isEmpty);
    });
  }
}

final chatListNotifierProvider =
    AutoDisposeStateNotifierProvider<ChatListNotifier, ChatListState>((ref) {
  return ChatListNotifier(ref: ref);
});
