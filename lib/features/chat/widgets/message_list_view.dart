import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat/pages/riverpod/message_list_provider.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/message_item.dart';

class MessageListView extends ConsumerWidget {
  final String chatID;
  const MessageListView({super.key, required this.chatID});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatScreenNotifierProvider);
    return ListView.builder(
      itemCount: state.data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: messageItem(state.data[(index + 1 - state.data.length).abs()]),
        );
      },
    );
  }
}
