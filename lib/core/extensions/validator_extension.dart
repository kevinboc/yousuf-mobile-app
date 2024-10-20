extension ValidatorX on String {
  bool validateEmail() => RegExp(
          r'^(?=.{1,256}$)(?=.{3,64}@.{1,255}$)(?!.*\s)(?!.*\.{2})[a-zA-Z0-9._%+-]{1,64}@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
      .hasMatch(this);

  bool validatePassword() => RegExp(
          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+=[\]{};":\\|,.<>?])(?=\S)(?=.{8,}).*$')
      .hasMatch(this);

  bool validateConfirmPassword(String password) => this == password;

  bool validateName() => RegExp(r'^[a-zA-Z]{2,50}$').hasMatch(this);
}
