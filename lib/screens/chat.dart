import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/models/chat.dart';
import 'package:yousuf_mobile_app/widgets/chat_list.dart';
import 'package:yousuf_mobile_app/widgets/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({required this.loadingChat, super.key});

  final Future<Chat> loadingChat;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Future<Chat> _chatFuture;
  var _chatTitle = "Loading chat...";

  @override
  void initState() {
    _chatFuture = widget.loadingChat;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_chatTitle),
      ),
      body: FutureBuilder<Chat>(
        future: _chatFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                _chatTitle = snapshot.data!.title;
              });
            });

            return Column(
              children: [
                Expanded(
                  child: ChatList(
                    chat: snapshot.data!,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: NewMessage(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
