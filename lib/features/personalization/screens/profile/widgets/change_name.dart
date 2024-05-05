import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unit_auto/common/widgets/appbar/appbar.dart';
import 'package:unit_auto/features/personalization/controllers/update_name_controller.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';
import 'package:unit_auto/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      /// Custom Appbar
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Изменить личные данные', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              'Указывайте реальные данные своего имени. Это упростит Вашу идентификацию и ускорит доступ к аукционнам.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: USizes.spaceBtwSections32),

            /// Text field and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => UValidator.validateEmptyText('Имя', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: UTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: USizes.spaceBtwInputFields16),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => UValidator.validateEmptyText('Фамилия', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: UTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: USizes.spaceBtwSections32),

            /// Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Сохранить')),
            ),
          ],
        ),
      ),
    );
  }
}
