import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plan_shop/app/constants/colors.dart';
import 'package:plan_shop/app/modules/main/view/detail_screen.dart';
import 'package:plan_shop/app/modules/post/views/post_screen.dart';
import 'package:plan_shop/app/modules/profile/views/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _plants = [
    "https://www.concordamericanflagpole.com/wp-content/uploads/revslider/basic-hero-collection/1-plant.png",
    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/cbf84343-a8e7-43dd-93c9-de1278dca06c/d671ksv-77ff41e2-33d9-4436-bc0f-9862c35a4122.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2NiZjg0MzQzLWE4ZTctNDNkZC05M2M5LWRlMTI3OGRjYTA2Y1wvZDY3MWtzdi03N2ZmNDFlMi0zM2Q5LTQ0MzYtYmMwZi05ODYyYzM1YTQxMjIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.D-Od29TVmVk2rVNpsY5gAQks3TGJMk2MwAMs3z053JE",
    "https://i.pinimg.com/originals/6f/48/a3/6f48a3aeaff9ce0d82ef7ec3646031f1.png",
    "https://purepng.com/public/uploads/large/plant-1hn.png",
    "https://clipart-library.com/images_k/transparent-plants/transparent-plants-14.png",
    "https://www.concordamericanflagpole.com/wp-content/uploads/revslider/basic-hero-collection/1-plant.png",
    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/cbf84343-a8e7-43dd-93c9-de1278dca06c/d671ksv-77ff41e2-33d9-4436-bc0f-9862c35a4122.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2NiZjg0MzQzLWE4ZTctNDNkZC05M2M5LWRlMTI3OGRjYTA2Y1wvZDY3MWtzdi03N2ZmNDFlMi0zM2Q5LTQ0MzYtYmMwZi05ODYyYzM1YTQxMjIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.D-Od29TVmVk2rVNpsY5gAQks3TGJMk2MwAMs3z053JE",
    "https://i.pinimg.com/originals/6f/48/a3/6f48a3aeaff9ce0d82ef7ec3646031f1.png",
    "https://purepng.com/public/uploads/large/plant-1hn.png",
    "https://clipart-library.com/images_k/transparent-plants/transparent-plants-14.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: _appBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 50),
          _searchField(),
          const SizedBox(height: 20),
          _plantGrid(),
        ],
      ),
      floatingActionButton: _circleButton(),
    );
  }

  Widget _plantGrid() {
    return MasonryGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 2,
      //   childAspectRatio: 0.6,
      // ),
      crossAxisCount: 2,
      itemCount: _plants.length,
      itemBuilder: (context, index) {
        var plant = _plants[index];
        return _plantItem(plant);
      },
    );
  }

  Widget _plantItem(String plant) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DetailScreen()));
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
              child: Image.network(
                plant,
                fit: BoxFit.contain,
              ),
            ),
            const Column(
              children: [
                Text(
                  'Plant',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'add lift to uour garden',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '10,99\$',
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
      title: const Text(
        "Search Product",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 32.0),
            child: CircleAvatar(
              backgroundColor: Colors.green,
              backgroundImage: NetworkImage(
                  'https://c8.alamy.com/zooms/9/d4c59d90389444e3b1166312d2f7fa51/p9mywr.jpg'),
            ),
          ),
        ),
      ],
    );
  }
}
