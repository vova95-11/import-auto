import 'package:flutter/material.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

class Curtain extends StatelessWidget {
  const Curtain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: USizes.defaultSpace24),
      width: 70.0,
      height: 5.0,
      decoration: BoxDecoration(
        color: UColors.curtainColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
