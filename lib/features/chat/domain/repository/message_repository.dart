import 'package:dartz/dartz.dart';
import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat/data/models/chat_messages.dart';
// import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat/domain/entities/message.dart';

abstract class MessageReopsitory {
  Future<Either<Failure, Message>> getMessages(int chatID, int userID);
  // Future<List<Message>> getMessages(String userEmail, int chatID);
  Future<Message> getResponse(
      String requestMessage, String userEmail, int chatID);
  Future<Either<Failure, ChatMessages>> getChatMessages(int chatID, int userID);
}
