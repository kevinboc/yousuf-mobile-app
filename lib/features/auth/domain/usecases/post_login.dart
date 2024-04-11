// Packages
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project files
import '../../auth.dart';
import '../../../../core/core.dart';

part 'post_login.freezed.dart';
part 'post_login.g.dart';

// Post login usecase
class PostLogin extends UseCase<Login, LoginParams> {
  // Usecase auth repository
  final AuthRepository _repo;

  // Usecase constructor
  PostLogin(this._repo);

  // Usecase call method
  @override
  Future<Either<Failure, Login>> call(LoginParams params) =>
      _repo.login(params);
}

// LoginParams class
@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams(
      {@Default("") String email, @Default("") String password}) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
