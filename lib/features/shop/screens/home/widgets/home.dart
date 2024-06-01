import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/common/widgets/appbar/detail_appbar_home.dart';
import 'package:unit_auto/common/widgets/curtain/curtain.dart';
import 'package:unit_auto/features/shop/screens/balance/balance.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/home_auction_card.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:unit_auto/features/shop/screens/online_auction/online_auction_screen%20copy%202.dart';
import 'package:unit_auto/features/shop/screens/online_auction/online_auction_screen.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const UHomeAppBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          const UDetailAppBarHome(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                /// Curtain // Шторка
                Curtain(),

                /// Banner
                const UPromoSlider(),
                const SizedBox(height: USizes.spaceBtwSections32),

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
                        onTap: () => Get.to(() => const OnlineAuctionScreen2()),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: USizes.spaceBtwSections32),

                /// Popular Auto (Top Auto in stock)
                Container(decoration: const BoxDecoration(color: Colors.grey), height: 700),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
