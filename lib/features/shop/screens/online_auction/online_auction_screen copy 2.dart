import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unit_auto/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:unit_auto/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:unit_auto/common/widgets/texts/section_heading.dart';
import 'package:unit_auto/features/shop/screens/online_auction/widgets/brand_gridview.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class OnlineAuctionScreen2 extends StatelessWidget {
  const OnlineAuctionScreen2({super.key});

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
                    text: UTexts.onlineAuctionAppBarSubTitle,
                    centerTitle: true,
                    showBackArrow: true,
                    color: Colors.white,
                    // title: Text(UTexts.onlineAuctionAppBarSubTitle, style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white)),
                  ),

                  /// -- Search Bar
                  const USearchContainer(text: 'Поиск производителя', showBorder: true, showBackground: false),
                  const SizedBox(height: USizes.spaceBtwSections32 * 1.7),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
              child: Column(
                children: [
                  /// -- Japan Brands
                  USectionHeading(title: 'Япония', showActionButton: false),
                  SizedBox(height: USizes.spaceBtwItems16),

                  /// -- Японские брэнды авто
                  BrandGridview(),
                  SizedBox(height: USizes.spaceBtwSections32),

                  /// -- Other Brands
                  USectionHeading(title: 'Другие страны', showActionButton: false),
                  SizedBox(height: USizes.spaceBtwItems16),

                  /// -- Брэнды авто других стран
                  BrandGridview(),
                  SizedBox(height: USizes.appBarHeight),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
