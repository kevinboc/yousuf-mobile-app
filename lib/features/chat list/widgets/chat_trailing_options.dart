import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat%20list/pages/providers/riverpod/chat_list_provider.dart';

Widget trailingChatOptions(BuildContext buildContext) {
  return PopupMenuButton(
      itemBuilder: (context) => [
            const PopupMenuItem(
              child: Text("Rename Chat"),
            ),
            const PopupMenuItem(child: Text("Upload Files")),
            const PopupMenuItem(child: Text("Delete Chat"))
          ]);
}

class trailingOptions extends ConsumerWidget {
  const trailingOptions({super.key, required this.chatID});
  final chatID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
        itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("Rename Chat"),
                onTap: () {
                  //take chatID in and call method to do action
                  ref.read(chatListNotifierProvider.notifier);
                },
              ),
              PopupMenuItem(child: const Text("Upload Files"), onTap: () {}),
              PopupMenuItem(child: const Text("Delete Chat"), onTap: () {})
            ]);
  }
}
