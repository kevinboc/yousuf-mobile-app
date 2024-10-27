import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat/domain/providers/message_repository_provider.dart';
import 'package:yousuf_mobile_app/features/chat/domain/usecases/post_chat_message.dart';
import 'package:yousuf_mobile_app/features/chat/pages/riverpod/message_list_provider.dart';

class TextInputWidget extends ConsumerWidget {
  TextInputWidget(this.chatID, {super.key});
  String chatID;
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double sidePadding = MediaQuery.of(context).size.width * 0.04;
    double bottomPadding = MediaQuery.of(context).size.height * .03;
    return Consumer(builder: ((context, ref, child) {
      return Container(
        padding: EdgeInsets.fromLTRB(
            sidePadding, bottomPadding / 4, sidePadding, bottomPadding),
        height: 90,
        child: TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: "Enter Message...",
            filled: true,
            fillColor: Colors.white10,
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            suffixIcon: IconButton(
              onPressed: () async {
                // final prompt = _textController.text;
                // ref
                //     .read(messageListProvider.notifier)
                //     .addMessage(_textController.text, true, 1, 1);
                // // ref.read(messageListProvider.notifier).computerResponse();
                // Dio dio = Dio();
                // ss.FlutterSecureStorage storage = ss.FlutterSecureStorage();
                // final token = await storage.read(key: 'login_token') as String;
                // final response = await dio.post(
                //     "https://yousuf195.azurewebsites.net/chats/$chatID/message",
                //     options: Options(headers: {'Authorization': token}),
                //     data: FormData.fromMap({'prompt': _textController.text}));
                // _textController.clear();
                ref
                    .read(chatScreenNotifierProvider.notifier)
                    .sendMessage(_textController.text, chatID);
                // final getResponse = await dio.get(
                //     "https://yousuf195.azurewebsites.net/chats/$chatID?limit=16&offset=0",
                //     options: Options(headers: {'Authorization': token}));
                // print(response);
                // print(getResponse);
              },
              icon: const Icon(Icons.arrow_upward),
            ),
          ),
        ),
      );
    }));
  }
}
