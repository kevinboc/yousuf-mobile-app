class UploadedFile {
  const UploadedFile({
    required this.id,
    required this.fileName,
    required this.fileSize,
    required this.fileType,
    required this.uploadedAt,
  });

  final String id;
  final String fileName;
  final int fileSize;
  final String fileType;
  final String uploadedAt;
}
