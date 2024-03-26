// Packages
import 'package:dartz/dartz.dart';

// Project files
import '../../auth.dart';
import '../../../../core/core.dart';

// Post login usecase
class PostRegister {
  // Usecase auth repository
  final AuthRepository _repo;

  // Usecase constructor
  PostRegister(this._repo);

  // Usecase call method
  Future<Either<Failure, UserEntity>> call(UserParams userParams) =>
      _repo.register(userParams);
}
