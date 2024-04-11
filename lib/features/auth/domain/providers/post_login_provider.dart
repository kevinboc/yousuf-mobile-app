// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Program Files
import '../../auth.dart';

final postLoginProvider = Provider<PostLogin>((ref) {
  final AuthRepository authRepository = ref.watch(authRepositoryProvider);
  return PostLogin(authRepository);
});
