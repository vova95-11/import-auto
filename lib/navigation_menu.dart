import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:unit_auto/features/personalization/screens/settings/settings.dart';
import 'package:unit_auto/features/shop/screens/chat/chat.dart';
import 'package:unit_auto/features/shop/screens/home/widgets/home.dart';
import 'package:unit_auto/features/shop/screens/offer/offer.dart';
import 'package:unit_auto/features/shop/screens/zakaz/zakaz.dart';
import 'package:unit_auto/utils/constants/colors.dart';
import 'package:unit_auto/utils/device/device_utility.dart';
import 'package:unit_auto/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = UHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Theme(
          data: darkMode
              ? ThemeData(
                  brightness: Brightness.dark,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                )
              : ThemeData(
                  brightness: Brightness.light,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
          child: NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            backgroundColor: darkMode ? UColors.black : Colors.white,
            indicatorColor: Colors.transparent,
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home, size: 24),
                selectedIcon: Icon(Iconsax.home, size: 26, color: Color.fromARGB(255, 4, 182, 135)),
                label: "Главная",
                tooltip: '',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.driver_2, size: 24),
                selectedIcon: Icon(Iconsax.driver_2, size: 26, color: Color.fromARGB(255, 4, 182, 135)),
                label: "Варианты",
                tooltip: '',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.add_circle5, size: 40, color: Color.fromARGB(255, 2, 121, 89)),
                selectedIcon: Icon(Iconsax.add_circle, size: 40, color: Color.fromARGB(255, 4, 182, 135)),
                label: "",
                tooltip: '',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.message, size: 24),
                selectedIcon: Icon(Iconsax.message, size: 26, color: Color.fromARGB(255, 4, 182, 135)),
                label: "Чат",
                tooltip: '',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.profile_circle, size: 24),
                selectedIcon: Icon(Iconsax.profile_circle, size: 26, color: Color.fromARGB(255, 4, 182, 135)),
                label: "Профиль",
                tooltip: '',
              ),
            ],
          ),
        ),
        // ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      //  appBar: UCustomNavigationAppBar(darkMode: darkMode),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const OfferScreen(),
    const ZakazScreen(),
    const ChatScreen(),
    const SettingsScreen(),
  ];
}

class UCustomNavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UCustomNavigationAppBar({
    super.key,
    required this.darkMode,
  });

  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(130, 183, 159, 1),
      systemOverlayStyle: darkMode
          ? const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: UColors.brightnessDark,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
            )
          : const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UDeviceUtils.getAppBarHeightNavigationAppBar());
}
