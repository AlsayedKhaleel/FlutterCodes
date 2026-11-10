import 'package:egrocery_plus/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _MyCustomTabState();
}

class _MyCustomTabState extends State<OrdersScreen> {
  _MyCustomTabState();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: const TabBar(
            indicatorColor: AppColors.dailyplusGreen,
            labelColor: AppColors.tangoNormal,
            unselectedLabelColor: AppColors.marinerNormal,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Ongoing",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: .w400,
                    color: AppColors.blackNormal,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  "History",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: .w400,
                    color: AppColors.blackNormal,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(child: Text("It's cloudy here")),
            Center(child: Text("It's rainy here")),
          ],
        ),
      ),
    );
  }

  Widget makeTabContent() {
    return ListView.separated(
      itemBuilder: (context, index) {
        
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: 2,
    );
  }
}
