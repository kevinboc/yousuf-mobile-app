import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat%20list/data/providers/chat_list_remote_datasource_provider.dart';
import 'package:yousuf_mobile_app/features/chat%20list/data/repository/chat_list_repository_impl.dart';

final chatListRepositoryProvider = Provider((ref) {
  final chatListRemoteDataSource = ref.watch(chatListRemoteDataSourceProvider);
  return ChatListRepositoryImpl(chatListRemoteDataSource);
});
