// Packages
import 'package:dartz/dartz.dart';

// Project files
import '../../auth.dart';
import '../../../../core/core.dart';

// Post login usecase
class PostLogin {
  // Usecase auth repository
  final AuthRepository _repo;

  // Usecase constructor
  PostLogin(this._repo);

  // Usecase call method
  Future<Either<Failure, UserEntity>> call(UserParams userParams) =>
      _repo.login(userParams);
}
