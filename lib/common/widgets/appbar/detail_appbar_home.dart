import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/custom_shapes/curved_edges/curved_edges_widget15.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/home_reels.dart';

class UDetailAppBarHome extends StatelessWidget {
  const UDetailAppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 152.0,
      toolbarHeight: 0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: false, // остается видимой в начале прокрутки
      stretch: false, // растягивается при прокрутке
      flexibleSpace: UCurvedEdgesWidget15(
        child: Container(
          color: const Color.fromRGBO(130, 183, 159, 1),
          height: 260,
          child: Stack(
            children: [
              Positioned(top: 120, child: UHomeReels()),
            ],
          ),
        ),
      ),
    );
  }
}
