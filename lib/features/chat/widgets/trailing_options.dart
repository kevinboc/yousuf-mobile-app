import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget trailingOptions(BuildContext buildContext) {
  //TODO: take in ai ID/other identification so user can navigate to ai page
  return PopupMenuButton(
      itemBuilder: (context) => [
            PopupMenuItem(
                child: const Text("View AI"),
                onTap: () => buildContext.go("/ai")),
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
