import 'package:flutter/material.dart';
import 'package:login_api/login/model/response_model.dart';

class HomePage extends StatelessWidget {
  Data? userData;
  HomePage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyActions: false,
        automaticallyImplyLeading: false,
        title: Text(
          "User DATA",
          style: TextStyle(
            color: Colors.black,
            fontWeight: .bold,
            fontSize: 30,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "UserID: ${userData?.user?.id}",
              style: TextStyle(
                fontWeight: .bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              "UserName: ${userData?.user?.name}",
              style: TextStyle(
                fontWeight: .bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              "Email: ${userData?.user?.email}",
              style: TextStyle(
                fontWeight: .bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Text(
              "Phone: ${userData?.user?.phone}",
              style: TextStyle(
                fontWeight: .bold,
                fontSize: 20,
                color: Colors.black,
              ),
            ),

            Image.network(userData?.user?.image ?? ""),
          ],
        ),
      ),
    );
  }
}
