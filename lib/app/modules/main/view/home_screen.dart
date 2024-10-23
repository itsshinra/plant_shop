import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plan_shop/app/constants/colors.dart';
import 'package:plan_shop/app/modules/cart/views/cart_view.dart';
import 'package:plan_shop/app/modules/main/view/detail_screen.dart';
import 'package:plan_shop/app/modules/post/controllers/post_controller.dart';
import 'package:plan_shop/app/modules/post/views/post_screen.dart';
import 'package:plan_shop/app/modules/profile/controllers/profile_controller.dart';
import 'package:plan_shop/app/modules/profile/views/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: _appBar(),
      body: GetBuilder<PostController>(
        init: PostController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
                child: CircularProgressIndicator(color: mainColor));
          }
          return RefreshIndicator(
            backgroundColor: mainColor,
            color: Colors.white,
            onRefresh: () {
              return controller.getPosts();
            },
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 50),
                _searchField(),
                const SizedBox(height: 20),
                MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  itemCount: controller.posts.posts?.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final plant = controller.posts.posts!.data![index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => DetailScreen(
                            postId: plant.id.toString(),
                            post: plant,
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        width: 170,
                        decoration: BoxDecoration(
                          color: lightContainer,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Image.network(
                                plant.image != null
                                    ? "http://10.0.2.2:8000/posts/${plant.image}"
                                    : 'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=',
                                fit: BoxFit.contain,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '${plant.title}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  '${plant.description}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${plant.price}\$',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    log('add to favorites');
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5),
                                      child: HugeIcon(
                                        icon: HugeIcons.strokeRoundedHeartAdd,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: _circleButton(),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  color: Colors.black,
                ),
                suffixIcon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                fillColor: lightContainer,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search plant",
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: lightContainer,
            ),
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedFilterHorizontal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton() {
    return FloatingActionButton(
      shape: const CircleBorder(),
      elevation: 0,
      backgroundColor: mainColor,
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PostScreen()));
      },
      child: const HugeIcon(
        icon: HugeIcons.strokeRoundedAddCircle,
        color: Colors.white,
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.grey.shade200,
      surfaceTintColor: Colors.grey.shade200,
      centerTitle: true,
      leadingWidth: 80,
      leading: Padding(
        padding: const EdgeInsets.only(left: 32),
        child: IconButton(
            onPressed: () {
              Get.to(() => const CartView());
            },
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedShoppingBagFavorite,
              color: Colors.black,
            )),
      ),
      title: const Text(
        "Search Product",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.to(() => const ProfileScreen());
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (controller) {
                if (controller.isLoading) {
                  return const Center(
                      child: CircularProgressIndicator(color: mainColor));
                }
                final user = controller.user.user;
                return user != null && user.profileImage != null
                    ? CircleAvatar(
                        backgroundColor: Colors.green,
                        backgroundImage: NetworkImage(
                            'http://10.0.2.2:8000/profiles/${user.profileImage!}'),
                      )
                    : const CircleAvatar(
                        backgroundColor: mainColor,
                        child: Icon(Icons.person),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}
