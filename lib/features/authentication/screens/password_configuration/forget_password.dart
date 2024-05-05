import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unit_auto/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';
import 'package:unit_auto/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings Заголовок
            Text(UTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: USizes.spaceBtwItems16),
            Text(UTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: USizes.spaceBtwSections32 * 2),

            /// Text field Текстовое поле
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                  controller: controller.email,
                  validator: UValidator.validateEmail,
                  decoration: const InputDecoration(labelText: UTexts.email, prefixIcon: Icon(Iconsax.direct_right))),
            ),
            const SizedBox(height: USizes.spaceBtwSections32),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(UTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
