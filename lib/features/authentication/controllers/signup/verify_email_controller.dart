import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:unit_auto/common/widgets/success_screen/success_screen.dart';
import 'package:unit_auto/data/repositories/authentication/authentication_repository.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';
import 'package:unit_auto/utils/device/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
  /// Отправляйте электронное письмо всякий раз, когда появляется экран проверки, и установите таймер для автоматического перенаправления.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link
  /// Отправить ссылку для подтверждения по электронной почте
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ULoaders.successSnackBar(
          title: 'Письмо отправлено',
          message: 'Пожалуйста, проверьте свой почтовый ящик и подтвердите адрес электронной почты.');
    } catch (e) {
      ULoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
    }
  }

  /// Timer to auyomayically redirect on Email Verification
  /// Таймер для автоматического перенаправления при проверке электронной почты
  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(() => SuccessScreen(
                image: UImages.successfullyRegisterAnimation,
                title: UTexts.yourAccountCreatedTitle,
                subTitle: UTexts.yourAccountCreatedSubTitle,
                onPressed: () => AuthenticationRepository.instance.screenRedirect(),
              ));
        }
      },
    );
  }

  /// Manually Check if Email Verified
  /// Вручную проверьте, подтвержден ли адрес электронной почты
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: UImages.successfullyRegisterAnimation,
          title: UTexts.yourAccountCreatedTitle,
          subTitle: UTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
