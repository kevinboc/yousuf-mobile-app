// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/core/extensions/extensions.dart';
import 'package:yousuf_mobile_app/core/widgets/widgets.dart';

// Program files
import '../../auth.dart';
import 'providers/state/state.dart';

// Login page
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

// Login page state
class _LoginPageState extends ConsumerState<LoginPage> {
  // Logger for development
  final Logger _logger = Logger();

  // Text Editing Controllers
  final _email = TextEditingController();
  final _password = TextEditingController();

  // Global Key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final orientation = MediaQuery.orientationOf(context);

    _logger.i('Size of screen: ${size.width.round()}x${size.height.round()}');
    _logger.i('Orientation of the screen: ${orientation.name}');

    final state = ref.watch(authNotifierProvider);
    ref.listen(
      authNotifierProvider.select((value) => value),
      ((previous, next) {
        //show Snackbar on failure
        if (next is Failure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(next.toString())));
        } else if (next is Success) {
          GoRouter.of(context).go('/');
        }
      }),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Login Page')),
        body: SafeArea(
            child: Center(
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomField(
                            title: 'Email',
                            controller: _email,
                            error: _validateEmail(),
                            onChanged: (value) {
                              setState(
                                  () {}); // To trigger the error message update
                            },
                          ),
                          // Password field
                          CustomField(
                            title: 'Password',
                            controller: _password,
                            isPassword: true,
                            error: _validatePassword(),
                            onChanged: (value) {
                              setState(
                                  () {}); // To trigger the error message update
                            },
                          ),
                          state.maybeMap(
                            loading: (_) => const Center(
                                child: CircularProgressIndicator()),
                            orElse: () => loginButton(ref),
                          ),
                          goToRegisterButton()
                        ])))));
  }

  String? _validateEmail() {
    final email = _email.text;
    if (email.isEmpty) return 'Email is required.';
    if (!email.validateEmail()) return 'Invalid email format.';
    return null;
  }

  String? _validatePassword() {
    final password = _password.text;
    if (password.isEmpty) return 'Password is required.';
    if (!password.validatePassword()) {
      return 'Password must be at least 8 characters long and contain letters, numbers, and special characters.';
    }
    return null;
  }

  Widget loginButton(WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        // validate email and password
        ref
            .read(authNotifierProvider.notifier)
            .login(LoginParams(email: _email.text, password: _password.text));
      },
      child: const Text('Login'),
    );
  }

  Widget goToRegisterButton() {
    return ElevatedButton(
      onPressed: () => GoRouter.of(context).go('/register'),
      child: const Text('Register Now'),
    );
  }
}
