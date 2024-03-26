// Packages
import 'package:flutter/material.dart';

// Reusable stateless textfield widget
class TextF extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String customKey;

  const TextF(
      {super.key,
      required this.customKey,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: TextFormField(
          key: Key(customKey),
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(hintText: hintText),
        ));
  }
}
