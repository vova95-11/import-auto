import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/data/repositories/authentication/authentication_repository.dart';
import 'package:unit_auto/data/repositories/user/user_repository.dart';
import 'package:unit_auto/features/authentication/screens/signup/verify_email.dart';
import 'package:unit_auto/features/personalization/models/user_model.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/device/loaders.dart';
import 'package:unit_auto/utils/device/network_manager.dart';
import 'package:unit_auto/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final userName = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber = TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///  -- SIGNUP
  void signup() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Мы обрабатываем Вашу информацию...', UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        ULoaders.warningSnackBar(
          title: "Примите политику конфиденциальности",
          message:
              "Чтобы создать учетную запись, Вам необходимо прочитать и принять Политику конфиденциальности и Условия использования",
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final UserCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: UserCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Show Success Message
      ULoaders.successSnackBar(
          title: 'Поздравляем!',
          message: 'Ваш аккаунт был создан! Подтвердите адрес электронной почты, чтобы продолжить.');

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Show some Generic Error to the user // Показать пользователю какую-то общую ошибку
      ULoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
    }
  }
}
