// Packages
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';

// Program Files
import '../core.dart';

// Defines a type alias for functions that convert a dynamic response to a specific type T.
typedef ResponseConverter<T> = T Function(dynamic response);

// dio client class
class DioClient {
  // Logger for development
  final Logger _logger = Logger();

  // Authentication token
  // String? _auth;

  // dio instace
  late Dio _dio;

  // DioClient class constructor
  DioClient() {
    // Initialize _dio instance
    _dio = _createDio();
  }

  // TODO: Dio get dio() method for creating new dio instance to avoid token issue after login?

  // Returns the created dio instance
  Dio _createDio() {
    // Base API URL
    final String? loadedUrl = dotenv.env['BASE_URL'];
    if (loadedUrl == null) {
      throw Exception("Base URL not found in the environment");
    }

    final String baseUrl = loadedUrl;

    _logger.i("Dio Client: Creating Dio instace");
    _logger.i("Dio Client: Base URL in createDio() = $baseUrl");

    return Dio(
        // Base options of the dio instance
        BaseOptions(
            baseUrl: baseUrl,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json'
              // TODO: Add auth token
            },
            connectTimeout: const Duration(minutes: 1),
            receiveTimeout: const Duration(minutes: 1)));
  }

  // GET request function
  Future<Either<Failure, T>> getRequest<T>(String url,
      {Map<String, dynamic>? queryParamaters,
      required ResponseConverter<T> converter,
      bool isIsolate = true}) async {
    try {
      // Calls get method in dio instance
      final response = await _dio.get(url, queryParameters: queryParamaters);

      // Check if response status code is good
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
            requestOptions: response.requestOptions, response: response);
      }

      // Check if isolation is not needed
      if (!isIsolate) {
        return Right(converter(response.data));
      }

      // Create isolate parser instance
      final isolateParser =
          IsolateParser<T>(response.data as Map<String, dynamic>, converter);

      // Wait for parsing result
      final result = await isolateParser.parseInBackground();

      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(
          e.response?.data['error'] as String? ?? e.message as String));
    }
  }

  // POST request function
  Future<Either<Failure, T>> postRequest<T>(String url,
      {Map<String, dynamic>? data,
      required ResponseConverter<T> converter,
      bool isIsolate = true}) async {
    try {
      _logger.i("Dio Client: Trying post request");
      _logger.i("Dio Client: ${data.toString()}");

      // Calls post method in dio instance
      final response = await _dio.post(url, data: data);

      _logger.i("Dio Client: After calling dio post method");

      // Check if response status code is good
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        _logger.i("Dio Client: Throwing DioException");
        throw DioException(
            requestOptions: response.requestOptions, response: response);
      }

      // Check if isolation is not needed
      if (!isIsolate) {
        return Right(converter(response.data));
      }

      // Create isolate parser instance
      final isolateParser =
          IsolateParser<T>(response.data as Map<String, dynamic>, converter);

      // Wait for parsing result
      final result = await isolateParser.parseInBackground();

      // Post Request Succeeded
      _logger.i("Dio Client: Post request successful");

      return Right(result);
    } on DioException catch (e) {
      _logger.i("Dio Client: Request URL = ${e.requestOptions.uri}");
      _logger.i("Dio Client: ServerFailure");

      return Left(
          ServerFailure(e.response?.data['error'] as String? ?? e.message));
    }
  }
}
