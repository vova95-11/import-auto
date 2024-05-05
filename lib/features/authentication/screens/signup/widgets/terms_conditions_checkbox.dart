import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/features/authentication/controllers/signup/signup_controller.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class UTermsAndConditionCheckbox extends StatelessWidget {
  const UTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
          ),
        ),
        const SizedBox(width: USizes.spaceBtwItems16),
        Expanded(
          child: Text.rich(
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            TextSpan(
              children: [
                TextSpan(text: '${UTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: UTexts.termsOfUse,
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: dark ? UColors.white : UColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? UColors.white : UColors.primary,
                      ),
                ),
                TextSpan(text: ' ${UTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: UTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodySmall!.apply(
                        color: dark ? UColors.white : UColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? UColors.white : UColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
