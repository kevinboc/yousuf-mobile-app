// Packages
import 'package:dartz/dartz.dart';

// Program files
import '../../auth.dart';
import '../../../../core/core.dart';

// Abstract class of the authentication remote data source
abstract class AuthRemoteDataSource {
  // Abstract login method
  Future<Either<Failure, UserModel>> login(UserParams userParams);

  // Abstract register method
  Future<Either<Failure, UserModel>> register(UserParams userParams);
}

// Implementing abstact class
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // DioClient instance
  final DioClient _client;

  // Authentication remote data source implementation class constructor
  AuthRemoteDataSourceImpl(this._client);

  // Implementing login function for remote data source
  @override
  Future<Either<Failure, UserModel>> login(UserParams userParams) async {
    final response = await _client.postRequest(APIList.login,
        data: userParams.toJson(),
        converter: (response) =>
            UserModel.fromJson(response as Map<String, dynamic>));

    return response;
  }

  // Implementing register function for remote data source
  @override
  Future<Either<Failure, UserModel>> register(UserParams userParams) async {
    final response = await _client.postRequest(APIList.register,
        data: userParams.toJson(),
        converter: (response) =>
            UserModel.fromJson(response as Map<String, dynamic>));

    return response;
  }
}
