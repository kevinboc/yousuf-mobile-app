// Packages
import 'package:dartz/dartz.dart';

//Project Files
import '../data.dart';
import '../../domain/domain.dart';
import '../../../../core/core.dart';

// Authentication repository implementation
class AuthRepositoryImpl implements AuthRepository {
  // Data sources
  final AuthRemoteDataSource remoteDataSource;
  // TODO: Implement local data source

  // Network Info
  final NetworkInfo networkInfo;

  // AuthRepositoryImpl class constructor
  AuthRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  // Overriding login function
  @override
  Future<Either<Failure, UserEntity>> login(UserParams userParams) async {
    // Check connection status
    if (await networkInfo.isConnected!) {
      // Getting login response from remote data source
      final response = await remoteDataSource.login(userParams);

      response.fold((failure) => Left(failure),
          (loginResponse) => Right(loginResponse.toEntity()));
    } else {
      return Left(ServerFailure(message: "Implement local later"));
    }

    return Left(ServerFailure(message: "Failure: network info"));
  }

  // Overriding register function
  @override
  Future<Either<Failure, UserEntity>> register(UserParams userParams) async {
    // TODO: implement register
    throw UnimplementedError();
  }
}
