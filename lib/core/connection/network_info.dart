// Packages
import 'package:internet_connection_checker/internet_connection_checker.dart';

// Network info abstract class
abstract class NetworkInfo {
  // GET function for connection status
  Future<bool>? get isConnected;
}

// Internet connection checker implementation
class NetworkInfoImpl implements NetworkInfo {
  // Internet connection checker instance
  final InternetConnectionChecker connectionChecker;

  // NetworkInfoImpl class constructor with internet connection checker package
  NetworkInfoImpl(this.connectionChecker);

  // Overriding the abstract class's isConnected GET method
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
