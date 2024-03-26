import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat/data/models/message_model.dart';
import 'package:yousuf_mobile_app/features/chat/pages/riverpod/message_list_provider.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/message_item.dart';

class MessageListView extends ConsumerWidget {
  const MessageListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Message> messageList = ref.watch(messageListProvider);
    return ListView.builder(
      itemCount: messageList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: messageItem(messageList[index]),
        );
      },
    );
  }
}
