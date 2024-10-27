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
class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

// Login page state
class _RegisterPageState extends ConsumerState<RegisterPage> {
  // Logger for development
  final Logger _logger = Logger();

  // Variables
  var _enteredEmail = "";
  var _enteredPassword = "";
  var _enteredFirstName = "";
  var _enteredLastName = "";
  String? _currPassword;

  // Global Key
  final _formKey = GlobalKey<FormState>();

  // Form submit handler
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    ref.read(registerNotifierProvider.notifier).register(RegisterParams(
        email: _enteredEmail,
        password: _enteredPassword,
        first_name: _enteredFirstName,
        last_name: _enteredLastName));
  }

  // Validators
  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your name.";
    }
    if (!value.validateName()) {
      return 'Name must contain letters and be 2 to 50 characters long.';
    }
    return null;
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

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please confirm your password.";
    }
    _logger.i('Entered Password: $_currPassword');
    _logger.i('Value: $value');
    if (value != _currPassword) {
      return 'Passwords do not match.';
    }
    return null;
  }

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
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Register Error'),
                content: const Text("There was an error. Please try again."),
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
          GoRouter.of(context).go('/login');
        }
      }),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Sign Up Page')),
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
                            labelText: "First Name",
                          ),
                          autocorrect: false,
                          textCapitalization: TextCapitalization.words,
                          validator: _nameValidator,
                          onSaved: (value) => _enteredFirstName = value!,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Last Name",
                          ),
                          autocorrect: false,
                          textCapitalization: TextCapitalization.words,
                          validator: _nameValidator,
                          onSaved: (value) => _enteredLastName = value!,
                        ),
                        const SizedBox(height: 20),
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
                          onChanged: (value) => _currPassword = value,
                          onSaved: (value) => _enteredPassword = value!,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Confirm Password",
                          ),
                          obscureText: true,
                          validator: _confirmPasswordValidator,
                        ),
                        const SizedBox(height: 20),
                        state.maybeMap(
                          loading: (_) =>
                              const Center(child: CircularProgressIndicator()),
                          orElse: () => Column(
                            children: [
                              ElevatedButton(
                                onPressed: _submit,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                                child: const Text('Register'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    GoRouter.of(context).go('/login'),
                                child:
                                    const Text('Have an account? Login Now!'),
                              ),
                            ],
                          ),
                        ),
                      ])),
            ),
          ),
        ))));
  }
}
