class ChatMessage {
  const ChatMessage({
    required this.message,
    required this.isUser,
  });

  final String message;
  final bool isUser;
}
