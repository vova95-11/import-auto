import 'package:flutter/material.dart';
import 'package:unit_auto/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: USizes.defaultSpace24,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: const Text('Пропустить'),
      ),
    );
  }
}
