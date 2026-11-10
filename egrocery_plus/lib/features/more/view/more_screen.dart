import 'package:dio/dio.dart';
import 'package:egrocery_plus/core/helpers/api_helper.dart';
import 'package:egrocery_plus/core/helpers/app_colors.dart';
import 'package:egrocery_plus/core/helpers/hive_helper.dart';
import 'package:egrocery_plus/core/widgets/app_bar.dart';
import 'package:egrocery_plus/features/more/constants/more_tabs_components.dart';
import 'package:egrocery_plus/features/more/model/user_model.dart';
import 'package:egrocery_plus/features/edit_profile/view/edit_profile.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MoreScreen();
}

class _MoreScreen extends State<StatefulWidget> {
  UserModel? userModel;
  bool isLoading = true;

  void fetchUserData() async {
    try {
      Response response = await ApiHelper.userLogin(
        email: await HiveHelper.getEmail(),
        password: await HiveHelper.getPassword(),
      );

      print("===================================");
      print(await HiveHelper.getEmail());
      print(await HiveHelper.getPassword());
      print("===================================");
      userModel = UserModel.fromJson(
        response.data['data']['user'] as Map<String, dynamic>,
      );
      isLoading = false;
    } catch (e) {
      isLoading = false;
      print("===================================");
      print(e);
      print("===================================");
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeAppBar(label: "More"),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10,
                  ),
                  child: Row(
                    spacing: 20,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          "https://t4.ftcdn.net/jpg/09/61/69/75/360_F_961697523_EFd1m8P4tdcwB0TYvlQAagqKR1xHSuwk.jpg",
                        ),
                      ),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            "${userModel?.name}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: .bold,
                              color: AppColors.blackNormal,
                            ),
                          ),
                          Text(
                            "${userModel?.email}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: .w400,
                              color: AppColors.blackNormal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (MoreTabComponents.tabsLabels[index] ==
                          "Edit Profile") {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditProfile(userModel: userModel!,),
                          ),
                        );
                        // print("===================================");
                        // print(
                        //   "Navigate to ${MoreTabComponents.tabsLabels[index]} screen...........",
                        // );
                        // print("===================================");
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 15,
                      ),
                      child: Row(
                        spacing: 20,
                        children: [
                          Icon(
                            MoreTabComponents.tabsIcons[index],
                            color: MoreTabComponents.iconsColors[index],
                            size: 30,
                          ),
                          Text(
                            MoreTabComponents.tabsLabels[index],
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.blackNormal,
                              fontWeight: .bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: MoreTabComponents.tabsNumber,
                ),
              ],
            ),
    );
  }
}
