import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/device/device_utility.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class UAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UAppBar({
    super.key,
    required this.text,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.color = Colors.black,
    this.centerTitle = false,
    this.systemOverlayStyle = SystemUiOverlayStyle.light,
    this.flexibleSpace,
    this.backgroundColor = const Color.fromRGBO(130, 183, 159, 1),
    this.shape,
    this.style,
  });

  final String text;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final Color color;
  final bool centerTitle;
  final SystemUiOverlayStyle systemOverlayStyle;
  final Widget? flexibleSpace;
  final Color? backgroundColor;
  final ShapeBorder? shape;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return AppBar(
      shape: shape,
      backgroundColor: dark ? Colors.grey.shade900 : UColors.white,
      systemOverlayStyle: dark
          ? const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.black,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
            )
          : const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? Padding(
              padding: const EdgeInsets.only(top: 16, left: 24),
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Get.back(),
                  icon: Align(alignment: Alignment.centerLeft, child: Icon(Icons.arrow_back_ios, size: 18, color: dark ? UColors.white : UColors.dark))),
            )
          : leadingIcon != null
              ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
              : null,
      titleSpacing: 0,
      title: Padding(
          padding: const EdgeInsets.fromLTRB(0, USizes.defaultSpace24 / 1.5, 0, 0),
          child: Text(
            text,
            style: style,
            // style: dark
            //     ? const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: GoogleFonts.forum().fontFamily)
            //     : const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black, fontFamily: GoogleFonts.forum().fontFamily),
          )),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UDeviceUtils.getAppBarHeight());
}
