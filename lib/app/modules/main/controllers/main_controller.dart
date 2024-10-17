import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_shop/app/data/providers/api_service.dart';

class MainController extends GetxController {
  final box = GetStorage();
  final apiService = ApiService();

  void logout() async {
    await apiService.logout();
    box.remove("token");

    Get.offAllNamed('/login');
    Get.snackbar(
      'Success',
      'User logged out successfully',
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.green,
    );
  }
}
