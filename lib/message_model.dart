import 'package:flutter/material.dart';

class Message {
  String text;
  bool messageFromUser;
  TimeOfDay time;
  Message(this.text, this.messageFromUser, this.time);
}
