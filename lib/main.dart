// Packages
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Features
import 'features/features.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MyApp()));
}

final GoRouter _router = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
      path: '/',
      name: "chat",
      builder: (context, state) {
        return const ChatPage();
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
  GoRoute(path: '/ai_list', builder: (context, state) => const Placeholder()),
  GoRoute(
    path: '/placeholder',
    name: "placeholder",
    builder: (context, state) => const Placeholder(),
  )
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
