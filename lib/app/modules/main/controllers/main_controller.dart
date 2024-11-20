import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_shop/app/constants/colors.dart';
import 'package:plan_shop/app/data/providers/api_service.dart';

import '../../cart/views/cart_view.dart';
import '../../post/views/post_screen.dart';
import '../../profile/views/profile_view.dart';
import '../../search/view/search_veiw.dart';
import '../view/screens/home_view.dart';

class MainController extends GetxController {
  final box = GetStorage();
  final apiService = ApiService();
  final isLoading = false.obs;

  var selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const SearchVeiw(),
    const PostScreen(),
    const CartView(),
    const ProfileScreen(),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
    update();
  }

  void logout() async {
    await apiService.logout();
    box.remove("token");

    Get.offAllNamed('/login');
    Get.snackbar(
      'Success',
      'User logged out successfully',
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: mainColor,
    );
  }

  Future<void> deleteUser() async {
    try {
      isLoading.value = true;
      bool success = await apiService.delete();
      box.remove("token");

      if (success) {
        Get.snackbar(
          'Success',
          "Account deleted successfully",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar(
        'Error',
        "Faild to delete account",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
