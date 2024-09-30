// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

// Program files
import '../../auth.dart';
import 'providers/state/state.dart';

// Login page
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

// Login page state
class _RegisterPageState extends ConsumerState<RegisterPage> {
  // Logger for development
  final Logger _logger = Logger();

  // Text Editing Controllers
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();

  // Global Key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final orientation = MediaQuery.orientationOf(context);

    _logger.i('Size of screen: ${size.width.round()}x${size.height.round()}');
    _logger.i('Orientation of the screen: ${orientation.name}');

    final state = ref.watch(registerNotifierProvider);
    ref.listen(
      registerNotifierProvider.select((value) => value),
      ((previous, next) {
        //show Snackbar on failure
        if (next is Failure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(next.toString())));
        } else if (next is Success) {
          GoRouter.of(context).go('/login');
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
                              customKey: 'First Name',
                              controller: _firstName,
                              obscureText: false,
                              hintText: 'First Name'),
                          TextF(
                              customKey: 'Last Name',
                              controller: _lastName,
                              obscureText: false,
                              hintText: 'Last Name'),
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
                          TextF(
                              customKey: 'Confirm Password',
                              controller: _confirmPassword,
                              obscureText: true,
                              hintText: 'Confirm Password'),
                          state.maybeMap(
                            loading: (_) => const Center(
                                child: CircularProgressIndicator()),
                            orElse: () => Column(
                              children: [
                                registerButton(ref),
                                goToLoginButton()
                              ],
                            ),
                          ),
                          goToLoginButton()
                        ])))));
  }

  Widget registerButton(WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        // validate email and password
        ref.read(registerNotifierProvider.notifier).register(RegisterParams(
            email: _email.text,
            password: _password.text,
            first_name: _firstName.text,
            last_name: _lastName.text));
      },
      child: const Text('Register'),
    );
  }

  // TODO: Need to remove login button from register page
  Widget goToLoginButton() {
    return ElevatedButton(
      onPressed: () => GoRouter.of(context).go('/login'),
      child: const Text('Login Now'),
    );
  }
}
