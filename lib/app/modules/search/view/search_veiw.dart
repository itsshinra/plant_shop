import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:plan_shop/app/constants/colors.dart';

class SearchVeiw extends StatefulWidget {
  const SearchVeiw({super.key});

  @override
  State<SearchVeiw> createState() => _SearchVeiwState();
}

class _SearchVeiwState extends State<SearchVeiw> {
  String? selectedPriceRange;
  String? selectedCategory;
  String? selectedPotType;

  final List<String> priceRanges = [
    "Under \$20",
    "\$20 - \$50",
    "\$50 - \$100",
    "Over \$100"
  ];
  final List<String> categories = ["Indoor", "Outdoor", "Succulent"];
  final List<String> potTypes = ["Ceramic", "Plastic", "Metal"];

  @override
  Widget build(BuildContext context) {
    bool item = false;
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: _appBar(),
      body: item == false
          ? Center(
              child: Image.asset('assets/search_placeholder.png'),
            )
          : MasonryGridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return postItem();
              },
            ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              // Filter Label
              const Text(
                'Filter List',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Divider(color: Colors.grey.shade300),
              const SizedBox(height: 8),
              // Price Range Dropdown Menu
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Price Range',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField(
                    value: selectedPriceRange,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: mainColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: mainColor),
                      ),
                    ),
                    items: priceRanges
                        .map((range) => DropdownMenuItem(
                              value: range,
                              child: Text(range),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedPriceRange = value;
                      });
                    },
                    dropdownColor: lightBackground,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Category Dropdown Menu
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField(
                    value: selectedCategory,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: mainColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: mainColor),
                      ),
                    ),
                    items: categories
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                    dropdownColor: lightBackground,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Pot Dropdown Menu
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pot',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField(
                    value: selectedPotType,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: mainColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: mainColor),
                      ),
                    ),
                    items: potTypes
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedPotType = value;
                      });
                    },
                    dropdownColor: lightBackground,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Apply Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: mainColor,
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget postItem() {
    return Container(
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
                onTap: () {},
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
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: lightBackground,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 100,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text('Search Plants'),
          ),
          const SizedBox(height: 8),
          _searchField(),
        ],
      ),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  color: Colors.grey,
                ),
                fillColor: lightContainer,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search plant",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              _showFilterBottomSheet(context);
            },
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
