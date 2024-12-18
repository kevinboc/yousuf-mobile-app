// Packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/core/core.dart';

// Program Files
import 'register_state.dart';
import '../../../../auth.dart';

class RegisterNotifier extends AutoDisposeNotifier<RegisterState> {
  // Dependencies
  late final PostRegister _postRegister;

  // Logger for development
  final Logger _logger = Logger();

  @override
  RegisterState build() {
    _postRegister = ref.watch(postRegisterProvider);
    state = const RegisterState.initial();
    return state;
  }

  // register state management function
  Future<void> register(RegisterParams params) async {
    // Set state to loading after the login procedure begins
    state = const RegisterState.loading();

    // GET Response from PostRegister's usecase call method (login)
    final data = await _postRegister.call(params);

    // Handle data returning and state
    state = data.fold((l) {
      _logger.i("Auth Notifier (Register): Failure state");

      final sl = l as ServerFailure;

      return RegisterState.failure(sl.message);
    }, (r) {
      _logger.i("Auth Notifier (Register): Success state");
      _logger.i("Auth Notifier (Register): data = ${r.toString()}");
      return RegisterState.success(r.token);
    });

    _logger.i("Auth Notifier (Register): ${state.toString()}");
  }
}
