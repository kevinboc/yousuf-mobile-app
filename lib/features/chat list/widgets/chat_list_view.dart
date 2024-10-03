import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/chat_entity.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/user_chat_list.dart';
import 'package:yousuf_mobile_app/features/chat%20list/pages/riverpod/chat_list_provider.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/retrieve_chat_messages.dart';

class ChatListView extends ConsumerWidget {
  const ChatListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final List<String> chatList = ref.watch(chatListProvider);
    final List<ChatEntity> chatList = [
      ChatEntity(1, 'title1'),
      ChatEntity(2, 'title2')
    ];
    final List<String> stringList = ['o', '2', '3'];
    final List<int> intList = [1, 2, 3];
    // final UserChatList cList = ref.watch(chatListProvider);
    // final List<ChatEntity> t =cList.userChatList as List<ChatEntity>;
    final chatListStateNotifier = ref.watch(chatListNotifierProvider);
    // final List<ChatEntity> cList =
    //     chatListStateNotifier.chats.userChatList as List<ChatEntity>;
    //TODO: ADD DIFFERENT SCREEN FOR WHEN STATE IS INITIAL OR IT IS EMPTY
    return chatListStateNotifier.isLoading
        ? const CircularProgressIndicator()
        : ListView.builder(
            itemCount: chatList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(chatList[index].title as String),
                subtitle: const Text("substtitle"),
                // leading: const Icon(Icons.circle),
                // trailing: trailingChatOptions(context),
                onTap: () {
                  //navigate to chat
                  // context.go('/chat',pathParameters:{'id':cList[index].chatID, 'title':chatList[index].title});

                  // context.go('/chat',
                  //     extra: ChatDetails(
                  //         chatID: chatList[index].chatID as int,
                  //         chatTitle: chatList[index].title as String));
                },
              );
            });
  }
}

class ChatDetails {
  int chatID;
  String chatTitle;
  ChatDetails({required this.chatID, required this.chatTitle});
}

Widget showChatList(List<ChatEntity> chatList) {
  return ListView.builder(
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(chatList[index].title as String),
          subtitle: const Text("substtitle"),
          // leading: const Icon(Icons.circle),
          // trailing: trailingChatOptions(context),
          onTap: () {
            //navigate to chat
            // context.go('/chat',pathParameters:{'id':cList[index].chatID, 'title':chatList[index].title});

            // context.go('/chat',
            //     extra: ChatDetails(
            //         chatID: chatList[index].chatID as int,
            //         chatTitle: chatList[index].title as String));
          },
        );
      });
}
