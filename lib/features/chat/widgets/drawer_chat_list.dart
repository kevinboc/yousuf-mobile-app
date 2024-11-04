import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/core/api/api_list.dart';
import 'package:yousuf_mobile_app/core/api/dio_client.dart';
import 'package:yousuf_mobile_app/models/chat.dart';
import 'package:yousuf_mobile_app/screens/chat.dart';

final _dio = DioClient();
final Logger _logger = Logger();

const FlutterSecureStorage storage = FlutterSecureStorage();

class DrawerChatList extends StatefulWidget {
  const DrawerChatList({super.key});

  @override
  State<DrawerChatList> createState() => _DrawerChatListState();
}

class _DrawerChatListState extends State<DrawerChatList> {
  bool _isLoading = true;
  List<Chat> chatList = [];

  Future<void> _fetchChats() async {
    String? token = await storage.read(key: 'login_token');

    final response = await _dio.getRequest(
      APIList.chats,
      token: token,
      converter: (response) {
        List<Chat> chatList = [];
        for (final chat in response) {
          chatList.add(Chat(
            id: chat['id'],
            title: chat['title'],
            lastUpdated: DateTime.now(),
          ));
        }
        return chatList;
      },
      isIsolate: false,
    );

    response.fold((error) {
      _logger.e("Error getting chat list: $error");
    }, (chatList) {
      setState(() {
        this.chatList = chatList;
      });
    });

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchChats();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          for (final chat in chatList) _DrawerChatItem(chat: chat),
        ],
      ),
    );
  }
}

class _DrawerChatItem extends StatelessWidget {
  const _DrawerChatItem({required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.chat_bubble,
        size: 26,
      ),
      title: Text(
        chat.title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 20,
            ),
        overflow: TextOverflow.fade,
        softWrap: false,
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (ctx) => ChatScreen(loadingChat: Future.value(chat))),
        );
      },
    );
  }
}
