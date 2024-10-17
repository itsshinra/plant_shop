import 'package:get/get.dart';
import '../services/internet_checker_controller.dart';

class InternetCheckerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InternetCheckerController());
  }
}
