import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_shop/app/data/models/category_model.dart';
import 'package:plan_shop/app/data/models/category_plant_model.dart';
import 'package:plan_shop/app/data/providers/api_service.dart';

class CategoryController extends GetxController {
  var isLoading = false;
  final apiService = ApiService();
  CategoryModel category = CategoryModel();
  CategoryPlantModel categoryPlant = CategoryPlantModel();

  void updateUI(bool state) {
    isLoading = state;
    update();
  }

  @override
  void onInit() {
    getCategorys();
    getCategoryPlant();
    super.onInit();
  }

  Future getCategorys() async {
    try {
      updateUI(true);
      final categoryData = await apiService.getCategory();
      category = categoryData;
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

  Future getCategoryPlant() async {
    try {
      updateUI(true);
      final categoryPlantData = await apiService.getCategoryPlant();
      categoryPlant = categoryPlantData;
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
}
