import 'package:egrocery/core/helpers/constants.dart';
import 'package:egrocery/core/helpers/widgets/app_bar.dart';
import 'package:egrocery/core/helpers/widgets/custom_button.dart';
import 'package:egrocery/core/helpers/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewRegistration extends StatefulWidget {
  const NewRegistration({super.key});

  @override
  State<NewRegistration> createState() => _NewRegistrationState();
}

class _NewRegistrationState extends State<NewRegistration> {
  TextEditingController fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: makeAppBarWidgets(
        barLeading: Icon(Icons.arrow_back),
        barTitle: "Your Information",
        barAction: null,
      ),

      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "It looks like you don't have account in this number. Please let us know some information for a secure service",
                style: TextStyle(
                  color: Color(0xFF37474F),
                  fontSize: 18,
                  fontWeight: .w500,
                ),
              ),
              CircleAvatar(
                backgroundColor: Color(0xFFB3B3B3),
                radius: 60,
                child: SvgPicture.asset("$ASSETS/image_upload_icon.svg"),
              ),
              SizedBox(height: 20),
              CustomButton(
                buttonText: "Sync From Facebook",
                textColor: Colors.white,
                buttonColor: Colors.blue,
                rightIcon: Image.asset(
                  "$ASSETS/facebook_icon.png",
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 20),

              // full name TextField.
              CustomTextFormField(
                fielValidator: (v) {
                  if (v!.contains(RegExp(r'[0-9]+'))) {
                    return "Name should has no #'s";
                  }

                  return null;
                },
                fieldController: fullnameController,
                fieldHintText: "Full Name",
                fieldPrefixIcon: Icon(CupertinoIcons.person, size: 22),
                isPasswordField: false,
              ),

              Spacer(),

              InkWell(
                onTap: () {},
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
      ),
    );
  }
}
