import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chatscreen_controller.dart';
import 'message_model.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  // final ChatScreenController = Get.find();
  final ChatScreenController cScreenController =
      Get.put(ChatScreenController());
  final TextEditingController _textEditingController = TextEditingController();
  void submitMessage() {
    cScreenController.newUserMessage(_textEditingController.text);
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: Column(
          children: [
            Expanded(child: _messageList()),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
              child: _inputField(),
            ),
          ],
        ));
  }

  Widget _inputField() {
    return Row(children: [
      Expanded(
          child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
            suffixIcon: IconButton(
          onPressed: submitMessage,
          icon: Icon(Icons.arrow_upward),
          tooltip: "Send",
          splashColor: Colors.green[400],
        )),
      ))
    ]);
  }

  Widget _messageList() {
    return Obx(() => ListView.builder(
          itemCount: cScreenController.messageList.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: _messageItem(cScreenController.messageList[index]));
          },
        ));
  }

  Widget _messageItem(Message displayMessage) {
    var alignment = displayMessage.messageFromUser
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
        alignment: alignment,
        child: Column(
          children: [Text(displayMessage.text)],
        ));
  }
}
