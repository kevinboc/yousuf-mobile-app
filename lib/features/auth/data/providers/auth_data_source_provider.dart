// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Program Files
import '../../auth.dart';
import '../../../../core/core.dart';

final authDataSourceProvider = Provider.family<AuthRemoteDataSource, DioClient>(
  (_, dioClient) => AuthRemoteDataSourceImpl(dioClient),
);