import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unit_auto/features/authentication/controllers/signup/signup_controller.dart';
import 'package:unit_auto/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';
import 'package:unit_auto/utils/validators/validation.dart';

class USignupForm extends StatelessWidget {
  const USignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              /// FirstName
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => UValidator.validateEmptyText('Имя', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: UTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: USizes.spaceBtwInputFields16),

              /// LastName
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => UValidator.validateEmptyText('Фамилия', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: UTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: USizes.spaceBtwInputFields16),

          /// UserName
          TextFormField(
            controller: controller.userName,
            validator: (value) => UValidator.validateEmptyText('Логин', value),
            decoration: const InputDecoration(labelText: UTexts.userName, prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: USizes.spaceBtwInputFields16),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => UValidator.validateEmail(value),
            decoration: const InputDecoration(labelText: UTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: USizes.spaceBtwInputFields16),

          /// Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => UValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(labelText: UTexts.phoneNumber, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: USizes.spaceBtwInputFields16),

          /// Password
          Obx(
            () => TextFormField(
              validator: (value) => UValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: UTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: USizes.spaceBtwInputFields16),

          /// Terms & Conditions Checkbox (Флажок "Правила и условия")
          const UTermsAndConditionCheckbox(),
          const SizedBox(height: USizes.spaceBtwSections32),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(UTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
