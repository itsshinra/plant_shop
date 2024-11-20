import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_shop/app/data/providers/api_service.dart';
import 'package:plan_shop/app/modules/main/view/main_view.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  final apiService = ApiService();
  final box = GetStorage();

  var emailErrorMessage = ''.obs;
  var passwordErrorMessage = ''.obs;

  void login({required String email, required String password}) async {
    isLoading.value = true;

    emailErrorMessage.value = '';
    passwordErrorMessage.value = '';

    try {
      final response = await apiService.login(email: email, password: password);
      if (response.token != null) {
        box.write("token", response.token);
        Get.snackbar(
          'Success',
          "User logged in successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAll(() => const MainView());
      }
    } catch (e) {
      isLoading.value = false;
      emailErrorMessage.value = 'Invalid email or password';
      passwordErrorMessage.value = 'Invalid email or password';

      Get.snackbar(
        'Error',
        'Invalid email or password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
