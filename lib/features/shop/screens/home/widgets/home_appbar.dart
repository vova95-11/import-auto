import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/appbar/appbar.dart';
import 'package:unit_auto/common/widgets/notifications/cart_menu_icon.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UAppBar(
      title: Text(UTexts.homeAppBarSubTitle,
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white)),
      actions: [
        UCartCounterIcon(
          onPressed: () {},
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
