// Packages
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Features
import 'package:yousuf_mobile_app/features/chat%20list/pages/chat_list_page.dart';
import 'package:yousuf_mobile_app/features/chat%20list/widgets/chat_list_view.dart';
import 'package:yousuf_mobile_app/features/upload/pages/upload_page.dart';
import 'features/features.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MyApp()));
}

final GoRouter _router = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
      path: '/',
      name: "chatlist",
      builder: (context, state) {
        return const ChatListPage();
      }),
  GoRoute(
      path: '/login',
      name: "login",
      builder: (context, state) {
        return const LoginPage();
      }),
  GoRoute(
      path: '/register',
      name: "register",
      builder: (context, state) {
        return const RegisterPage();
      }),
  GoRoute(
      path: '/chat',
      name: "chat",
      builder: (context, state) {
        final ChatDetails details = state.extra as ChatDetails;
        return ChatPage(details);
      },
      routes: [
        GoRoute(
            path: 'upload',
            builder: (context, state) {
              final chatID = state.extra as String;
              return UploadPage(chatID);
            })
      ])
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Yousef',
    );
  }
}
