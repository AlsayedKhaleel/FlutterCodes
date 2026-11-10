import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test_firebase/firebase_options.dart';

Future<void> main() async {
  // Always add this line before initializing external services
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase for the current platform
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(FirebaseApp());
}

class FirebaseApp extends StatefulWidget {
  const FirebaseApp({super.key});

  @override
  State<FirebaseApp> createState() => _FirebaseAppState();
}

class _FirebaseAppState extends State<FirebaseApp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObsecureText = true;

  @override
  void initState() {
    super.initState();
    // FirebaseAuth.instance.currentUser
    //     ?.reload(); // fetch the user's latest data.

    // gets the current sign state of the current user and changes contiounsly.
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('=========================> User is currently signed out!');
      } else {
        print('=========================> User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Icon(Icons.exit_to_app, color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Color(0xFFFEFEFE),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
                Center(
                  child: SvgPicture.asset("assets/images/enter_password.svg"),
                ),

                Text(
                  "Enter the password",
                  style: TextStyle(fontSize: 20, fontWeight: .bold),
                ),
                SizedBox(height: 10),
                Text(
                  "It looks like you already have an account in this number. Please enter the password to proceed",
                  textAlign: .start,
                  style: TextStyle(fontSize: 18, color: Color(0xFF37474F)),
                ),
                SizedBox(height: 20),

                // TODO: User mail.
                Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F1F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: emailController,
                    style: TextStyle(
                      fontSize: 16.0,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                    autofocus: false,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "Email",
                      border: InputBorder.none,
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 24,
                      ),
                      prefixIcon: const Icon(
                        Icons.supervised_user_circle_outlined,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // TODO: password.
                Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: Color(0xFFF0F1F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    style: TextStyle(
                      fontSize: 16.0,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                    autofocus: false,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: "Password",
                      border: InputBorder.none,
                      prefixIconConstraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 24,
                      ),
                      prefixIcon: const Icon(Icons.lock_open_sharp, size: 22),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObsecureText = !isObsecureText;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            isObsecureText
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () async {
                    print('======================================');
                    print(emailController.text);
                    print(passwordController.text);
                    print('======================================');

                    // try {
                    //   // sends a request to create an account with those email & password.
                    //   final credential = await FirebaseAuth.instance
                    //       .createUserWithEmailAndPassword(
                    //         email: emailController.text,
                    //         password: passwordController.text,
                    //       );
                    // } on FirebaseAuthException catch (e) {
                    //   if (e.code == 'weak-password') {
                    //     print(
                    //       '====================> The password provided is too weak.',
                    //     );
                    //   } else if (e.code == 'email-already-in-use') {
                    //     print(
                    //       '====================> The account already exists for that email.',
                    //     );
                    //   }
                    // } catch (e) {
                    //   print(e);
                    // }
                    // try {
                    //   final credential = await FirebaseAuth.instance
                    //       .signInWithEmailAndPassword(
                    //         email: emailController.text,
                    //         password: passwordController.text,
                    //       );
                    //   // await FirebaseAuth.instance.currentUser
                    //   //     ?.updatePhoneNumber(
                    //   //       credential as PhoneAuthCredential,
                    //   //     );

                    //   print('XXXXXXX===================================');
                    //   print(FirebaseAuth.instance.currentUser?.providerData);
                    //   print('===================================');
                    // } on FirebaseAuthException catch (e) {
                    //   print('======================> ${e.code}');
                    // }

                    /*
                    UserInfo(displayName: null, email: you@gmail.com, 
                    phoneNumber: null, photoURL: null, providerId: password, uid: you@gmail.com)]
                    */

                    // await FirebaseAuth.instance.currentUser?.updateDisplayName(
                    //   "YOU",
                    // );
                    // await FirebaseAuth.instance.currentUser?.updatePassword("youyouyou");
                    // await FirebaseAuth.instance.currentUser?.update
                    // await FirebaseAuth.instance.currentUser?.sendEmailVerification();
                    // await FirebaseAuth.instance.setLanguageCode("ar"); // changes the language of the reset mail.
                    // await FirebaseAuth.instance.sendPasswordResetEmail(
                    //   email: "alsayedaldkhakhni@gmail.com",
                    // );

                    // await FirebaseAuth.instance.currentUser?.delete();
                    // print("******** Reload");
                    // await FirebaseAuth.instance.currentUser?.reload();

                    print('XXXXXXX===================================');
                    print(FirebaseAuth.instance.currentUser?.providerData);
                    print('===================================');

                    // try {
                    //   final credential = await FirebaseAuth.instance
                    //       .signInWithEmailAndPassword(
                    //         // email: "saad@gg.com",
                    //         // password: "saadgg.com",
                    //         email: emailController.text.trim(),
                    //         password: passwordController.text.trim(),
                    //       );
                    //   if (credential.user != null) {
                    //     Get.snackbar(
                    //       "Login Sucess",
                    //       "User Is There",
                    //       backgroundColor: Colors.green,
                    //     );
                    //   } else {
                    //     if (credential.user != null) {
                    //       Get.snackbar(
                    //         "Login Faild",
                    //         "No such a user.",
                    //         backgroundColor: Colors.red,
                    //       );
                    //     }
                    //   }
                    // } on FirebaseAuthException catch (e) {
                    //   if (e.code == 'user-not-found') {
                    //     print('No user found for that email.');
                    //   } else if (e.code == 'wrong-password') {
                    //     print('Wrong password provided for that user.');
                    //   }
                    // }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xFF5EC401),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Stack(
                      children: [
                        Align(
                          alignment: .centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: .w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
