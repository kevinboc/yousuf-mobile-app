// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/core/core.dart';

// Program Files
import 'auth_state.dart';
import '../../../../auth.dart';

class AuthNotifier extends AutoDisposeNotifier<AuthState> {
  // Dependencies
  late final PostLogin _postLogin;

  // Logger for development
  final Logger _logger = Logger();

  @override
  AuthState build() {
    // Set state to initial at the beginning of the AuthNotifier build
    _postLogin = ref.watch(postLoginProvider);
    state = const AuthState.initial();
    return state;
  }

  // login state management function
  Future<void> login(LoginParams params) async {
    // Set state to loading after the login procedure begins
    state = const AuthState.loading();

    // GET Response from PostLogin's usecase call method (login)
    final data = await _postLogin.call(params);

    // Handle data returning and state
    state = data.fold((l) {
      _logger.i("Auth Notifier (Login): Failure state");

      final sl = l as ServerFailure;

      return AuthState.failure(sl.message);
    }, (r) {
      _logger.i("Auth Notifier (Login): Success state");
      _logger.i("Auth Notifier (Login): data = ${r.toString()}");
      return AuthState.success(r.token);
    });

    _logger.i("Auth Notifier (Login): ${state.toString()}");
  }

  // TODO: Add logout state management function
}
