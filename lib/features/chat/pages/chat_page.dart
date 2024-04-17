import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/message_list_view.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/side_navagation_bar.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/text_input_widget.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/trailing_options.dart';

class ChatPage extends StatelessWidget {
  //this gets passed chatid, title, userid(or from riverpod)?(for requests)
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: menuOptions(context)),
        appBar: AppBar(
          title: const Text("Chat"), //replace with ai title later
          actions: [trailingOptions(context)],
        ),
        body: Column(children: [
          const Expanded(child: MessageListView()),
          TextInputWidget(),
        ]));
  }
}
