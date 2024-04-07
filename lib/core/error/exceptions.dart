// Server exception
class ServerException implements Exception {
  // Exception message
  String? message;

  ServerException(this.message);
}

// Cache exception
class CacheException implements Exception {}
