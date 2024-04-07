import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/message_entity.dart';

class Message extends MessageEntity {
  Message(
      {required String message,
      required String userEmail,
      required TimeOfDay time,
      required bool isFromUser})
      : super(
          message: message,
          time: time,
          isFromUser: isFromUser,
          userEmail: userEmail,
        );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
      message: json["message"],
      time: json["time"],
      isFromUser: json["isFromUser"],
      userEmail: json["userEmail"]);

  Map<String, dynamic> toJson() => {
        "userEmail": userEmail,
        "message": message,
        "time": time,
      };
}
