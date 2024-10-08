import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/chat_entity.dart';
import 'package:yousuf_mobile_app/features/chat%20list/pages/providers/riverpod/chat_list_provider.dart';
import 'package:yousuf_mobile_app/features/chat%20list/pages/providers/riverpod/states/chat_list_state.dart';
import 'package:yousuf_mobile_app/features/chat%20list/widgets/chat_trailing_options.dart';

class ChatListView extends ConsumerWidget {
  const ChatListView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatListNotifierProvider);
    ref.listen(chatListNotifierProvider.select((value) => value),
        //handles side effects like navigating and showing snackbar
        ((previous, next) {
      if (next.state == ChatListConcreteState.failure) {
        //failure state could not load show error at bottom
        if (next.message.isNotEmpty) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(next.message)));
        }
      }
    }));
    //TODO: ADD DIFFERENT SCREEN FOR WHEN STATE IS INITIAL OR IT IS EMPTY
    return state.state == ChatListConcreteState.loaded
        ? ListView.builder(
            itemCount: state.chats.userChatList!.length,
            itemBuilder: (context, index) {
              ChatEntity chatName = state.chats.userChatList!.elementAt(index);
              return Card(
                child: ListTile(
                  title: Text(
                    chatName.title as String,
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: trailingChatOptions(context),
                  onTap: () {
                    //navigate to chat
                    // context.go('/chat',pathParameters:{'id':cList[index].chatID, 'title':chatList[index].title});

                    context.go('/chat',
                        extra: ChatDetails(
                            chatID: chatName.id as String,
                            chatTitle: chatName.title as String));
                  },
                ),
              );
            })
        : Container(
            alignment: const Alignment(0, -0.1),
            child: const CircularProgressIndicator(),
          );
  }
}

class ChatDetails {
  String chatID;
  String chatTitle;
  ChatDetails({required this.chatID, required this.chatTitle});
}
