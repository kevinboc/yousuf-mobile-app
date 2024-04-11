// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

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
                          TextF(
                              customKey: 'email',
                              controller: _email,
                              hintText: 'Email',
                              obscureText: false),
                          TextF(
                              customKey: 'Password',
                              controller: _password,
                              obscureText: true,
                              hintText: 'Password'),
                          state.maybeMap(
                            loading: (_) => const Center(
                                child: CircularProgressIndicator()),
                            orElse: () => loginButton(ref),
                          ),
                          goToRegisterButton()
                        ])))));
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
