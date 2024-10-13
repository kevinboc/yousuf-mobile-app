import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/chat_entity.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/providers/create_new_chat_provider.dart';
import 'package:yousuf_mobile_app/features/chat%20list/domain/usecases/make_new_chat.dart';

Future createNewChat(BuildContext context) {
  TextEditingController _controller = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) => Consumer(
            builder: (context, ref, child) {
              return AlertDialog(
                title: const Text("Create New Chat"),
                content: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(hintText: "Name of Chat"),
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () {
                        String chatName = _controller.text;
                        ref
                            .read(createNewChatProvider)
                            .call(CreateNewChatParams(chatName: chatName));
                        Navigator.pop(context);
                      },
                      child: const Text("Create"))
                ],
              );
            },
          ));
}

            // print("pressed");
            // Dio dio = Dio();
            // s.FlutterSecureStorage secureStorage = s.FlutterSecureStorage();
            // final token = await secureStorage.read(key: 'login_token') as String;
            // print(token);
            // dio.post('https://yousuf195.azurewebsites.net/chats',
            //     options: Options(
            //       headers: {'Authorization': token},
            //     ),
            //     data: FormData.fromMap({'title': 'chat1'}));
            // print("request done");