import 'package:egrocery/core/helpers/constants.dart';
import 'package:egrocery/features/registration/preregistered_phone_no.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterPhoneNo extends StatefulWidget {
  const RegisterPhoneNo({super.key});

  @override
  State<RegisterPhoneNo> createState() => _RegisterPhoneNoState();
}

class _RegisterPhoneNoState extends State<RegisterPhoneNo> {
  TextEditingController phoneNoController = TextEditingController();

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
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                child: SvgPicture.asset("$ASSETS/register_phone_no.svg"),
              ),
            ),

            Text(
              "Enter your mobile number",
              style: TextStyle(fontSize: 20, fontWeight: .bold),
            ),
            SizedBox(height: 10),
            Text(
              "We need to verify you. We will send you a one time verification code.",
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
                controller: phoneNoController,
                style: TextStyle(
                  fontSize: 16.0,
                  textBaseline: TextBaseline.alphabetic,
                ),
                autofocus: false,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "Phone Number",
                  border: InputBorder.none,
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 40,
                    minHeight: 24,
                  ),
                  prefixIcon: const Icon(Icons.phone_outlined, size: 22),
                ),
              ),
            ),
            Spacer(),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,

                  // Calling the ResultPage and passing their arguments.
                  MaterialPageRoute(
                    builder: (context) => PreRegisteredPhoneNo(),
                  ),
                );
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
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Next",
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
    );
  }
}