import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unit_auto/common/widgets/appbar/appbar.dart';
import 'package:unit_auto/features/shop/models/car_model.dart';

class CarFilteredScreen extends StatelessWidget {
  const CarFilteredScreen({super.key, required this.car});

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        text: '${car.brand!.name} ${car.name}',
        // title: Text('${car.brand!.name} ${car.name}'),
      ),
      body: Center(
        child: Container(width: double.infinity, height: 200, decoration: BoxDecoration(color: Colors.red)),
      ),
    );
  }
}
