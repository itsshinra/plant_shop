// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetCheckerController extends GetxController {
  var isConnnected = false;

  @override
  void onInit() {
    checkInternetConnection();
    super.onInit();
  }

  Future<void> checkInternetConnection() async {
    bool isConnnected = await InternetConnectionChecker().hasConnection;
    if (isConnnected) {
      isConnnected = true;
      print('Device is connected to the internet');
    } else {
      isConnnected = false;
      print('Device is not connected to the internet');
    }
  }
}
