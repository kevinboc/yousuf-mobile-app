import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/main_drawer.dart';
import 'package:yousuf_mobile_app/widgets/new_chat_message.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      appBar: AppBar(
        title: const Text("YouSuf Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
                child: Text(
              "Start your conversation with YouSuf!",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor),
            )),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: NewChatMessage(),
          ),
        ],
      ),
    );
  }
}
