import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:khedma_link/constants/colors.dart';
import 'package:khedma_link/screens/home.dart';
import 'package:khedma_link/screens/home_page/home_screen.dart';
import 'package:khedma_link/screens/profile_page/settings.dart';
import 'package:khedma_link/screens/project_page/project_screen.dart';
import 'package:khedma_link/screens/search/search_page.dart';

class RecruiterNavigationMenu extends StatelessWidget {
  const RecruiterNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: Colors.white,
          // ignore: deprecated_member_use
          indicatorColor: TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
                icon: Icon(Iconsax.profile_2user), label: 'My Projects'),
            NavigationDestination(
                icon: Icon(Iconsax.add_square4), label: 'Create Projects '),
            NavigationDestination(icon: Icon(Iconsax.home_24), label: 'home'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 2.obs;

  final screens = [
    const TodoHomeScreen(),
    const ProjectScreen(),
    const HomeScreen(),
    const SettingsScreen(),
  ];
}
