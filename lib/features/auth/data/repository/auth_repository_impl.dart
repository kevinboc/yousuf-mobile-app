// Packages
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  // Flutter Secure Storage
  final FlutterSecureStorage secureStorage =
      FlutterSecureStorage(); // ignore 'const' suggestion

  // Logger for development
  final Logger _logger = Logger();

  // AuthRepositoryImpl class constructor
  AuthRepositoryImpl(
      {required this.remoteDataSource,
      required this.networkInfo}); // TODO: There would be another paramter: local data source

  // Overriding login function
  @override
  Future<Either<Failure, Login>> login(LoginParams loginParams) async {
    // Check connection status
    if (await networkInfo.isConnected!) {
      _logger.i(
          "Auth Repository Implementation (Login): Connection found (Remote)");

      // Getting login response from remote data source
      final response = await remoteDataSource
          .login(loginParams); // First await regarding token

      return response.fold((failure) {
        final sf = failure as ServerFailure;

        var errorMsg = "Something went wrong! Please try again later.";
        if (sf.statusCode == 401 || sf.statusCode == 404) {
          errorMsg = "Invalid email or password.";
        }

        _logger.i(
            "Auth Repository Implementation (Login): Returning Failure(Left)");
        return Left(ServerFailure(errorMsg, statusCode: sf.statusCode));
      }, (loginResponse) async {
        try {
          _logger.i("Auth Repository Implementation (Login): Storing token");
          await storeToken(loginResponse.token, secureStorage);

          _logger.i("Auth Repository Implementation (Login): Reading token");
          String? token = await secureStorage.read(key: 'login_token');
          if (token != null) {
            _logger.i("Auth Repository Implementation (Login): token = $token");
          }
        } catch (e) {
          _logger.i(
              "Auth Repository Implementation (Login): Token is null, cannot store");
        }
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
        final sf = failure as ServerFailure;

        var errorMsg = "Something went wrong! Please try again later.";

        // TODO: Implement error messages for different status codes

        _logger.i(
            "Auth Repository Implementation (Register): Returning Failure(Left)");
        return Left(ServerFailure(errorMsg, statusCode: sf.statusCode));
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

// Method to store the token
Future<void> storeToken(
    String? token, FlutterSecureStorage secureStorage) async {
  if (token != null) {
    await secureStorage.write(key: 'login_token', value: token);
  }
}
