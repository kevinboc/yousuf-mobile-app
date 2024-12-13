import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/providers/create_new_chat_provider.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/usecases/make_new_chat.dart';
import 'package:yousuf_mobile_app/features/chat%20list/widgets/chat_list_view.dart';

Future createNewChat(BuildContext context) {
  TextEditingController controller = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) => Consumer(
            builder: (context, ref, child) {
              return AlertDialog(
                title: const Text("Create New Chat"),
                content: TextField(
                  controller: controller,
                  decoration: const InputDecoration(hintText: "Name of Chat"),
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () async {
                        String chatName = controller.text;
                        final response = await ref
                            .read(createNewChatProvider)
                            .call(CreateNewChatParams(chatName: chatName));
                        response.fold(
                            //TODO: ADD FAILUR wE MESSAGE FOR CREATING NEW CHAT
                            (l) => null,
                            (success) => {
                                  context.go('/chat',
                                      extra: ChatDetails(
                                          chatID: success.id as String,
                                          chatTitle: success.title as String))
                                });
                      },
                      child: const Text("Create"))
                ],
              );
            },
          ));
}
