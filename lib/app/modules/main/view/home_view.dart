import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plan_shop/app/constants/colors.dart';
import 'package:plan_shop/app/data/models/category_model.dart';
import 'package:plan_shop/app/modules/cart/views/cart_view.dart';
import 'package:plan_shop/app/modules/main/controllers/category_controller.dart';
import 'package:plan_shop/app/modules/main/view/category_view.dart';
import 'package:plan_shop/app/modules/main/view/detail_view.dart';
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
                const SizedBox(height: 30),
                _searchField(),
                const SizedBox(height: 20),
                _bannerPromotion(),
                const SizedBox(height: 20),
                _category(),
                const SizedBox(height: 12),
                _postItem(controller),
              ],
            ),
          );
        },
      ),
      floatingActionButton: _circleButton(),
    );
  }

  Widget _postItem(PostController controller) {
    return MasonryGridView.count(
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
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                  child: CachedNetworkImage(
                    imageUrl: plant.image != null
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
    );
  }

  Widget _category() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'see all',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: SizedBox(
            height: 50,
            child: GetBuilder<CategoryController>(
                init: CategoryController(),
                builder: (controller) {
                  if (controller.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.category.category!.length,
                    itemBuilder: (context, index) {
                      final category = controller.category.category![index];
                      return _categoryItem(category);
                    },
                  );
                }),
          ),
        ),
      ],
    );
  }

  Widget _categoryItem(Category category) {
    return GestureDetector(
      onTap: () => Get.to(
        () => CategoryView(
          category: category,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Color.fromARGB(255, 99, 209, 89),
              Colors.lightGreenAccent,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${category.title}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Image.network(
              'http://10.0.2.2:8000/categories/${category.image}',
              width: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bannerPromotion() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: lightContainer,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 99, 209, 89),
            Colors.green,
            Colors.white,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: lightBackground,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/128/2917/2917995.png',
                      width: 25,
                    ),
                    const Text(
                      'Plant tips',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Help your plant survive \nwhen you are away.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          SizedBox(
            height: 150,
            child: Image.network(
              'https://www.frameratemerch.com/cdn/shop/products/plantpin_0002_Monstera.png?v=1658873676',
              loadingBuilder: (context, child, progress) {
                return progress == null
                    ? child
                    : const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ],
      ),
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
