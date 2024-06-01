import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ZakazScreen extends StatelessWidget {
  const ZakazScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Appbar
                  UAppBar(
                    text: UTexts.zakazAppBarSubTitle,
                    //title: Text(UTexts.zakazAppBarSubTitle,
                    // style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white)),
                  ),
                  const SizedBox(height: USizes.spaceBtwSections32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
