import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:unit_auto/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:unit_auto/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:unit_auto/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:unit_auto/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:unit_auto/utils/constants/image_strings.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          /// Horizontal Scrollable pages (Основная страница Splash экрана)
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: UImages.onBoardingImage1,
                title: UTexts.onBoardingTitle1,
                subTitle: UTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: UImages.onBoardingImage2,
                title: UTexts.onBoardingTitle2,
                subTitle: UTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: UImages.onBoardingImage3,
                title: UTexts.onBoardingTitle3,
                subTitle: UTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          ///  Skip button (Кнопка "пропустить")
          const OnBoardingSkip(),

          ///  Dot Navigation SmoothPageIndicator (Точечная навигация)
          const OnBoardingDotNavigation(),

          /// Circular Button (Круглая кнопка "следующая страница")
          const OnBoardingNextButton(),
        ]),
      ),
    );
  }
}
