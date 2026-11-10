///This is an extension that tests either a password is valid or not.
extension PasswordValidation on String {
  String? isValidPassword() {
    // RegExp(
    //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    //     ).hasMatch(this)
    return length > 6 ? null : "Invalid password";
  }
}
