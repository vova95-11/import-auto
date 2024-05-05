import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/common/widgets/loaders/animation_loader.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

/// A utility class for managing a full-screen loading dialog.
class UFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// This method doesn't return anything.
  ///
  /// Parameters:
  ///   - text: The text to be displayed in the loading dialog.
  ///   - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, // Используйте Get.overlayContext для наложения диалоговых окон.
      barrierDismissible: false, // Диалоговое окно нельзя закрыть, нажав за его пределами.
      builder: (_) => PopScope(
        canPop: false, // Отключить всплывающее окно кнопкой «Назад»
        child: Container(
          color: UHelperFunctions.isDarkMode(Get.context!) ? UColors.dark : UColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              UAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// Остановить открытый в данный момент диалог загрузки.
  /// Этот метод ничего не возвращает.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // Закройте диалог с помощью Навигатора
  }
}
