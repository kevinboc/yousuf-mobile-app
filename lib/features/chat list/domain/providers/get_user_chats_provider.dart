import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/providers/chat_list_repository_provider.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/usecases/get_user_chats.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_chats_provider.g.dart';

@riverpod
GetUserChats userChatsProvider(UserChatsProviderRef ref) {
  final chatListRepository = ref.watch(chatListRepositoryProvider);
  return GetUserChats(chatListRepository);
}

final getUserChatsProvider = Provider((ref) {
  final chatListRepository = ref.watch(chatListRepositoryProvider);
  return GetUserChats(chatListRepository);
});
