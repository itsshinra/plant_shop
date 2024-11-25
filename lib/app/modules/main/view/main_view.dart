import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../constants/colors.dart';
import '../controllers/main_controller.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        return Scaffold(
          body: Obx(() => controller.screens[controller.selectedIndex.value]),
          extendBody: true,
          bottomNavigationBar: Obx(
            () => CrystalNavigationBar(
              marginR: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              paddingR: const EdgeInsets.all(10),
              selectedItemColor: mainColor,
              currentIndex: controller.selectedIndex.value,
              onTap: controller.changeIndex,
              unselectedItemColor: Colors.white70,
              backgroundColor: Colors.black.withOpacity(0.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
              items: [
                /// Home
                CrystalNavigationBarItem(
                  icon: HugeIcons.strokeRoundedHome09,
                  unselectedIcon: HugeIcons.strokeRoundedHome09,
                ),

                /// Search
                CrystalNavigationBarItem(
                  icon: HugeIcons.strokeRoundedSearch01,
                  unselectedIcon: HugeIcons.strokeRoundedSearch01,
                ),

                /// Add
                CrystalNavigationBarItem(
                  icon: HugeIcons.strokeRoundedAddCircleHalfDot,
                  unselectedIcon: HugeIcons.strokeRoundedAddCircleHalfDot,
                ),

                /// Cart
                CrystalNavigationBarItem(
                  icon: HugeIcons.strokeRoundedShoppingBasket03,
                  unselectedIcon: HugeIcons.strokeRoundedShoppingBasket03,
                ),

                /// Profile
                CrystalNavigationBarItem(
                  icon: HugeIcons.strokeRoundedUser,
                  unselectedIcon: HugeIcons.strokeRoundedUser,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
