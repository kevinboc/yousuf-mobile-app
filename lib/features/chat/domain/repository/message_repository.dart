// import 'package:dartz/dartz.dart';
// import 'package:yousuf_mobile_app/core/core.dart';
import 'package:yousuf_mobile_app/features/chat/data/models/message_model.dart';

abstract class MessageListRemoteDataSource {
  // Future<Either<Failure, List<Message>>> getMessages(String userEmail, int chatID);
  Future<List<Message>> getMessages(String userEmail, int chatID);
  Future<Message> getResponse(
      String requestMessage, String userEmail, int chatID);
}
