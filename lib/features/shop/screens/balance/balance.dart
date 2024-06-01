import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

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
                    text: UTexts.balanceAppBarSubTitle,
                    //title: Text(UTexts.balanceAppBarSubTitle, style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white)),
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
