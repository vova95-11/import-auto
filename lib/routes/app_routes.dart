import 'package:get/get.dart';
import 'package:unit_auto/features/personalization/screens/settings/settings.dart';
import 'package:unit_auto/features/shop/screens/home/home.dart';
import 'package:unit_auto/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: URoutes.home, page: () => const HomeScreen()),
    GetPage(name: URoutes.settings, page: () => const SettingsScreen()),
  ];
}
