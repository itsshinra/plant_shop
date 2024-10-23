import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:plan_shop/app/constants/colors.dart';
import 'package:plan_shop/app/data/models/post_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, this.postId, this.post});

  final String? postId;
  final Data? post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appBar(),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Image.network('http://10.0.2.2:8000/posts/${post!.image}'),
            ),
            _titlePlant(),
          ],
        ),
      ),
      bottomSheet: _bottomSheet(),
    );
  }

  Widget _titlePlant() {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${post!.title}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            '${post!.description}',
            style: const TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomSheet() {
    return Container(
      padding: const EdgeInsets.only(top: 26, bottom: 26),
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.network(
                      height: 50,
                      color: Colors.white,
                      "https://cdn-icons-png.flaticon.com/128/4673/4673199.png"),
                  const Text(
                    'Height',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    '${post!.height} cm',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.network(
                      height: 50,
                      color: Colors.white,
                      "https://cdn-icons-png.flaticon.com/128/1843/1843544.png"),
                  const Text(
                    'Temperature',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    '${post!.temperature} C',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.network(
                      height: 50,
                      color: Colors.white,
                      "https://cdn-icons-png.flaticon.com/128/46/46564.png"),
                  const Text(
                    'Pot',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    '${post!.pot}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Price',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      '${post!.price}\$',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    backgroundColor: const Color.fromARGB(255, 62, 104, 62),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: const CircleBorder(),
            backgroundColor: const Color.fromARGB(255, 103, 134, 74),
            foregroundColor: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_rounded),
        ),
        IconButton(
          onPressed: () {},
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedShoppingBagFavorite,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
