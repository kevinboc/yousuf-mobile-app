// Packages
import 'package:dartz/dartz.dart';

// Program files
import '../../auth.dart';
import '../../../../core/core.dart';

// Abstract class of the authentication remote data source
abstract class AuthRemoteDataSource {
  // Abstract login method
  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams);

  // Abstract register method
  Future<Either<Failure, RegisterResponse>> register(
      RegisterParams registerParams);
}

// Implementing abstact class
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // DioClient instance
  final DioClient _client;

  // Authentication remote data source implementation class constructor
  AuthRemoteDataSourceImpl(this._client);

  // Implementing login function for remote data source
  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams) async {
    final response = await _client.postRequest(APIList.login,
        data: loginParams.toJson(),
        converter: (response) =>
            LoginResponse.fromJson(response as Map<String, dynamic>),
        token: true,
        isIsolate: false);
    return response;
  }

  // Implementing register function for remote data source
  @override
  Future<Either<Failure, RegisterResponse>> register(
      RegisterParams registerParams) async {
    final response = await _client.postRequest(APIList.register,
        data: registerParams.toJson(),
        converter: (response) =>
            RegisterResponse.fromJson(response as Map<String, dynamic>),
        token: true,
        isIsolate: false);

    return response;
  }
}
