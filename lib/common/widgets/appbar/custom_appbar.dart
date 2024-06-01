import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/device/device_utility.dart';

class UCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UCustomAppBar({
    super.key,
    required this.text,
    this.showBackArrow = false,
    this.leadingIcon,
    this.leadingOnPressed,
    this.color = Colors.white,
  });

  final String text;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.fromLTRB(USizes.defaultSpace24 / 2, USizes.defaultSpace24 / 1.5, USizes.defaultSpace24, 0),
        child: Text(text, style: Theme.of(context).textTheme.headlineMedium!.apply(color: color)),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(130, 183, 159, 1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(USizes.defaultSpace24),
            bottomRight: Radius.circular(USizes.defaultSpace24),
          ),
        ),
      ),
      leading: showBackArrow
          ? Padding(
              padding: const EdgeInsets.only(top: 16, left: 24),
              child: IconButton(
                  padding: EdgeInsets.zero, onPressed: () => Get.back(), icon: Align(alignment: Alignment.centerLeft, child: Icon(Icons.arrow_back_ios, size: 18, color: color))),
            )
          : leadingIcon != null
              ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UDeviceUtils.getAppBarHeight());
}
