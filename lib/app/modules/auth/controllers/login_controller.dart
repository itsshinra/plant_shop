import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_shop/app/data/providers/api_service.dart';
import 'package:plan_shop/app/modules/main/view/home_screen.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final apiService = ApiService();
  final box = GetStorage();

  void login({required String email, required String password}) async {
    isLoading.value = true;

    try {
      final response = await apiService.login(email: email, password: password);
      if (response.token != null) {
        box.write("token", response.token);
        Get.snackbar('Success', "User logged in successfully",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
        Get.offAll(() => const HomeScreen());
      }
    } catch (e) {
      isLoading.value = false;

      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
