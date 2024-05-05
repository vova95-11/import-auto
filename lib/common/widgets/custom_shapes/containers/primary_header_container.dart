import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:unit_auto/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:unit_auto/utils/constants/colors.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UCurvedEdgesWidget(
      child: Container(
        //color: UColors.primary,
        color: Color.fromRGBO(130, 183, 159, 1),
        //color: Color.fromRGBO(183, 130, 130, 1),
        padding: const EdgeInsets.only(bottom: 0),
        //height: 210,
        child: Stack(
          children: [
            Positioned(
                top: -250, right: -250, child: UCircularContainer(backgroundColor: UColors.textWhite.withOpacity(0.1))),
            Positioned(
                top: 100, right: -250, child: UCircularContainer(backgroundColor: UColors.textWhite.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
