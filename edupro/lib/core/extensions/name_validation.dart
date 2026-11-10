///This extension is to test either the user name is valid or not.
extension NameValidation on String {
  String? isValidName() {
    return RegExp(r"^[a-zA-Z_\s]+").hasMatch(this) ? null : "Invalid name";
  }
}
