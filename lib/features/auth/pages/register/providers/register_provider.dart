// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Program Files
import 'state/state.dart';

final registerNotifierProvider =
    NotifierProvider.autoDispose<RegisterNotifier, RegisterState>(() {
  return RegisterNotifier();
});
