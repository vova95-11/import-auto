import 'package:flutter/material.dart';
import 'package:unit_auto/features/authentication/screens/login/widgets/login_form.dart';
import 'package:unit_auto/features/authentication/screens/login/widgets/login_header.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(USizes.defaultSpace24),
            child: Column(
              children: [
                /// Logo, Title & sub-Title
                ULoginHeader(),

                /// Form
                const ULoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
