import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yousuf_mobile_app/features/chat/pages/riverpod/message_list_provider.dart';

class TextInputWidget extends ConsumerWidget {
  TextInputWidget(this.chatID, {super.key});
  final String chatID;
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
                ref
                    .read(chatScreenNotifierProvider.notifier)
                    .sendMessage(_textController.text, chatID);
                _textController.clear();
              },
              icon: const Icon(Icons.arrow_upward),
            ),
          ),
        ),
      );
    }));
  }
}
