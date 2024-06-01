import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:unit_auto/data/repositories/authentication/authentication_repository.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/device/loaders.dart';
import 'package:unit_auto/utils/helpers/network_manager.dart';
import 'package:unit_auto/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = true.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // ПРИ ПЕРВОМ ЗАПУСКЕ ВЫДАЕТ ОШИБКУ ТАК КАК В ЛОКАЛЬНОМ ХРАНИЛИЩЕ НЕТ ПОЛЬЗОВАТЕЛЯ = NULL, а ДОЛЖНА БЫТЬ STRING
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    //password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }

  /// -- Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Вход в систему...', UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      UFullScreenLoader.stopLoading();
      ULoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
    }
  }
}
