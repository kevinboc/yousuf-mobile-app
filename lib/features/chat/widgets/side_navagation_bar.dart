import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

Logger _logger = Logger();
FlutterSecureStorage storage = FlutterSecureStorage();

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
                context.go('/chats');
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
              onTap: () async {
                await deleteToken();
                if (context.mounted) {
                  context.go('/login');
                  Navigator.pop(context);
                }
              }),
        ),
      )
    ],
  );
}

Future<void> deleteToken() async {
  try {
    await storage.read(key: 'login_token');
    await storage.delete(key: 'login_token');
  } catch (e) {
    _logger.i("Error deleting login token");
  }
}
