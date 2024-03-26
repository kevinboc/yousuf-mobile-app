// Abstract Failure class
abstract class Failure {
  // Failure class varaibles
  final String message;

  // Failure class constructor
  const Failure({required this.message});
}

// Cache failure class
class CacheFailure extends Failure {
  CacheFailure({required String message}) : super(message: message);
}

// No data failure class
class NoDataFailure extends Failure {
  NoDataFailure({required String message}) : super(message: message);
}

// Server failure class
class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);
}
