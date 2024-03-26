// Packages
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// Program files
import '../widgets/widgets.dart';

// Login page
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Login page state
class _LoginPageState extends State<LoginPage> {
  // Logger for development
  final Logger _logger = Logger();

  // Text Editing Controllers
  final _email = TextEditingController();
  final _password = TextEditingController();

  // Global Key
  final _formKey = GlobalKey<FormState>();

  // Handle Login
  void login() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final orientation = MediaQuery.orientationOf(context);

    _logger.i('Size of screen: ${size.width.round()}x${size.height.round()}');
    _logger.i('Orientation of the screen: ${orientation.name}');

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Login Page')),
        body: SafeArea(
            child: Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextF(
                              customKey: 'email',
                              controller: _email,
                              hintText: 'Email',
                              obscureText: false),
                          TextF(
                              customKey: 'Password',
                              controller: _password,
                              obscureText: true,
                              hintText: 'Password'),
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')));
                                }
                              },
                              child: const Text('Login'))
                        ])))));
  }
}
