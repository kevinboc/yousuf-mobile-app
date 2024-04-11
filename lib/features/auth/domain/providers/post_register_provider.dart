// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Program Files
import '../../auth.dart';

final postRegisterProvider = Provider<PostRegister>((ref) {
  final AuthRepository authRepository = ref.watch(authRepositoryProvider);
  return PostRegister(authRepository);
});
