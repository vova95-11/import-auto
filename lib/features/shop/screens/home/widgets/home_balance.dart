import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/common/widgets/images/u_circular_image.dart';
import 'package:unit_auto/features/shop/screens/balance/balance.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';

class Balance extends StatelessWidget {
  const Balance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(USizes.productImageRadius16)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(6.0, 6.0),
              spreadRadius: 1.0,
              blurRadius: 15,
            ),
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(-6.0, -6.0),
              spreadRadius: 1.0,
              blurRadius: 15,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24, vertical: USizes.spaceBtwItems16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Баланс', style: Theme.of(context).textTheme.headlineSmall),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('0.00',
                              style: Theme.of(context).textTheme.headlineMedium!.apply(
                                    color: const Color.fromARGB(255, 83, 7, 97),
                                  )),
                          const SizedBox(width: USizes.sm8),
                          Text('RUB', style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                    ],
                  ),
                  const UCircularImage(image: UImages.money, width: 50, height: 50, padding: 0),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        textStyle: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () => Get.to(() => const BalanceScreen()),
                      child: const Text(UTexts.depositMoney),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        textStyle: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      onPressed: () => Get.to(() => const BalanceScreen()),
                      child: const Text(UTexts.historyOfOperations),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
