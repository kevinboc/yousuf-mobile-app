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
    // _scrollController.animateTo(_scrollController.position.maxScrollExtent,
    //     duration: Duration(seconds: 2), curve: Curves.fastOutSlowIn);
    return state.isEmpty
        //TODO: REPLACE PLACHOLDER WITH SUGGESTION TELLING USER TO ASK QUESTION OR UPLOAD FILE
        ? const Placeholder()
        : ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: messageItem(
                    state.data[(index + 1 - state.data.length).abs()]),
              );
            },
          );
  }
}
