import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat%20list/pages/riverpod/chat_list_provider.dart';

class ChatListView extends ConsumerWidget {
  const ChatListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final List<String> chatList = ref.watch(chatListProvider);
    final List<String> chatList = ['one', 'two', 'three'];
    return ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              chatList[index],
            ),
            subtitle: Text("substtitle"),
            leading: Icon(Icons.circle),
            onTap: () {
              //navigate to chat
            },
          );
        });
  }
}
