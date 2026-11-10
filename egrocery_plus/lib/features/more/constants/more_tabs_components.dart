import 'package:egrocery_plus/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class MoreTabComponents {
  static const int tabsNumber = 9;
  // The icons at the tabs' leadings.
  static List<IconData> tabsIcons = [
    Icons.create_outlined,
    Icons.location_on_outlined,
    Icons.shopping_basket_outlined,
    Icons.production_quantity_limits_outlined,
    Icons.messenger_outline,
    Icons.phone_outlined,
    Icons.mail_outline,
    Icons.facebook_sharp,
    Icons.settings_power_sharp,
  ];

  // The icons' colors.
  static List<Color> iconsColors = [
    AppColors.marinerNormal,
    AppColors.blackNormal,
    AppColors.blackNormal,
    AppColors.blackNormal,
    AppColors.dailyplusWhiteGreen,
    AppColors.tangoNormal,
    AppColors.blackNormal,
    AppColors.marinerNormal,
    AppColors.persimmonNormal,
  ];

  // Labels with the tabs.
  static List<String> tabsLabels = [
    "Edit Profile",
    "My Address",
    "My Orders",
    "My Whishlist",
    "Chat with us",
    "Talk to our Support",
    "Mail to us",
    "Message to Facebook page",
    "Log out",
  ];

  // The target screen of each tab.
  static List<Widget> screens = [];

  IconData? tabIcon;
  Color? iconColor;
  String? tabLabel;
  Widget? tabScreen; // the target to forward the user to.

  MoreTabComponents(int tabNumber) {
    tabIcon = tabsIcons[tabNumber];
    iconColor = iconsColors[tabNumber];
    tabLabel = tabsLabels[tabNumber];
    tabScreen = screens[tabNumber];
  }
}
