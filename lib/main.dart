import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plan_shop/app/bindings/internet_checker_binding.dart';
import 'package:plan_shop/app/modules/auth/bindings/auth_binding.dart';
import 'package:plan_shop/app/modules/auth/views/login_view.dart';
import 'package:plan_shop/app/modules/auth/views/sign_up_view.dart';
import 'package:plan_shop/app/modules/main/bindings/main_binding.dart';
import 'package:plan_shop/app/modules/main/middleware/main_middleware.dart';
import 'package:plan_shop/app/modules/main/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/main',
      initialBinding: InternetCheckerBinding(),
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginView(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/sign_up',
          page: () => SignUpView(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: '/main',
          page: () => HomeScreen(),
          binding: MainBinding(),
          middlewares: [
            MainMiddleware(),
          ],
        ),
      ],
    );
  }
}
