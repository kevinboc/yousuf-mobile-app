import 'package:flutter/material.dart';

class MessageEntity {
  final String message;
  final String userEmail;
  final bool isFromUser;
  final TimeOfDay time;
  MessageEntity(
      {required this.message,
      required this.time,
      required this.isFromUser,
      required this.userEmail});
}
