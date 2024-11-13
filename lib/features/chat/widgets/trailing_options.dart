import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget trailingOptions(String chatID) {
  return PopupMenuButton(
      itemBuilder: (context) => [
            PopupMenuItem(
                child: const Text("Upload File"),
                onTap: () {
                  context.push("/chat/upload", extra: chatID);
                }),
            PopupMenuItem(
                child: const Text("Rename Chat"),
                onTap: () => AlertDialog(
                      content: const TextField(),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel")),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Save"))
                      ],
                    )),
            PopupMenuItem(
                child: const Text("Delete Chat"),
                onTap: () => context.go("/home"))
          ]);
}
