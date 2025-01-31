import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:plan_shop/app/constants/colors.dart';
import 'package:plan_shop/app/modules/auth/controllers/login_controller.dart';
import 'package:plan_shop/app/modules/auth/views/sign_up_view.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Image.asset('assets/rb_65197.png'),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Let's Get Started",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              prefixIcon: const HugeIcon(
                                icon: HugeIcons.strokeRoundedMail01,
                                color: Colors.grey,
                              ),
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 189, 188, 188),
                                  width: 1.8,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide:
                                    BorderSide(color: mainColor, width: 3),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: mainColor),
                              ),
                              errorText:
                                  controller.emailErrorMessage.value.isEmpty
                                      ? null
                                      : controller.emailErrorMessage.value,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email is required";
                              }
                              if (GetUtils.isEmail(value) == false) {
                                return "Email is invalid";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: const HugeIcon(
                                icon: HugeIcons.strokeRoundedSquareLockPassword,
                                color: Colors.grey,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey.shade500),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 189, 188, 188),
                                  width: 1.8,
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide:
                                    BorderSide(color: mainColor, width: 3),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: mainColor),
                              ),
                              errorText:
                                  controller.passwordErrorMessage.value.isEmpty
                                      ? null
                                      : controller.passwordErrorMessage.value,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is required";
                              }
                              if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }

                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const WidgetStatePropertyAll(mainColor),
                          foregroundColor:
                              const WidgetStatePropertyAll(Colors.white),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();
                            controller.login(email: email, password: password);
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Get.to(() => SignUpView());
                        },
                        child: const Text(
                          'Signup',
                          style: TextStyle(
                              color: mainColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
