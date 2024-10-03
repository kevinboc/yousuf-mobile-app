import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/features/chat%20list/widgets/chat_list_view.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/message_list_view.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/side_navagation_bar.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/text_input_widget.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/trailing_options.dart';

class ChatPage extends StatelessWidget {
  //this gets passed chatid, title, userid(or from riverpod)?(for requests)
  const ChatPage(this.chatDetails, {super.key});
  final ChatDetails chatDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: menuOptions(context)),
        appBar: AppBar(
          title: Text(chatDetails.chatTitle),
          actions: [trailingOptions(context)],
        ),
        body: Column(children: [
          const Expanded(child: MessageListView()),
          TextInputWidget(),
        ]));
  }
}
