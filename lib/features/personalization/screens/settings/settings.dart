import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unit_auto/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:unit_auto/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:unit_auto/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:unit_auto/common/widgets/texts/section_heading.dart';
import 'package:unit_auto/data/repositories/authentication/authentication_repository.dart';
import 'package:unit_auto/utils/constants/sizes.dart';

import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        // backgroundColor: const Color.fromRGBO(130, 183, 159, 1),
        // centerTitle: true,
        automaticallyImplyLeading: false,
        // title: Text('Настройки', style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white)),
        flexibleSpace: UCurvedEdgesWidget(
          child: Container(
            color: const Color.fromRGBO(130, 183, 159, 1),
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: USizes.sm8),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
                //   child: Text('Настройки', style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white)),
                // ),
                const SizedBox(height: USizes.spaceBtwItems16 / 2),
                UUserProfileTile(
                  onPressed: () => Get.to(() => const ProfileScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace24),
              child: Column(
                children: [
                  /// -- Account Settings
                  const USectionHeading(
                    title: 'Настройки профиля',
                    showActionButton: false,
                  ),
                  const SizedBox(height: USizes.spaceBtwItems16),

                  USettingsMenuTile(icon: Iconsax.safe_home, title: 'Город доставки', subtitle: 'Выберите город доставки авто', onTap: () {}),
                  USettingsMenuTile(icon: Iconsax.shopping_cart, title: 'История ставок', subtitle: 'Здесь собрана вся информация по Вашим ставкам', onTap: () {}),
                  USettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'Мои заказы',
                      subtitle: 'Здесь размещена информация о статусе действующего заказа и история завершенных заказов',
                      onTap: () {}),
                  USettingsMenuTile(icon: Iconsax.bag_tick, title: 'Баланс', subtitle: 'Пополняйте баланс или выводите остаток на счет', onTap: () {}),
                  USettingsMenuTile(icon: Iconsax.bag_tick, title: 'Мой промокод', subtitle: 'Введите промокод и получите скидку на автомобиль', onTap: () {}),
                  USettingsMenuTile(icon: Iconsax.bag_tick, title: 'Уведомления', subtitle: 'Настройка уведомлений', onTap: () {}),
                  USettingsMenuTile(
                      icon: Iconsax.bag_tick, title: 'Конфиденциальность', subtitle: 'Управление использованием персональных данных и подключенными устройствами', onTap: () {}),

                  /// -- App Settings
                  const SizedBox(height: USizes.spaceBtwSections32),
                  const USectionHeading(title: 'Настройки приложения', showActionButton: false),
                  const SizedBox(height: USizes.spaceBtwItems16),
                  USettingsMenuTile(icon: Iconsax.document_upload, title: 'Загрузить данные', subtitle: 'Загружайте свои данные в облачное хранилище', onTap: () {}),
                  USettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Геолокация',
                      subtitle: 'Будем информировать об изменениях стоимости доставки в Ваш регион',
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      )),
                  USettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Безопасный режим',
                      subtitle: 'Результат поиска безопасен для всех возрастов',
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      )),
                  USettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Качество изображения HD',
                      subtitle: 'Установите качество изображения, которое будет видно',
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      )),

                  /// -- Logout Button
                  const SizedBox(height: USizes.spaceBtwSections32),
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => AuthenticationRepository.instance.logout(),
                        child: const Text('Выйти'),
                      )),
                  const SizedBox(height: USizes.spaceBtwSections32 * 1.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
