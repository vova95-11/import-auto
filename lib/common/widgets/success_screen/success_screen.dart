import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace24),
            child: Column(
              children: [
                /// Image
                Lottie.asset(image, width: MediaQuery.of(context).size.width * 0.6),
                // Image(
                //   image: AssetImage(image),
                //   width: UHelperFunctions.screenWidth() * 0.6,
                //   height: UHelperFunctions.screenHeight() * 0.3,
                // ),
                const SizedBox(height: USizes.spaceBtwSections32),

                /// Title & SubTitle
                Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
                const SizedBox(height: USizes.spaceBtwItems16),
                Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
                const SizedBox(height: USizes.spaceBtwSections32),

                /// Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: onPressed, child: const Text(UTexts.uContinue)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
