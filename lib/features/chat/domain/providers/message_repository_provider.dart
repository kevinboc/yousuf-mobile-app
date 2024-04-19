import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat/data/datasources/message_remote_source.dart';
import 'package:yousuf_mobile_app/features/chat/data/providers/message_data_source_provider.dart';
import 'package:yousuf_mobile_app/features/chat/data/repositories/message_repository_impl.dart';
import 'package:yousuf_mobile_app/features/chat/domain/repository/message_repository.dart';

final messageRepositoryProvider = Provider<MessageRepository>((ref) {
  //from core
  final DioClient dioClient = ref.watch(dioClientProvider);
  final NetworkInfo networkInfo = ref.watch(networkInfoProvider);
  //implemented in chat/data/providers
  final MessageRemoteDataSource messageRemoteDataSource =
      ref.watch(messageDataSourceProvider(dioClient));
  return MessageRepositoryImpl(
      networkInfo: networkInfo, remoteDataSource: messageRemoteDataSource);
});
