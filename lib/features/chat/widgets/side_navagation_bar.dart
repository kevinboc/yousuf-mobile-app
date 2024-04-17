import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Widget menuOptions(BuildContext context) {
  return Column(
    children: [
      const DrawerHeader(
        child: Text("Name"),
      ),
      Expanded(
          child: Column(
        children: [
          ListTile(
            title: const Text("Home"),
            // leading: , use this if icons are added
            onTap: () {
              //Navigate to page
              //This closes the menu
              context.go('/');
              Navigator.pop(context);
            },
          ),
          ListTile(
              title: const Text("Chats"),
              onTap: () {
                context.go('/chat_list');
                Navigator.pop(context);
              }),
          ListTile(
              title: const Text("Create New AI"),
              onTap: () {
                Navigator.pop(context);
                context.go("/trainnewai");
              }),
          ListTile(
              title: const Text("Settings"),
              onTap: () {
                context.go('/placeholder');
                Navigator.pop(context);
              }),
          const Divider()
        ],
      )),
      Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .02),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: ListTile(
              title: const Text("Logout"),
              onTap: () {
                context.go('/login');
                Navigator.pop(context);
              }),
        ),
      )
    ],
  );
}
