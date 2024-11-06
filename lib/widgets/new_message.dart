import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({required this.enabled, required this.onSend, super.key});

  final Future<void> Function(String message) onSend;
  final bool enabled;

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final TextEditingController _controller = TextEditingController();
  final Logger _logger = Logger();

  void _sendMessage() {
    final enteredMessage = _controller.text;
    if (enteredMessage.trim().isEmpty) {
      return;
    }

    FocusScope.of(context).unfocus();

    _controller.clear();

    // Send message to LLM
    _logger.i("Message sent: $enteredMessage");

    // Fetch response from LLM
    widget.onSend(enteredMessage);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Send a message...'),
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: const Icon(Icons.send),
            onPressed: widget.enabled ? _sendMessage : null,
          )
        ],
      ),
    );
  }
}
