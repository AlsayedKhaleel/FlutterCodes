import 'package:bmi_calculator/common.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  double userBMI = 0;
  int userAge = 1;
  ResultPage({super.key, required this.userAge, required this.userBMI});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      appBar:
          makeAppBar(), // The appBar is the same in both screens, i used a function to draw it.
      // The screen's content.
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            // "Your Result" text.
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Your Result:",
                style: TextStyle(
                  fontWeight: .bold,
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),

            // That grey container that contains the BMI & the message.
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: .circular(20),
                    color: Color(0xFF333244),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        // Gets the user's state based on their BMI value [Underweight, Obose, ...].
                        // and draw it using a widget (Customized Text one).
                        _getBMIState(userBMI),

                        // Print that BMI value wrapped in a Text Widget.
                        Text(
                          userBMI.toStringAsFixed(1),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 64,
                            fontWeight: .bold,
                          ),
                        ),

                        // Get the message to be printed to the user based on their BMI.
                        _getBMIMessage(userBMI),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        child: makeBottomNavBar("Re-Calculate"),
        onTap: () => Navigator.pop(context),
      ),
    );
  }

  Widget _getBMIState(double BMI) {
    String word = "";
    if (BMI < 18.5) {
      word = "Underweight";
    } else if (BMI > 18.5 && BMI < 24.9) {
      word = "Normal";
    } else if (BMI > 25 && BMI < 29.9) {
      word = "Overweight";
    } else {
      word = "Obesity";
    }

    return Text(
      word,
      textAlign: .center,
      style: TextStyle(
        fontSize: 30,
        fontWeight: .bold,
        color: (BMI < 24.9 ? Color(0xFF21BF73) : Colors.red),
      ),
    );
  }

  // Prints a message (wrapped in a Text Widget) to the user based on theri BMI value.
  Widget _getBMIMessage(double BMI) {
    if (BMI < 24.9) {
      return Text(
        "You Have a Normal Body Weight, Good Job.",
        style: TextStyle(
          color: Color(0xFF8B8C9E),
          fontSize: 25,
          fontWeight: .w400,
        ),
      );
    } else {
      return Text(
        "You Have a Problem with your Body Weight, See A Doctor.",
        textAlign: .center,
        style: TextStyle(color: Colors.red, fontSize: 30, fontWeight: .w200),
      );
    }
  }
}