import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unit_auto/bindings/general_bindings.dart';
import 'package:unit_auto/routes/app_routes.dart';
import 'package:unit_auto/utils/constants/colors.dart';

import 'utils/theme/theme.dart';

class UnitAuto extends StatelessWidget {
  const UnitAuto({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Unit: импорт авто',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: UAppTheme.lightTheme,
      darkTheme: UAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,

      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relewant screen.
      home: const Scaffold(
        backgroundColor: UColors.primary,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
