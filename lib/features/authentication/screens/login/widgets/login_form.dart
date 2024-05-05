import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unit_auto/features/authentication/controllers/login/login_controller.dart';
import 'package:unit_auto/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:unit_auto/features/authentication/screens/signup/signup.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';
import 'package:unit_auto/utils/validators/validation.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: USizes.spaceBtwInputFields16),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: (value) => UValidator.validateEmail(value),
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: UTexts.email),
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
            const SizedBox(height: USizes.spaceBtwInputFields16 / 2),

            /// Remember Me & Forget Password (Запомнить меня и забыть пароль)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                    ),
                    const Text(UTexts.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(UTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: USizes.spaceBtwInputFields16),

            /// Sign In Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(), child: const Text(UTexts.signIn))),

            const SizedBox(height: USizes.sm8),

            /// Create Account Button
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(UTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
