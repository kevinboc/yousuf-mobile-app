import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatList extends StateNotifier<List<String>> {
  ChatList() : super([]);
  void getChatList() {}
  void deleteChat(int chatID) {}
}

final chatListProvider =
    StateNotifierProvider<ChatList, List<String>>((ref) => ChatList());
