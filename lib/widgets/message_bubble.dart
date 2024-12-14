import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/models/chat_message.dart';

final Logger _logger = Logger();

class MessageBubble extends StatefulWidget {
  const MessageBubble({required this.chatMessage, super.key});

  final ChatMessage chatMessage;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  late FlutterTts flutterTts;
  var playing = false;

  Future<void> initTts() async {
    flutterTts = FlutterTts();
    // if ios, set shared instance to true
    // if (Theme.of(context).platform == TargetPlatform.iOS) {
    //   await flutterTts.setSharedInstance(true);
    // }
    await flutterTts.setLanguage("en-US");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);

    flutterTts.setCompletionHandler(() {
      if (mounted) {
        setState(() {
          playing = false;
        });
      }
    });

    flutterTts.setErrorHandler((msg) {
      _logger.e("error: $msg");
      setState(() {
        playing = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    initTts();
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  Future<void> toggleSpeech(String text) async {
    if (playing) {
      await flutterTts.stop();
      setState(() {
        playing = false;
      });
    } else {
      await flutterTts.speak(text);
      setState(() {
        playing = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.chatMessage.isUser
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: widget.chatMessage.isUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: widget.chatMessage.isUser
                      ? Colors.grey[300]
                      : Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                child: Text(
                  widget.chatMessage.message,
                  style: TextStyle(
                    color: widget.chatMessage.isUser
                        ? Colors.black
                        : Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            if (!widget.chatMessage.isUser)
              IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(playing ? Icons.pause : Icons.play_arrow),
                onPressed: () => toggleSpeech(widget.chatMessage.message),
              ),
          ],
        ),
      ],
    );
  }
}
