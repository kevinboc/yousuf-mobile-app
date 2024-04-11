// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Program Files
import 'state/state.dart';

final authNotifierProvider =
    NotifierProvider.autoDispose<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
