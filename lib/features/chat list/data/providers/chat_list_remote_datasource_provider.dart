import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat%20list/data/datasources/chat_list_remote_datasource.dart';

final chatListRemoteDataSourceProvider = Provider((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return ChatListRemoteDataSourceImpl(dio: dioClient);
});
