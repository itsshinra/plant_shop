import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:plan_shop/app/data/models/category_model.dart';
import 'package:plan_shop/app/modules/main/controllers/category_controller.dart';

import '../../../constants/colors.dart';

class CategoryView extends StatelessWidget {
  CategoryView({super.key, this.category});
  final Category? category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: _appBar(),
      body: GetBuilder<CategoryController>(
        init: CategoryController(),
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
                child: CircularProgressIndicator(color: mainColor));
          }
          return MasonryGridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            // itemCount: controller.posts.posts?.data?.length ?? 0,
            itemCount: 10,
            itemBuilder: (context, index) {
              // final plant = controller.posts.posts!.data![index];
              return GestureDetector(
                onTap: () {
                  // Get.to(
                  //   () => DetailScreen(
                  //     postId: plant.id.toString(),
                  //     post: plant,
                  //   ),
                  // );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                          // imageUrl: plant.image != null
                          //     ? "http://10.0.2.2:8000/posts/${plant.image}"
                          //     : 'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=',
                          imageUrl:
                              'https://tumbleweedplants.com/cdn/shop/files/monstera-deliciosa-grow-pot-potted-plant-tumbleweed-plants-263952.png?v=1726188273',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Column(
                        children: [
                          Text(
                            'Aleo Vera',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'a gracefull plant',
                            style: TextStyle(
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
                          const Text(
                            '30.00\$',
                            style: TextStyle(
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
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: lightBackground,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
        ),
      ),
      title: Text('${category!.title}'),
      titleTextStyle: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      centerTitle: true,
    );
  }
}
