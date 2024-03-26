// Packages
import 'package:dartz/dartz.dart';

// Project files
import '../entities/entities.dart';
import '../../../../core/core.dart';

// Abstract Authentication Repository
abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(UserParams userParams);
  Future<Either<Failure, UserEntity>> register(UserParams userParams);
}
