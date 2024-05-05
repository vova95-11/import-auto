import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unit_auto/utils/constants/colors.dart';

class UCartCounterIcon extends StatelessWidget {
  const UCartCounterIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(Iconsax.notification5, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.8),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "2", // Сделать проверку, если больше 99 тогда 99+
                style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
