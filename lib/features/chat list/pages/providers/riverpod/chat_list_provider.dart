import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/providers/get_user_chats_provider.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/usecases/get_user_chats.dart';
import 'package:yousuf_mobile_app/features/chat%20list/pages/providers/riverpod/states/chat_list_state.dart';

class ChatListNotifier extends AutoDisposeNotifier<ChatListState> {
  late final GetUserChats _getUserChatList;

  @override
  ChatListState build() {
    _getUserChatList = ref.watch(getUserChatsProvider);
    state = const ChatListState();
    loadChatList();
    return state;
  }

  Future<void> loadChatList() async {
    state =
        state.copyWith(isLoading: true, state: ChatListConcreteState.loading);
    final response = await _getUserChatList.call(NoParams());
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

// final chatListNotifierProvider =
//     AutoDisposeStateNotifierProvider<ChatListNotifier, ChatListState>((ref) {
//   return ChatListNotifier(chatListProvider: ref.watch(getUserChatsProvider));
// });

final chatListNotifierProvider =
    NotifierProvider.autoDispose<ChatListNotifier, ChatListState>(() {
  return ChatListNotifier();
});
