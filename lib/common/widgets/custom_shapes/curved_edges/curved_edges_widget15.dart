import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/custom_shapes/curved_edges/curved_edges15.dart';

class UCurvedEdgesWidget15 extends StatelessWidget {
  const UCurvedEdgesWidget15({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: UCustomCurvedEdges15(),
      child: child,
    );
  }
}
