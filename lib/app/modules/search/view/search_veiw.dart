import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:plan_shop/app/constants/colors.dart';

class SearchVeiw extends StatelessWidget {
  const SearchVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: _appBar(),
      body: Column(
        children: [
          _searchField(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: lightBackground,
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text('Search Plants'),
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
}
