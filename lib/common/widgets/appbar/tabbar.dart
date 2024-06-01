import 'package:flutter/material.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/device/device_utility.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class UTabBar extends StatelessWidget implements PreferredSizeWidget {
  const UTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Material(
      color: Colors.white,
      //color: dark ? UColors.black : UColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: UColors.primary,
        labelColor: dark ? UColors.white : UColors.primary,
        unselectedLabelColor: UColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UDeviceUtils.getAppBarHeight());
}
