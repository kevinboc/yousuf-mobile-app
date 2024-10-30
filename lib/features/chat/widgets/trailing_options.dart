import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget trailingOptions(BuildContext buildContext, String chatID) {
  return PopupMenuButton(
      itemBuilder: (context) => [
            PopupMenuItem(
                child: const Text("Upload File"),
                onTap: () => buildContext.go("/chat/upload")),
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
                onTap: () => buildContext.go("/home"))
          ]);
}
