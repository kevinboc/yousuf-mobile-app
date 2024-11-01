import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/models/chat.dart';

class DrawerChatList extends StatefulWidget {
  const DrawerChatList({super.key});

  @override
  State<DrawerChatList> createState() => _DrawerChatListState();
}

class _DrawerChatListState extends State<DrawerChatList> {
  List<Chat> chatList = [
    Chat(
      id: "1",
      title: "Foobar On A Stick With Fries",
      lastUpdated: DateTime.now(),
    ),
    Chat(
      id: "2",
      title: "My afternoon with the AI",
      lastUpdated: DateTime.now(),
    ),
    Chat(
      id: "3",
      title: "The time I met a chatbot",
      lastUpdated: DateTime.now(),
    ),
    Chat(
      id: "4",
      title: "Brave New World: Analysis",
      lastUpdated: DateTime.now(),
    ),
    Chat(
      id: "5",
      title: "Quantum Entanglement",
      lastUpdated: DateTime.now(),
    ),
    Chat(
      id: "6",
      title: "Shrek 5: The Return of the Ogre",
      lastUpdated: DateTime.now(),
    ),
    Chat(
      id: "7",
      title: "The time I met a chatbot",
      lastUpdated: DateTime.now(),
    ),
    Chat(
      id: "8",
      title: "King Crimson: The Band",
      lastUpdated: DateTime.now(),
    ),
    Chat(
      id: "9",
      title: "Why I hate the color blue",
      lastUpdated: DateTime.now(),
    ),
    Chat(
      id: "10",
      title: "Top 10 reasons why I love the color blue",
      lastUpdated: DateTime.now(),
    ),
    Chat(
      id: "11",
      title: "The time I met a chatbot",
      lastUpdated: DateTime.now(),
    ),
    Chat(
      id: "12",
      title: "Quick brown fox jumps over the lazy dog",
      lastUpdated: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final chat in chatList) _DrawerChatItem(chat: chat),
        ],
      ),
    );
  }
}

class _DrawerChatItem extends StatelessWidget {
  const _DrawerChatItem({required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.chat_bubble,
        size: 26,
      ),
      title: Text(
        chat.title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 20,
            ),
        overflow: TextOverflow.fade,
        softWrap: false,
      ),
      onTap: () {},
    );
  }
}
