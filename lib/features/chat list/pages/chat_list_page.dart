import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/features/chat%20list/widgets/chat_list_view.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/side_navagation_bar.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: menuOptions(context),
      ),
      appBar: AppBar(
        title: const Text("Chats"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              //navigate to create new chat page
              //user chooses from new chat or new ai?
            },
          )
        ],
      ),
      body: const ChatListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
