// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Program Files
import '../api.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});
