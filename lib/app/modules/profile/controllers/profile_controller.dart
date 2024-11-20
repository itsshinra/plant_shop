import 'package:get/get.dart';
import 'package:plan_shop/app/data/models/user_model.dart';
import 'package:plan_shop/app/data/providers/api_service.dart';

class ProfileController extends GetxController {
  final apiService = ApiService();
  UserResModel user = UserResModel();
  var isLoading = false;

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
        updateUI(false);
      }
    } catch (e) {
      updateUI(false);
      Get.snackbar('Error', e.toString());
    }
  }
}
