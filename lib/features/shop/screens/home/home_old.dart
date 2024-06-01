import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:unit_auto/features/shop/screens/balance/balance.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/home_appbar_old.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/home_auction_card.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/home_reels.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:unit_auto/features/shop/screens/online_auction/online_auction_screen.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

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
                  UHomeAppBarOld(),

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
                // const Balance(),
                // const SizedBox(height: USizes.spaceBtwSections32),

                /// Banner
                const UPromoSlider(),
                const SizedBox(height: USizes.spaceBtwSections32),

                /// Auction cards
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                //   child: UGridLayout(
                //     itemCount: 2,
                //     itemBuilder: (_, index) => const UAuctionCardVertical(),
                //   ),
                // ),
                // const SizedBox(height: USizes.spaceBtwSections32),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Online auctions
                      AuctionCard(
                        title: 'ЯПОНСКИЕ АВТОАУКЦИОНЫ',
                        subtitle: 'Сейчас в продаже 50 545 автомобилей',
                        onTap: () => Get.to(() => const OnlineAuctionScreen()),
                      ),

                      /// Statistics
                      AuctionCard(
                        title: 'СТАТИСТИКА ПРОДАЖ АВТО',
                        subtitle: 'Данные до 06.05.2024. 1978321 автомобилей',
                        onTap: () => Get.to(() => const BalanceScreen()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: USizes.spaceBtwSections32),

                /// Popular Auto (Top Auto in stock)
                Container(decoration: BoxDecoration(color: Colors.grey), height: 300),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
