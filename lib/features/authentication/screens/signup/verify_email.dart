import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/data/repositories/authentication/authentication_repository.dart';
import 'package:unit_auto/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return SafeArea(
      child: Scaffold(
        /// The close icon in the app bar is used to log out the user and redirect them to the login screen.
        /// This approach is taken to handle scenarios where the user enters the registration process,
        /// and the data is stored. Upon reopening the app, it checks if the email is verified.
        /// if not verified, the app always navigates to the verification screen.
        /// Значок закрытия на панели приложения используется для выхода пользователя из системы и перенаправления его на экран входа в систему.
        /// Этот подход используется для обработки сценариев, в которых пользователь входит в процесс регистрации,
        /// и данные сохраняются. При повторном открытии приложения оно проверяет, подтверждено ли электронное письмо.
        /// если не подтверждено, приложение всегда переходит к экрану подтверждения.

        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace24),
            child: Column(
              children: [
                /// Image
                Image(
                  image: const AssetImage(UImages.verifyEmail),
                  width: UHelperFunctions.screenWidth() * 0.6,
                  height: UHelperFunctions.screenHeight() * 0.3,
                ),
                const SizedBox(height: USizes.spaceBtwSections32),

                /// Title & SubTitle
                Text(UTexts.confirmEmail,
                    style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
                const SizedBox(height: USizes.spaceBtwItems16),
                Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
                const SizedBox(height: USizes.spaceBtwItems16),
                Text(UTexts.confirmEmailSubTitle,
                    style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
                const SizedBox(height: USizes.spaceBtwSections32),

                /// Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.checkEmailVerificationStatus(), child: const Text(UTexts.uContinue)),
                ),
                const SizedBox(height: USizes.spaceBtwItems16),
                SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () => controller.sendEmailVerification(), child: const Text(UTexts.recendEmail))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
