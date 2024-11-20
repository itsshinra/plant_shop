import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plan_shop/app/constants/colors.dart';
import 'package:plan_shop/app/data/providers/api_service.dart';

import '../../main/view/main_view.dart';

class SignupController extends GetxController {
  final _imagePicker = ImagePicker();
  File? image;

  final apiServie = ApiService();
  var isLoading = false.obs;

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    try {
      final response = await apiServie.register(
        name: name,
        email: email,
        password: password,
        image: image,
      );
      if (response) {
        Get.offAll(() => const MainView());
        Get.snackbar(
          'Success',
          'User registered successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: mainColor,
          colorText: Colors.white,
        );
        return true;
      }
      return false;
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  void pickImage() async {
    try {
      final xFile = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        image = File(xFile.path);
        update();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
