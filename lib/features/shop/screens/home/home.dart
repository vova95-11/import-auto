import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/cars/auction_cars/auction_card_vertical.dart';
import 'package:unit_auto/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/home_balance.dart';

import 'package:unit_auto/features/shop/screens/home/widgets/home_reels.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const UPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  UHomeAppBar(),

                  /// Searchbar
                  // USearchContainer(text: 'Поиск в приложении'),
                  //  SizedBox(height: USizes.defaultSpace24),

                  /// Reels
                  UHomeReels(),
                ],
              ),
            ),

            /// Body
            Column(
              children: [
                /// Balance
                const Balance(),
                const SizedBox(height: USizes.spaceBtwSections32),

                /// Banner
                const UPromoSlider(),
                const SizedBox(height: USizes.spaceBtwSections32),

                /// Auction cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                  child: UGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => const UAuctionCardVertical(),
                  ),
                ),
                const SizedBox(height: USizes.spaceBtwSections32),

                /// Popular Auto (Top Auto in stock)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
