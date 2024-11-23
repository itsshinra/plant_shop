import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_shop/app/data/models/user_model.dart';
import 'package:plan_shop/app/data/providers/api_service.dart';

class ProfileController extends GetxController {
  final apiService = ApiService();
  UserResModel user = UserResModel();
  var isLoading = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onInit() {
    me();
    updateUI(true);
    super.onInit();
  }

  void updateUI(bool state) {
    isLoading = state;
    update();
  }

  void me() async {
    try {
      updateUI(true);
      final user = await apiService.getCurrentUser();
      if (user.user != null) {
        this.user = user;
        nameController.text = user.user!.name.toString();
        emailController.text = user.user!.email.toString();
        updateUI(false);
      }
    } catch (e) {
      updateUI(false);
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
