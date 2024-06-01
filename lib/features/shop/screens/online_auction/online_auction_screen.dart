import 'package:flutter/material.dart';
import 'package:unit_auto/common/widgets/appbar/custom_appbar.dart';
import 'package:unit_auto/common/widgets/curtain/curtain.dart';
import 'package:unit_auto/common/widgets/texts/section_heading.dart';
import 'package:unit_auto/features/shop/screens/chat/widgets/chat_appbar_detail.dart';
import 'package:unit_auto/features/shop/screens/online_auction/widgets/brand_gridview.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class OnlineAuctionScreen extends StatelessWidget {
  const OnlineAuctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const UCustomAppBar(
        text: UTexts.onlineAuctionAppBarSubTitle,
        showBackArrow: true,
      ),
      body: Column(
        children: [
          /// Curtain // Шторка
          const Curtain(),
          CustomScrollView(
            slivers: <Widget>[
              const UDetailAppBarSearch(),
              SliverToBoxAdapter(
                child: Padding(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
