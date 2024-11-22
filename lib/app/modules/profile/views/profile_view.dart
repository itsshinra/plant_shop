import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:plan_shop/app/modules/main/controllers/main_controller.dart';
import 'package:plan_shop/app/modules/profile/controllers/profile_controller.dart';
import 'package:plan_shop/app/modules/profile/views/screens/address_screen.dart';
import 'package:plan_shop/app/modules/profile/views/screens/setting_screen.dart';
import 'package:plan_shop/app/modules/profile/views/screens/you_profile_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../constants/colors.dart';
import '../widget/list_tile.dart';

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
            return const Skeletonizer(
              enabled: true,
              child: CircleAvatar(radius: 70),
            );
          }
          final user = profileController.user.user;
          return SafeArea(
            child: Column(
              children: [
                user == null && user?.profileImage == null
                    ? const CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            'https://c8.alamy.com/zooms/9/d4c59d90389444e3b1166312d2f7fa51/p9mywr.jpg'),
                      )
                    : CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                          'http://10.0.2.2:8000/profiles/${user!.profileImage!}',
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
                ListTileItem(
                  onTap: () => Get.to(() => const YouProfileScreen()),
                  icon: HugeIcons.strokeRoundedUser,
                  title: 'Your Profile',
                ),
                ListTileItem(
                  onTap: () => Get.to(() => const AddressScreen()),
                  icon: HugeIcons.strokeRoundedLocation10,
                  title: 'Address',
                ),
                ListTileItem(
                  icon: HugeIcons.strokeRoundedCreditCard,
                  title: 'Payment Methods',
                ),
                ListTile(
                    leading: const Icon(
                      HugeIcons.strokeRoundedSun03,
                      color: mainColor,
                    ),
                    title: const Text(
                      'Light Mode',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    trailing: Switch(
                      activeColor: mainColor,
                      value: true,
                      onChanged: (value) {},
                    )),
                ListTileItem(
                  onTap: () => Get.to(() => const SettingScreen()),
                  icon: HugeIcons.strokeRoundedSettings02,
                  title: 'Settings',
                ),
                ListTileItem(
                  icon: HugeIcons.strokeRoundedHelpCircle,
                  title: 'Help Center',
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: mainColor,
                            width: 2,
                          ),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(lightBackground),
                    ),
                    onPressed: () {
                      _showLogoutBottomSheet(context);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedLogout03,
                          color: mainColor,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Log out',
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    Image.asset('assets/icon/21 No_BG.png', height: 80),
                    const Text(
                      '@Copyright by 21Greenvue',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
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
    );
  }

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey.shade100,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Divider(color: Colors.grey.shade300),
              const SizedBox(height: 16),
              const Text(
                'Are you sure you want to logout your account?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade300,
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  GetBuilder<MainController>(
                    init: MainController(),
                    builder: (controller) {
                      return Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: mainColor,
                        ),
                        child: TextButton(
                          onPressed: () => controller.logout(),
                          child: const Text(
                            'Yes, Logout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
