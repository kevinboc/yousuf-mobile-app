import 'package:flutter/material.dart';

Widget chatPreviewRectangle(String chatName) {
  return ListTile(
    title: Text(
      chatName,
    ),
    subtitle: Text("substtitle"),
    leading: Icon(Icons.circle),
    onTap: () {
      //navigate to chat
    },
  );
}
