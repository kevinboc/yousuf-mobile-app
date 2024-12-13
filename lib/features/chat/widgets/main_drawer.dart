import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/features/chat/widgets/drawer_chat_list.dart';

FlutterSecureStorage _storage = const FlutterSecureStorage();
final Logger _logger = Logger();

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Future<void> _onLogout(BuildContext ctx) async {
    try {
      await _storage.read(key: 'login_token');
      await _storage.delete(key: 'login_token');

      if (ctx.mounted) {
        ctx.go('/login');
        Navigator.pop(ctx);
      }
    } catch (e) {
      _logger.e("Error logging out: $e");
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
          const Expanded(
            child: DrawerChatList(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
              top: 6,
            ),
            child: ListTile(
              leading: const Icon(
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
