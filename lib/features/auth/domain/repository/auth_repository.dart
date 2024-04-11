// Packages
import 'package:dartz/dartz.dart';

// Project files
import '../../auth.dart';
import '../../../../core/core.dart';

// Abstract Authentication Repository
abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginParams loginParams);
  Future<Either<Failure, Register>> register(RegisterParams registerParams);
}
