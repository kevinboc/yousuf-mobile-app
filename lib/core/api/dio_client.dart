// Packages
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../core.dart';

// Defines a type alias for functions that convert a dynamic response to a specific type T.
typedef ResponseConverter<T> = T Function(dynamic response);

// dio client class
class DioClient {
  // Base API URL
  String baseUrl = const String.fromEnvironment("BASE_URL");

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
  Dio _createDio() => Dio(
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

  // GET request function
  Future<Either<Failure, T>> getRequest<T>(String url,
      {Map<String, dynamic>? queryParamaters,
      required ResponseConverter<T> converter,
      bool isIsolate = true}) async {
    try {
      // Calls post method in dio instance
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
          message:
              e.response?.data['error'] as String? ?? e.message as String));
    }
  }

  // POST request function
  Future<Either<Failure, T>> postRequest<T>(String url,
      {Map<String, dynamic>? data,
      required ResponseConverter<T> converter,
      bool isIsolate = true}) async {
    try {
      // Calls post method in dio instance
      final response = await _dio.post(url, data: data);

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
          message:
              e.response?.data['error'] as String? ?? e.message as String));
    }
  }
}
