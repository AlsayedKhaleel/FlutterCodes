import 'package:egrocery/core/helpers/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBarWidgets(
        barTitle: "Grocery Plus",
        barAction: InkWell(
          onTap: () {
            setState(() {
              Get.snackbar("Error", "laskdjflkdsaf");
            });
          },

          child: Icon(CupertinoIcons.bell)
          ),
      ),

      body: Container(color: Colors.lightBlue),
    );
  }
}
