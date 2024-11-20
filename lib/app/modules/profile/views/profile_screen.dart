import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:plan_shop/app/modules/main/controllers/main_controller.dart';
import 'package:plan_shop/app/modules/profile/controllers/profile_controller.dart';

import '../../../constants/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: lightBackground,
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (profileController) {
          if (profileController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          final user = profileController.user.user;
          return SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 50),
                user == null && user?.profileImage == null
                    ? const CircleAvatar(
                        radius: 83,
                        backgroundColor: mainColor,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.green,
                          backgroundImage: NetworkImage(
                              'https://c8.alamy.com/zooms/9/d4c59d90389444e3b1166312d2f7fa51/p9mywr.jpg'),
                        ),
                      )
                    : CircleAvatar(
                        radius: 84,
                        backgroundColor: mainColor,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.green,
                          backgroundImage: NetworkImage(
                            'http://10.0.2.2:8000/profiles/${user!.profileImage!}',
                          ),
                        ),
                      ),
                const SizedBox(height: 10),
                Text(
                  '${user!.name}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 2,
                              color: mainColor,
                            ),
                          ),
                          child: const Text(
                            'Bio...',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                            color: mainColor,
                            width: 2,
                          ),
                        ),
                      ),
                      backgroundColor:
                          const WidgetStatePropertyAll(lightContainer),
                    ),
                    onPressed: () {
                      _showLogoutDialog(context);
                    },
                    child: const Row(
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedLogout01,
                          color: mainColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Logout',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 60,
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                            color: Colors.red,
                            width: 2,
                          ),
                        ),
                      ),
                      backgroundColor:
                          const WidgetStatePropertyAll(lightContainer),
                    ),
                    onPressed: () {
                      _showDeleteDialog(context);
                    },
                    child: const Row(
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedDelete01,
                          color: Colors.red,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Delete',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: lightBackground,
      title: const Text(
        'Profile',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade100,
          title: const Text('Delete'),
          content: const Text('Are you sure you want to delete your account?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            GetBuilder<MainController>(
              init: MainController(),
              builder: (controller) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: TextButton(
                    onPressed: () {
                      controller.deleteUser();
                    },
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade100,
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout you account?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            GetBuilder<MainController>(
              init: MainController(),
              builder: (controller) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: TextButton(
                    onPressed: () {
                      controller.logout();
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
