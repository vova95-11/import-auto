import 'package:flutter/material.dart';
import 'package:unit_auto/utils/constants/colors.dart';

class UShadowStyle {
  static final verticalCardShadow = BoxShadow(
    color: UColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalCardShadow = BoxShadow(
    color: UColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
