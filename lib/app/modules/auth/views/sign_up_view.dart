import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:plan_shop/app/constants/colors.dart';
import 'package:plan_shop/app/modules/auth/controllers/signup_controller.dart';

class SignUpView extends GetView<SignupController> {
  SignUpView({super.key});

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(color: mainColor));
          } else {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 120),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    GetBuilder<SignupController>(
                      builder: (_) {
                        return Stack(
                          children: [
                            controller.image == null
                                ? const CircleAvatar(
                                    radius: 73,
                                    backgroundColor: mainColor,
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          AssetImage('assets/placeholder.jpg'),
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 75,
                                    backgroundColor: mainColor,
                                    child: CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          FileImage(controller.image!),
                                    ),
                                  ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: IconButton(
                                  onPressed: () {
                                    controller.pickImage();
                                  },
                                  icon: const HugeIcon(
                                    icon: HugeIcons.strokeRoundedCamera02,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                prefixIcon: HugeIcon(
                                  icon: HugeIcons.strokeRoundedUser,
                                  color: Colors.grey,
                                ),
                                hintText: "Name",
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 189, 188, 188),
                                    width: 1.8,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  borderSide:
                                      BorderSide(color: mainColor, width: 2),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name is required";
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
                          horizontal: 16, vertical: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                prefixIcon: HugeIcon(
                                  icon: HugeIcons.strokeRoundedMail01,
                                  color: Colors.grey,
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 189, 188, 188),
                                    width: 1.8,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  borderSide:
                                      BorderSide(color: mainColor, width: 2),
                                ),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                prefixIcon: HugeIcon(
                                  icon:
                                      HugeIcons.strokeRoundedSquareLockPassword,
                                  color: Colors.grey,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 189, 188, 188),
                                    width: 1.8,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  borderSide:
                                      BorderSide(color: mainColor, width: 2),
                                ),
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
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final email = emailController.text.trim();
                              final name = nameController.text.trim();
                              final password = passwordController.text.trim();
                              final status = await controller.register(
                                  name: name, email: email, password: password);
                              if (status) {
                                _formKey.currentState!.reset();
                              }
                            }
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: mainColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
