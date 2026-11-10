///This is for user input email validation.
extension EmailValidation on String {
  String? isValidEmail() {
    return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        ).hasMatch(this)
        ? null
        : "Invalid email address.";
  }
}
