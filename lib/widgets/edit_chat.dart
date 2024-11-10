import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class EditChat extends StatefulWidget {
  const EditChat({required this.chatTitle, super.key});

  final String chatTitle;

  @override
  State<EditChat> createState() => _EditChatState();
}

class _EditChatState extends State<EditChat> {
  var _title = "";

  final _uploadedFiles = [];

  Future<bool> _uploadFile() async {
    await Future.delayed(const Duration(seconds: 5));
    return true;
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt', 'pdf', 'doc'],
    );

    if (result != null) {
      if (mounted) {
        showDialog(
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
          final uploaded = await _uploadFile();
          if (uploaded) {
            setState(() {
              _uploadedFiles.add(result.files.single.name);
            });
          }
        } catch (e) {
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
    _title = widget.chatTitle;
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
          if (_uploadedFiles.isEmpty)
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
                      title: Text(file),
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
