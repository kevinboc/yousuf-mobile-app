// Packages
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project files
import '../../auth.dart';
import '../../../../core/core.dart';

part 'post_register.freezed.dart';
part 'post_register.g.dart';

// Post login usecase
class PostRegister extends UseCase<Register, RegisterParams> {
  // Usecase auth repository
  final AuthRepository _repo;

  // Usecase constructor
  PostRegister(this._repo);

  // Usecase call method
  @override
  Future<Either<Failure, Register>> call(RegisterParams params) =>
      _repo.register(params);
}

// LoginParams class
@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams(
      {@Default("") String email,
      @Default("") String password,
      @Default("") String first_name,
      @Default("") String last_name }) = _RegisterParams;

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);
}
