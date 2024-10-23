import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plan_shop/app/data/models/post_model.dart';
import 'package:plan_shop/app/data/providers/api_service.dart';

class PostController extends GetxController {
  final apiSevice = ApiService();
  var isLoading = false;
  PostModel posts = PostModel();
  final _imagePicker = ImagePicker();
  File? image;

  void updateUI(bool state) {
    isLoading = state;
    update();
  }

  @override
  void onInit() {
    getPosts();
    super.onInit();
  }

  Future getPosts() async {
    try {
      updateUI(true);
      final postData = await apiSevice.getPosts();
      posts = postData;
      updateUI(false);
    } catch (e) {
      updateUI(false);
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
