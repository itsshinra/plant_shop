import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../constants/colors.dart';
import '../../profile/controllers/profile_controller.dart';
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
          bottomNavigationBar: Obx(
            () => SalomonBottomBar(
              curve: Curves.easeInOut,
              backgroundColor: lightContainer,
              unselectedItemColor: Colors.grey,
              currentIndex: controller.selectedIndex.value,
              onTap: controller.changeIndex,
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(HugeIcons.strokeRoundedHome09),
                  title: const Text("Home"),
                  selectedColor: mainColor,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(HugeIcons.strokeRoundedSearch01),
                  title: const Text("Search"),
                  selectedColor: mainColor,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(HugeIcons.strokeRoundedAddCircleHalfDot),
                  title: const Text("Post"),
                  selectedColor: mainColor,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(HugeIcons.strokeRoundedShoppingBasket03),
                  title: const Text("Cart"),
                  selectedColor: mainColor,
                ),
                SalomonBottomBarItem(
                  icon: GetBuilder<ProfileController>(
                    init: ProfileController(),
                    builder: (controller) {
                      if (controller.isLoading) {
                        return const Skeletonizer(
                          enabled: true,
                          child: CircleAvatar(
                            radius: 15,
                          ),
                        );
                      }
                      final user = controller.user.user;
                      return user != null && user.profileImage != null
                          ? CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                  'http://10.0.2.2:8000/profiles/${user.profileImage!}'),
                            )
                          : const CircleAvatar(
                              radius: 15,
                              child: Icon(Icons.person),
                            );
                    },
                  ),
                  title: const Text("Profile"),
                  selectedColor: mainColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
