import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yousuf_mobile_app/features/chat/pages/riverpod/states/chat_id_provider.dart';

class UploadPage extends ConsumerWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            // onPressed: () => context.pop(),
            ),
        title: Text("Upload File"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            String chatID = ref.read(chatIDProvider);
          },
          child: Text("Select File"),
        ),
      ),
    );
  }
}
