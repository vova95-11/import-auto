import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:unit_auto/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:unit_auto/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:unit_auto/common/widgets/images/u_circular_image.dart';
import 'package:unit_auto/common/widgets/layouts/grid_layout.dart';

import 'package:unit_auto/common/widgets/texts/section_heading.dart';
import 'package:unit_auto/common/widgets/texts/u_brand_title_with_icon.dart';
import 'package:unit_auto/utils/constants/enums.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class OnlineAuctionScreen3 extends StatelessWidget {
  const OnlineAuctionScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: UHelperFunctions.isDarkMode(context) ? UColors.black : UColors.white,
                  expandedHeight: 220,
                  flexibleSpace: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- AppBAr
                      UAppBar(
                        text: UTexts.onlineAuctionAppBarSubTitle,
                        centerTitle: true,
                        showBackArrow: true,
                        //title: Text(UTexts.onlineAuctionAppBarSubTitle, style: Theme.of(context).textTheme.headlineMedium),
                      ),

                      /// -- Search Bar
                      const SizedBox(height: USizes.sm8),
                      const USearchContainer(text: 'Поиск производителя', showBorder: true, showBackground: false),
                      const SizedBox(height: USizes.spaceBtwSections32),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                        child: USectionHeading(title: 'Производитель', showActionButton: false),
                      ),
                      const SizedBox(height: USizes.spaceBtwItems16 / 1.5),
                    ],
                  ),
                ),
              ];
            },
            body: Container(
              child:

                  /// -- Brends
                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                child: UGridLayout(
                  crossAxisCount: 2,
                  itemCount: 12,
                  mainAxisExtent: 50,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: URoundedContainer(
                        padding: const EdgeInsets.all(USizes.sm8),
                        showBorder: true,
                        backgroundColor: Colors.transparent,
                        child: Row(
                          children: [
                            /// -- Icon
                            Expanded(
                              flex: 1,
                              child: UCircularImage(
                                padding: 2,
                                width: 20,
                                height: 20,
                                isNetworkImage: false,
                                image: UImages.toyota,
                                backgroundColor: Colors.transparent,
                                overlayColor: UHelperFunctions.isDarkMode(context) ? UColors.white : UColors.dark,
                              ),
                            ),
                            const SizedBox(width: USizes.spaceBtwItems16 / 4),

                            /// -- Text
                            const Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  UBrandTitleWithVerifiedIcon(title: 'Toyota', brandTextSize: TextSizes.large),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )),
      ),

      // Scaffold(
      //   body: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         UPrimaryHeaderContainer(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               /// Appbar
      //               UAppBar(
      //                 centerTitle: true,
      //                 showBackArrow: true,
      //                 color: Colors.white,
      //                 title: Text(UTexts.onlineAuctionAppBarSubTitle, style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white)),
      //               ),
      //               const SizedBox(height: USizes.spaceBtwSections32),
      //             ],
      //           ),
      //         ),
      //         const Padding(
      //           padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
      //           child: Column(
      //             children: [
      //               /// -- Account Settings
      //               USectionHeading(
      //                 title: 'Производитель',
      //                 showActionButton: false,
      //               ),
      //               SizedBox(height: USizes.spaceBtwItems16),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
