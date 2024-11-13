import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yousuf_mobile_app/core/core.dart';

class UploadPage extends ConsumerWidget {
  const UploadPage(this.chatID, {super.key});
  final String chatID;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _dio = DioClient();
    String filePath = "fle";
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.pop(),
        ),
        title: Text("Upload File"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? file = await FilePicker.platform.pickFiles();
                if (file != null) {
                  filePath = file.files.single.path as String;
                  // fileName = file.files.single.name;
                }
              },
              child: filePath == ""
                  ? Text("Select File")
                  : Text("Change Selected File"),
            ),
            ElevatedButton(
                onPressed: () async {
                  if (filePath == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please select a file")));
                  } else {
                    final response = await _dio.postRequest(
                        "/chats/$chatID/upload_text",
                        data: {'file': filePath},
                        converter: (response) {},
                        token: true,
                        isIsolate: false);

                    response.fold(
                        (l) => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("An error occured"))), (r) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Success, redirecting")));
                      context.pop();
                    });
                  }
                },
                child: Text("Upload"))
          ],
        ),
      ),
    );
  }
}
