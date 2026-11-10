import 'package:egrocery/core/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PreRegisteredPhoneNo extends StatefulWidget {
  const PreRegisteredPhoneNo({super.key});

  @override
  State<PreRegisteredPhoneNo> createState() => PreRegisteredPhoneNoState();
}

class PreRegisteredPhoneNoState extends State<PreRegisteredPhoneNo> {
  TextEditingController passwordController = TextEditingController();
  bool isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .center,
          children: [
            Center(child: SvgPicture.asset("$ASSETS/enter_password.svg")),

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
                obscureText: isObsecureText,
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
            Text(
              "Forgot  Password?",
              style: TextStyle(
                color: Color(0xFFF37A20),
                fontSize: 18,
                fontWeight: .w400,
              ),
            ),
            Spacer(),

            Container(
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
                      child: Icon(Icons.arrow_forward, color: Colors.white),
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
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
