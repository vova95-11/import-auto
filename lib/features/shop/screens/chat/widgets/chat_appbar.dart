import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/notifications/cart_menu_icon.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';
import 'package:unit_auto/utils/device/device_utility.dart';

class UChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UChatAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(USizes.defaultSpace24 / 2, USizes.defaultSpace24 / 1.5, USizes.defaultSpace24, 0),
        child: Text(UTexts.homeAppBarSubTitle, style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white)),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(USizes.defaultSpace24, USizes.defaultSpace24 / 1.5, USizes.defaultSpace24, 0),
          child: UCartCounterIcon(
            onPressed: () {},
            iconColor: Colors.white,
          ),
        ),
      ],
      centerTitle: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: UColors.appBarGradient,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(USizes.defaultSpace24),
            bottomRight: Radius.circular(USizes.defaultSpace24),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UDeviceUtils.getAppBarHeight());
}
