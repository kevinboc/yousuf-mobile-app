import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/data.dart';

// class Message extends StateNotifier<String> {
//   Message() : super("");
//   void setMessage(String m) => state = m;
//   void removeMessage() => state = "";
//   void incMessage() => state = "s";
// }
class MessageList extends StateNotifier<List<Message>> {
  @override
  MessageList() : super([]);
  void addMessage(String text, bool fromUser) =>
      state = [...state, Message(text, fromUser, TimeOfDay.now())];
  List<Message> get messageList => state;
}

final messageListProvider =
    StateNotifierProvider<MessageList, List<Message>>((ref) => MessageList());
// final messageProvider = StateNotifierProvider((ref) => Message());

class ChatPage extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Chat"),
        ),
        body: Column(children: [
          Expanded(child: _messageListView()),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: _textInputWidget(),
          )
        ]));
  }

  Widget _textInputWidget() {
    return Consumer(builder: ((context, ref, child) {
      return TextField(
        controller: _textController,
        decoration: InputDecoration(
            suffixIcon: IconButton(
          onPressed: () => ref
              .read(messageListProvider.notifier)
              .addMessage(_textController.text, true),
          icon: const Icon(Icons.arrow_upward),
        )),
      );
    }));
  }

  Widget _messageListView() {
    return Consumer(
      builder: (context, ref, child) {
        final List<Message> messageList = ref.watch(messageListProvider);
        return ListView.builder(
          itemCount: messageList.length,
          itemBuilder: (context, index) {
            return ListTile(title: _messageItem(messageList[index]));
          },
        );
      },
    );
  }
}

Widget _messageItem(Message content) {
  var alignment =
      content.messageFromUser ? Alignment.centerRight : Alignment.centerLeft;
  return Container(
    alignment: alignment,
    child: Column(
      children: [
        Text(content.text),
      ],
    ),
  );
}
