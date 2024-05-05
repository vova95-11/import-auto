import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:unit_auto/features/authentication/screens/login/login.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace24),
        child: Column(
          children: [
            /// Image
            Image(
              image: const AssetImage(UImages.resetPassword),
              width: UHelperFunctions.screenWidth() * 0.6,
              height: UHelperFunctions.screenHeight() * 0.3,
            ),
            const SizedBox(height: USizes.spaceBtwSections32),

            /// Email, Title & SubTitle
            Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
            Text(UTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
            const SizedBox(height: USizes.spaceBtwItems16),
            Text(UTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
            const SizedBox(height: USizes.spaceBtwSections32),

            /// Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => Get.offAll(() => const LoginScreen()), child: const Text(UTexts.done)),
            ),
            const SizedBox(height: USizes.spaceBtwItems16),
            SizedBox(
              width: double.infinity,
              child: TextButton(onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(UTexts.recendEmail)),
            ),
          ],
        ),
      ),
    );
  }
}
