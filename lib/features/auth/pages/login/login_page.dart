// Packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:yousuf_mobile_app/core/extensions/extensions.dart';

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

  var _enteredEmail = "";
  var _enteredPassword = "";

  // Global Key
  final _formKey = GlobalKey<FormState>();

  // Form submit handler
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    // Use those values to send our auth request
    ref.read(authNotifierProvider.notifier).login(
          LoginParams(email: _enteredEmail, password: _enteredPassword),
        );
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email.";
    }
    if (!value.validateEmail()) return 'Invalid email format.';
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password.";
    }
    if (!value.validatePassword()) {
      return 'Password must be at least 8 characters long and contain letters, numbers, and special characters.';
    }
    return null;
  }

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
        // print error message
        if (next is Failure) {}
        //show Snackbar on failure
        if (next is Failure) {
          _logger.e(next.message);

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Login Error'),
                content: Text(next.message),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              );
            },
          );
        } else if (next is Success) {
          GoRouter.of(context).go('/');
        }
      }),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.all(24),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        validator: _emailValidator,
                        onSaved: (value) => _enteredEmail = value!,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                        obscureText: true,
                        validator: _passwordValidator,
                        onSaved: (value) => _enteredPassword = value!,
                      ),
                      const SizedBox(height: 20),
                      state.maybeMap(
                        loading: (_) =>
                            const Center(child: CircularProgressIndicator()),
                        orElse: () => ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                      TextButton(
                        onPressed: () => GoRouter.of(context).go('/register'),
                        child: const Text(
                          "Don't have an account? Register!",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
