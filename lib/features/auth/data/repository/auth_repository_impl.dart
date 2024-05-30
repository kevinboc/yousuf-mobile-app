// Packages
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

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

  // Logger for development
  final Logger _logger = Logger();

  // AuthRepositoryImpl class constructor
  AuthRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  // Overriding login function
  @override
  Future<Either<Failure, Login>> login(LoginParams loginParams) async {
    // Check connection status
    if (await networkInfo.isConnected!) {
      _logger.i(
          "Auth Repository Implementation (Login): Connection found (Remote)");

      // Getting login response from remote data source
      final response = await remoteDataSource.login(loginParams);

      return response.fold((failure) {
        _logger.i(
            "Auth Repository Implementation (Login): Returning Failure(Left)");
        return Left(failure);
      }, (loginResponse) {
        _logger.i(
            "Auth Repository Implementation (Login): Returning Login entity(Right)");
        return Right(loginResponse.toEntity()); // Right now it is
      });
    } else {
      _logger.i(
          "Auth Repository Implementation (Login): Connection not found (local)");
      return const Left(ServerFailure("Implement local later"));
    }
  }

  // Overriding register function
  @override
  Future<Either<Failure, Register>> register(
      RegisterParams registerParams) async {
    // Check connection status
    if (await networkInfo.isConnected!) {
      _logger.i("Auth Repository Implementation (Register): Connection found");

      // Getting login response from remote data source
      final response = await remoteDataSource.register(registerParams);

      return response.fold((failure) {
        _logger.i(
            "Auth Repository Implementation (Register): Returning Failure(Left)");
        return Left(failure);
      }, (registerResponse) {
        _logger.i(
            "Auth Repository Implementation (Register): Returning Register entity(Right)");
        return Right(registerResponse.toEntity());
      });
    } else {
      _logger
          .i("Auth Repository Implementation (Register): Connection not found");
      return const Left(ServerFailure("Cannot register without connection"));
    }
  }
}
