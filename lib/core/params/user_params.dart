// User parameters
class UserParams {
  // User paramter variables
  final String email;
  final String password;

  // User parameter constructor
  const UserParams({required this.email, required this.password});

  // UserModel Dart object to JSON data
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}

// No parameter
class NoParams {}
