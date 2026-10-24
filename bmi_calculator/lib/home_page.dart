import 'package:bmi_calculator/common.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double userHeight = 10.0;
  int userAge = 1;
  double userWeight = 1;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      appBar: makeAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),

            // Gender sqaures [Male, Female].
            child: Row(
              children: [
                // Male Box.
                InkWell(
                  child: _makeGenderWidget(gender: "male", isSelected: isMale),
                  onTap: () => setState(() {
                    isMale = true;
                  }),
                ),

                SizedBox(
                  width: 10,
                ), // A small seperator between the gender boxes.
                // Female Box.
                InkWell(
                  child: _makeGenderWidget(
                    gender: "female",
                    isSelected: !isMale,
                  ),
                  onTap: () => setState(() {
                    isMale = false;
                  }),
                ),
              ],
            ),
          ),

          // User's height slider bar.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xFF24263B),
                borderRadius: .circular(20),
              ),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "Height",
                    style: TextStyle(color: Color(0xFF8B8C9E), fontSize: 20),
                  ),

                  // This is the selected user height and the unit (cm).
                  Row(
                    crossAxisAlignment: .end,
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        userHeight.toInt().toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: .bold,
                        ),
                      ),
                      Text(
                        "cm",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),

                  // That horizontal bar used to select the height.
                  Slider(
                    value: userHeight,
                    min: 10,
                    max: 250,
                    divisions:
                        50, // Makes the bar divided into small dotted sections and show the value specified.
                    label: userHeight.toInt().toString(),
                    onChanged: (value) {
                      setState(() {
                        userHeight = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // Weight & Age Boxes.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                _makeWeightAgeBoxes(true),
                SizedBox(width: 10),
                _makeWeightAgeBoxes(false),
              ],
            ),
          ),
        ],
      ),

      // The Lowest section of the screen that performs the calculation.
      bottomNavigationBar: InkWell(
        child: makeBottomNavBar("Calculate"),
        onTap: () {
          Navigator.push(
            context,

            // Calling the ResultPage and passing their arguments.
            MaterialPageRoute(
              builder: (context) => ResultPage(
                userBMI: (userWeight / (userHeight * userHeight)) * 10000,
                userAge: userAge,
              ),
            ),
          );
        },
      ), // routing to the result page.
    );
  }

  // build the two boxes alnog side of male & female sign.
  Widget _makeGenderWidget({required String gender, required bool isSelected}) {
    return Container(
      height: 200,
      width: 190,
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF333244) : Color(0xFF24263B),
        borderRadius: .circular(20),
      ),

      // Each Gender Square consists of a column contains the logo and the Label.
      child: Column(
        children: [
          SvgPicture.asset(
            "images/material-symbols_${gender}.svg",
            height: 144,
          ), // The Gender Logo.

          Text(
            // The gender Label with uppercase initials.
            gender[0].toUpperCase() + gender.substring(1),
            style: TextStyle(fontSize: 20, color: Color(0xFF8B8C9E)),
          ),
          // SizedBox(height: 10),
        ],
      ),
    );
  }

  // Constructs the Lower 2 boxes of the weight and the age.
  Widget _makeWeightAgeBoxes(bool isWeightBox) {
    return Container(
      width: 190,
      height: 215,
      decoration: BoxDecoration(
        color: Color(0xFF24263B),
        borderRadius: .circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: .center,
          children: [
            // SizedBox(height: 10),
            Text(
              (isWeightBox ? "Weight" : "Age"),
              style: TextStyle(fontSize: 20, color: Color(0xFF8B8C9E)),
            ),
            Row(
              crossAxisAlignment: .end,
              mainAxisAlignment: .center,
              children: [
                Text(
                  (isWeightBox
                      ? userWeight.toInt().toString()
                      : userAge.toInt().toString()),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: .bold,
                  ),
                ),
                if (isWeightBox)
                  Text(
                    "kg",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
              ],
            ),

            Spacer(),

            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                // The minus (-) Icon used to decrease the value of [weight/Age].
                InkWell(
                  child: SvgPicture.asset("images/minus.svg"),
                  onTap: () => setState(() {
                    if ((isWeightBox ? userWeight : userAge) > 0) {
                      if (isWeightBox) {
                        userWeight -= 1;
                      } else {
                        userAge -= 1;
                      }
                    }
                  }),
                ),

                // The minus (+) Icon used to decrease the value of [weight/Age].
                InkWell(
                  child: SvgPicture.asset("images/plus.svg"),
                  onTap: () => setState(() {
                    if ((isWeightBox ? userWeight : userAge) < 250) {
                      if (isWeightBox) {
                        userWeight += 1;
                      } else {
                        userAge += 1;
                      }
                    }
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}