import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/drawer_chat_list.dart';

FlutterSecureStorage _storage = FlutterSecureStorage();
final Logger _logger = Logger();

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Future<void> _onLogout(BuildContext ctx) async {
    try {
      _logger.i("Side Nav Bar:");
      await _storage.read(key: 'login_token');
      _logger.i(
          "Token before deleting: ${await _storage.read(key: 'login_token')}");
      await _storage.delete(key: 'login_token');
      _logger.i("Checking if token was deleted");
      String? token = await _storage.read(key: 'login_token');
      _logger.i("Token : $token");

      if (ctx.mounted) {
        ctx.go('/login');
        Navigator.pop(ctx);
      }
    } catch (e) {
      _logger.i("Error deleting login token");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.history,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  "Conversations",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: DrawerChatList(),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 8,
              top: 6,
            ),
            child: ListTile(
              leading: Icon(
                Icons.logout,
                size: 26,
              ),
              title: Text(
                "Logout",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 20,
                    ),
              ),
              onTap: () => _onLogout(context),
            ),
          ),
        ],
      ),
    );
  }
}
