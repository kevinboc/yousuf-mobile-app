// Packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = Initial;
  const factory RegisterState.loading() = Loading;
  const factory RegisterState.success(String? data) = Success;
  const factory RegisterState.failure(String message) = Failure;
}
