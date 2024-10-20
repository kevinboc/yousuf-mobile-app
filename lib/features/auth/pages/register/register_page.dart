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
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Register Error'),
                content: const Text("There was an error. Please try again."),
                actions: <Widget>[
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
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 24.0, right: 24.0, bottom: 4.0),
                              child: CustomField(
                                title: 'First Name',
                                controller: _firstName,
                                error: _validateName(_firstName),
                                onChanged: (value) {
                                  setState(
                                      () {}); // To trigger the error message update
                                },
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 24.0, right: 24.0, bottom: 4.0),
                              child: CustomField(
                                title: 'Last Name',
                                controller: _lastName,
                                error: _validateName(_lastName),
                                onChanged: (value) {
                                  setState(
                                      () {}); // To trigger the error message update
                                },
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 24.0, right: 24.0, bottom: 4.0),
                              child: CustomField(
                                title: 'Email',
                                controller: _email,
                                error: _validateEmail(),
                                onChanged: (value) {
                                  setState(
                                      () {}); // To trigger the error message update
                                },
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 24.0, right: 24.0, bottom: 4.0),
                              child: CustomField(
                                title: 'Password',
                                controller: _password,
                                isPassword: true,
                                error: _validatePassword(),
                                onChanged: (value) {
                                  setState(
                                      () {}); // To trigger the error message update
                                },
                              )),
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 24.0, right: 24.0, bottom: 4.0),
                              child: CustomField(
                                title: 'Confirm Password',
                                controller: _confirmPassword,
                                isPassword: true,
                                error: _validateConfirmPassword(),
                                onChanged: (value) {
                                  setState(
                                      () {}); // To trigger the error message update
                                },
                              )),
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
                        ])))));
  }

  String? _validateName(TextEditingController controller) {
    final name = controller.text;
    if (name.isEmpty) return '';
    if (!name.validateName()) {
      return 'Name can contain letters and be 2 to 50 characters long.';
    }
    return null;
  }

  String? _validateEmail() {
    final email = _email.text;
    if (email.isEmpty) return '';
    if (!email.validateEmail()) return 'Invalid email format.';
    return null;
  }

  String? _validatePassword() {
    final password = _password.text;
    if (password.isEmpty) return '';
    if (!password.validatePassword()) {
      return 'Password must be at least 8 characters long and contain letters, numbers, and special characters.';
    }
    return null;
  }

  String? _validateConfirmPassword() {
    final confirm = _confirmPassword.text;
    final pass = _password.text;
    if (confirm.isEmpty) return '';
    if (!confirm.validateConfirmPassword(pass)) {
      return 'Name can contain letters and be 2 to 50 characters long.';
    }
    return null;
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
