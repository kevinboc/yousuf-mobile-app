import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({required this.enabled, required this.onSend, super.key});

  final Future<void> Function(String message) onSend;
  final bool enabled;

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final TextEditingController _controller = TextEditingController();
  final _speechToText = SpeechToText();
  var _listening = false;

  void _sendMessage() {
    final enteredMessage = _controller.text;
    if (enteredMessage.trim().isEmpty) {
      return;
    }

    FocusScope.of(context).unfocus();

    _controller.clear();

    // Fetch response from LLM
    widget.onSend(enteredMessage);
  }

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    await _speechToText.initialize(onStatus: (status) {
      if (status == 'listening') {
        setState(() {
          _listening = true;
        });
      } else {
        setState(() {
          _listening = false;
        });
      }
    });
    setState(() {});
  }

  /// Each time to start a speech recognition session
  Future<void> _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  Future<void> _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    var newText = result.recognizedWords;
    _controller.value = _controller.value.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _speechToText.stop();
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
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 150),
              child: TextField(
                controller: _controller,
                decoration:
                    const InputDecoration(labelText: 'Send a message...'),
                maxLines: null,
              ),
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: const Icon(Icons.send),
            onPressed: widget.enabled ? _sendMessage : null,
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(_listening ? Icons.stop : Icons.mic),
            onPressed: () async {
              if (await _speechToText.hasPermission &&
                  _speechToText.isNotListening) {
                await _startListening();
              } else if (_speechToText.isListening) {
                await _stopListening();
              } else {
                _initSpeech();
              }
            },
          ),
        ],
      ),
    );
  }
}
