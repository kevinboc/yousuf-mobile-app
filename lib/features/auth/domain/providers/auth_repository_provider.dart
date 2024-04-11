// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Program Files
import '../../auth.dart';
import '../../../../core/core.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final DioClient dioClient = ref.watch(dioClientProvider);
  final AuthRemoteDataSource authDataSource =
      ref.watch(authDataSourceProvider(dioClient));
  final NetworkInfo networkInfo = ref.watch(networkInfoProvider);
  return AuthRepositoryImpl(
      remoteDataSource: authDataSource, networkInfo: networkInfo);
});
