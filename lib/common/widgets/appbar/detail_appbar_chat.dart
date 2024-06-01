import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:unit_auto/common/widgets/custom_shapes/curved_edges/curved_edges_widget15.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/home_reels.dart';
import 'package:unit_auto/utils/constants/colors.dart';

class UDetailAppBarChat extends StatelessWidget {
  const UDetailAppBarChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150.0,
      toolbarHeight: 0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: false, // остается видимой в начале прокрутки
      stretch: false, // растягивается при прокрутке
      flexibleSpace: UCurvedEdgesWidget15(
        child: Container(
          color: const Color.fromRGBO(130, 183, 159, 1),
          height: 226,
          child: Stack(
            children: [
              Positioned(top: 70, right: -250, child: UCircularContainer(backgroundColor: UColors.textWhite.withOpacity(0.2))),
              Positioned(top: -260, right: -250, child: UCircularContainer(backgroundColor: UColors.textWhite.withOpacity(0.2))),
              Positioned(top: 70, left: -250, child: UCircularContainer(backgroundColor: UColors.textWhite.withOpacity(0.2))),
              Positioned(top: -260, left: -250, child: UCircularContainer(backgroundColor: UColors.textWhite.withOpacity(0.2))),
              const Positioned(top: 72, child: UHomeReels()),
            ],
          ),
        ),
      ),
    );
  }
}
