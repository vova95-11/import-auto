import 'package:flutter/material.dart';
import 'package:unit_auto/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:unit_auto/utils/constants/sizes.dart';
import 'package:unit_auto/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title
                Text(UTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: USizes.spaceBtwSections32),

                /// Form
                const USignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
