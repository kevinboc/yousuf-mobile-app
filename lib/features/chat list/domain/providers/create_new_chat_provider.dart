import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/providers/chat_list_repository_provider.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/usecases/make_new_chat.dart';

final createNewChatProvider = Provider((ref) {
  final repo = ref.watch(chatListRepositoryProvider);
  return CreateNewChat(repo);
});
