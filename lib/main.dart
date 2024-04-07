import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'features/features.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final GoRouter _router = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
      path: '/',
      name: "chat",
      builder: (context, state) {
        return const ChatPage();
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
