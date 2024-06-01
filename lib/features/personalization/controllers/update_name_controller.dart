import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:unit_auto/data/repositories/user/user_repository.dart';
import 'package:unit_auto/features/personalization/controllers/user_controller.dart';
import 'package:unit_auto/features/personalization/screens/profile/profile.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/device/loaders.dart';
import 'package:unit_auto/utils/helpers/network_manager.dart';
import 'package:unit_auto/utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instabce => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      UFullScreenLoader.openLoadingDialog('Мы обновляем Ваши данные...', UImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      UFullScreenLoader.stopLoading();

      // Show SuccessMessage
      ULoaders.successSnackBar(title: 'Поздравляем!', message: 'Личные данные обновлены');

      // Move to previous screen.
      Get.off(() => const ProfileScreen());
    } catch (e) {
      UFullScreenLoader.stopLoading();
      ULoaders.errorSnackBar(title: 'Ошибка', message: e.toString());
    }
  }
}
