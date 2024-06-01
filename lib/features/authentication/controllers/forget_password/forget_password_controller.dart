import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unit_auto/data/repositories/authentication/authentication_repository.dart';
import 'package:unit_auto/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/device/loaders.dart';
import 'package:unit_auto/utils/helpers/network_manager.dart';
import 'package:unit_auto/utils/popups/full_screen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Обработка вашего запроса...', UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Show Success Screen
      ULoaders.successSnackBar(title: 'Письмо отправлено', message: 'На электронную почту отправлена ссылка для сброса пароля'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      UFullScreenLoader.stopLoading();
      ULoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Обработка вашего запроса...', UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Show Success Screen
      ULoaders.successSnackBar(title: 'Письмо отправлено', message: 'На электронную почту отправлена ссылка для сброса пароля'.tr);
    } catch (e) {
      // Remove Loader
      UFullScreenLoader.stopLoading();
      ULoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
    }
  }
}
