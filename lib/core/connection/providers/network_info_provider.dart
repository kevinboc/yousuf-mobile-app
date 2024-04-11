// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

// Program Files
import '../../core.dart';

final internetConnectionProvider = Provider<InternetConnectionChecker>((ref) {
  return InternetConnectionChecker();
});

final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final InternetConnectionChecker internetConnectionChecker =
      ref.watch(internetConnectionProvider);
  return NetworkInfoImpl(internetConnectionChecker);
});
