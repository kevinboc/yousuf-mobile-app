import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:yousuf_mobile_app/core/api/api.dart';
import 'package:yousuf_mobile_app/models/chat.dart';
import 'package:yousuf_mobile_app/screens/chat.dart';

final _dio = DioClient();
const FlutterSecureStorage storage = FlutterSecureStorage();

class NewChatMessage extends StatefulWidget {
  const NewChatMessage({super.key});

  @override
  State<NewChatMessage> createState() => _NewChatMessageState();
}

class _NewChatMessageState extends State<NewChatMessage> {
  final TextEditingController _controller = TextEditingController();
  final Logger _logger = Logger();
  final _speechToText = SpeechToText();
  var _listening = false;

  Future<Chat> _createNewChat(String enteredMessage) async {
    String? token = await storage.read(key: 'login_token');

    final response = await _dio.postRequest(
      "${APIList.chats}/create",
      data: {
        'prompt': enteredMessage,
      },
      converter: (res) {
        return Chat(
          id: res["chat"]['id'],
          title: res["chat"]['title'],
          lastUpdated: DateTime.now(),
        );
      },
      token: true,
      isIsolate: false,
      tokenVal: token,
    );

    return response.fold((error) {
      _logger.e("Error creating chat: $error");
      throw error;
    }, (chat) {
      return chat;
    });
  }

  void _sendMessage() async {
    final enteredMessage = _controller.text;

    if (enteredMessage.trim().isEmpty) {
      return;
    }

    FocusScope.of(context).unfocus();

    _controller.clear();

    // Navigate to new chat screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) =>
            ChatScreen(loadingChat: _createNewChat(enteredMessage)),
      ),
    );
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
            onPressed: _sendMessage,
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
