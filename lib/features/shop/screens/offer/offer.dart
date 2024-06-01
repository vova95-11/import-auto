import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:unit_auto/common/widgets/appbar/appbar.dart';
import 'package:unit_auto/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key, this.carPhoto});

  final List<String>? carPhoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                UPrimaryHeaderContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Appbar
                      UAppBar(
                        text: UTexts.offerAppBarSubTitle,
                        // title: Text(UTexts.offerAppBarSubTitle, style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white)),
                      ),
                      const SizedBox(height: USizes.spaceBtwSections32),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                  child: Text('Количество вариантов: 4', style: Theme.of(context).textTheme.bodyMedium!.apply(color: UColors.black, fontWeightDelta: 2)),
                ),
              ],
            ),
            const SizedBox(height: USizes.spaceBtwItems16 / 2),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: USizes.xs4),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(USizes.cardRadiusSm10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: const Offset(6.0, 6.0),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: USizes.sm8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    'TOYOTA C-HR 2020г',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.headlineSmall,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(color: Color.fromARGB(110, 126, 202, 136), borderRadius: BorderRadius.all(Radius.circular(5))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: USizes.sm8, vertical: USizes.xs4),
                                  child: Text('лот: 50501',
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color.fromARGB(255, 10, 74, 12), fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                          //padding: const EdgeInsets.fromLTRB(24, 1, 24, 3),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text('G-T MODE NERO SAFETY PLUS', maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodyMedium),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: USizes.xs4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                          //padding: const EdgeInsets.fromLTRB(24, 3, 24, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                NumberFormat.currency(locale: 'ru_RU', decimalDigits: 0).format(2170000),
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: const Color.fromARGB(255, 83, 7, 97),
                                    ),
                              ),
                              Text(
                                'Оценка: 4,5BB',
                                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: USizes.xs4),
                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 3.0), // ДОБАВИТЬ КОНСТАНТУ 3.0
                                child: Image.asset(UImages.promoBanner2),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: USizes.sm8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                          //padding: const EdgeInsets.fromLTRB(24, 10, 24, 5),
                          child: Text(
                            '1.2 л, 116 л.с., бензин, вариатор, 4WD, 26 тыс.км',
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: USizes.xs4),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                          //padding: EdgeInsets.fromLTRB(0, 5, 24, 10),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('08.03.2024 16:20'),
                          ),
                        ),
                        const SizedBox(height: USizes.sm8),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: USizes.spaceBtwSections32),
          ],
        ),
      ),
    );
  }
}
