// Project files
import '../../domain/domain.dart';

// TODO: Fix fromJson and toJson by checking if having these methods are unused or redudant because they're in user params
// User model
class UserModel extends UserEntity {
  const UserModel({required String email, required String password})
      : super(email: email, password: password);

  // JSON data to UserModel Dart object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(email: json['email'], password: json['password']);
  }

  // UserModel Dart object to JSON data
  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  // Turn response data to UserEntity object
  UserEntity toEntity() => UserEntity(email: email, password: password);
}
