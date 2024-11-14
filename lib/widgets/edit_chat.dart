import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fss;
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/core/api/api.dart';
import 'package:yousuf_mobile_app/models/chat.dart';
import 'package:yousuf_mobile_app/models/uploaded_file.dart';

final _dio = DioClient();
final Logger _logger = Logger();
const fss.FlutterSecureStorage _storage = fss.FlutterSecureStorage();
final serverURL = "https://yousuf195.azurewebsites.net";

class EditChat extends StatefulWidget {
  const EditChat({required this.chat, super.key});

  final Chat chat;

  @override
  State<EditChat> createState() => _EditChatState();
}

class _EditChatState extends State<EditChat> {
  var _title = "";

  List<UploadedFile> _uploadedFiles = [];
  var _filesLoading = true;

  // Get list of files uploaded to the chat
  Future<void> _getUploadedFiles() async {
    setState(() {
      _filesLoading = true;
    });
    String? token = await _storage.read(key: 'login_token');

    final response = await _dio.getRequest(
      "${APIList.chats}/${widget.chat.id}/uploaded_texts",
      token: token,
      converter: (res) {
        List<UploadedFile> files = [];
        for (var file in res) {
          files.add(UploadedFile(
            id: file['id'],
            fileName: file['file_name'],
            fileSize: file['file_size'],
            fileType: file['file_type'],
            uploadedAt: file['uploaded_at'],
          ));
        }
        return files;
      },
      isIsolate: false,
    );

    setState(() {
      _filesLoading = false;
    });

    response.fold((error) {
      _logger.e("Error getting uploaded files: $error");
      throw error;
    }, (files) {
      setState(() {
        _uploadedFiles = files;
      });
    });
  }

  Future<UploadedFile> _uploadFile(FilePickerResult file) async {
    String? token = await _storage.read(key: 'login_token');

    final Dio dio = Dio();

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.files.single.path!),
    });

    final response = await dio.post(
        "$serverURL${APIList.chats}/${widget.chat.id}/upload_text",
        data: formData,
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
          "Authorization": token,
        }));

    if (response.statusCode == 200) {
      return UploadedFile(
        id: response.data['id'],
        fileName: file.files.single.name,
        fileSize: file.files.single.size,
        fileType: response.data['file_type'],
        uploadedAt: DateTime.now().toString(),
      );
    } else {
      throw "Error uploading file";
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt', 'pdf', 'doc'],
    );

    if (result != null) {
      if (mounted) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext ctx) {
            return const AlertDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              title: Text("Uploading file"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LinearProgressIndicator(),
                  SizedBox(height: 16),
                  Text("This may take a while..."),
                ],
              ),
            );
          },
        );

        try {
          final uploadedFile = await _uploadFile(result);
          setState(() {
            _uploadedFiles.add(uploadedFile);
          });
        } catch (e) {
          _logger.e("Error uploading file: $e");
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Error uploading file: $e"),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        } finally {
          if (mounted) {
            Navigator.pop(context);
          }
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _title = widget.chat.title;
    _getUploadedFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          const Text(
            "Edit Chat",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: _title,
            decoration: InputDecoration(
              labelText: "Chat Title",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              setState(() {
                _title = value;
              });
            },
          ),
          const SizedBox(height: 16),
          // Display a centered "Uploaded Files" text and a plus icon button
          Row(
            children: [
              const Text(
                "Uploaded Files",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: _pickFile,
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (_filesLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else if (_uploadedFiles.isEmpty)
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("No files uploaded yet"),
              ],
            ))
          else
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var file in _uploadedFiles)
                    ListTile(
                      title: Text(file.fileName),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          // Remove the file from the list of uploaded files
                          setState(() {
                            _uploadedFiles.remove(file);
                          });
                        },
                      ),
                    ),
                ],
              ),
            )),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, _title);
                  },
                  child: const Text("Close"),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                  child: Text(
                    "Delete Chat",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
