import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  // The box will store all that data inside.
  static final String userStorageBox = "storageBox";

  // to store user's data.
  static final String tokenKey = "tokenKey";
  static final String emailKey = "emailKey";
  static final String passwordKey = "passwordKey";

  //! This is because the API has no way to fetch known emails on the server.
  static final String knownEmailsKey = "knownEmailsKey";
  static List<String> knownEmails = [];

  //The API registered the new user for 10 minutes, then forgets it.
  //Do you think i should store this email with known ones???
  static String userEmail = "";
  static String userPassword = "";

  static String userToken = "";

  ///Load the emails from the local storage to that defined list.
  static Future<List<String>> loadKnownEmails() async {
    knownEmails = await Hive.box(userStorageBox).get(knownEmailsKey) ?? [];
    return knownEmails;
  }

  ///Add a know email to our list.
  static void addKnownEmail(String email) async {
    knownEmails.add(email);
    await Hive.box(userStorageBox).put(knownEmailsKey, knownEmails);
  }

  ///Check either this email is known or not.
  static bool isKnownEmail(String email) {
    return knownEmails.contains(email);
  }

  ///Store the email for later API registeratin.
  static void addEmail2Register(String email) {
    userEmail = email;
  }

  ///Store the tokens of users signed in successfuly on the disk.
  static void storeToken(String? token) async {
    if (token != null) {
      userToken = token;
      await Hive.box(userStorageBox).put(tokenKey, userToken);
    }
  }

  ///Store the user's email after being verified.
  static void storeEmail(String email) async {
    userEmail = email;
    await Hive.box(userStorageBox).put(emailKey, email);
  }

  ///Return back the user's email.
  static Future<String> getEmail() async {
    userEmail = await Hive.box(userStorageBox).get(emailKey);
    return userEmail;
  }

  //! I know this is not a logic of storing user's data,
  //!  but this app is for educational purposes, not for production.
  static void storePassword(String password) async {
    userPassword = password;
    await Hive.box(userStorageBox).put(passwordKey, password);
  }

  ///Restore user's password back.
  static Future<String> getPassword() async {
    userPassword = await Hive.box(userStorageBox).get(passwordKey);
    return userPassword;
  }
}
