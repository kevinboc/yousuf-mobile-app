import 'package:yousuf_mobile_app/features/chat%20list/domain/entities/chat_entity.dart';

class ChatData extends ChatEntity {
  ChatData({required int chatID, required String title, required int userID})
      : super(chatID: chatID, title: title, userID: userID);
}
