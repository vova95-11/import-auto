import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:unit_auto/features/authentication/screens/login/login.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll (Обновлять текущий индекс при прокрутке страницы)
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page (Перейти на страницу, выбранную конкретной точкой)
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  /// Update Current Index & jump to next page (Обновите текущий индекс и перейдите на следующую страницу)
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write('IsFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(page, duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  /// Update Current Index & jimp to the last Page (Обновите текущий индекс и перейдите на последнюю страницу)
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }
}
