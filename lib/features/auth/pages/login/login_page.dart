import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final orientation = MediaQuery.orientationOf(context);

    _logger.i('Size of screen: ${size.width.round()}x${size.height.round()}');
    _logger.i('Orientation of the screen: ${orientation.name}');

    return Scaffold(
        appBar: AppBar(title: const Text('Login Page')),
        body: LayoutBuilder(builder: (context, constraints) {
          return const Text('Login');
        }));
  }
}
