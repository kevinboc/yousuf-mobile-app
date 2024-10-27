import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat/domain/providers/message_repository_provider.dart';
import 'package:yousuf_mobile_app/features/chat/domain/repository/message_repository.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/post_chat_message.dart';

//gives the messagerepository to retrieve chat messages
//allows retrieve chat messages to have calls for data
final postChatMessagesProvider = Provider<PostChatMessage>((ref) {
  //will rebuild when there are changes to messageRepository
  final MessageRepository messageRepository =
      ref.watch(messageRepositoryProvider);
  return PostChatMessage(messageRepository);
});
