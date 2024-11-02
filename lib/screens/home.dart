import 'package:flutter/material.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/main_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: const MainDrawer(),
      ),
      appBar: AppBar(
        title: const Text("YouSuf Chat"),
      ),
      body: const Text("TODO: Design the home screen"),
    );
  }
}
