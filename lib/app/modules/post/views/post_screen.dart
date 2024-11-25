import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plan_shop/app/constants/colors.dart';
import 'package:plan_shop/app/modules/post/controllers/post_controller.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String? selectedCategory;
  final List<String> categories = [
    "Rose",
    "Tropical",
    "Foliage",
    "Succulent",
    "Flowering",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: _appBar(context),
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Upload Image
              _uploadImage(),
              const SizedBox(height: 16),
              // Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 189, 188, 188),
                              width: 1.8,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: mainColor, width: 3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Description
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        maxLines: 3,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Desciption",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 189, 188, 188),
                              width: 1.8,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: mainColor, width: 3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Category
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 16),
                child: DropdownButtonFormField(
                  value: selectedCategory,
                  hint: const Text(
                    'Category',
                    style: TextStyle(color: Colors.grey),
                  ),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: mainColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 189, 188, 188),
                        width: 1.8,
                      ),
                    ),
                  ),
                  items: categories
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  dropdownColor: lightBackground,
                ),
              ),
              // Price and Height
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Price",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 189, 188, 188),
                              width: 1.8,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: mainColor, width: 3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Height",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 189, 188, 188),
                              width: 1.8,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: mainColor, width: 3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Temperature and Pot
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Temperature",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 189, 188, 188),
                              width: 1.8,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: mainColor, width: 3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Pot",
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 189, 188, 188),
                              width: 1.8,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: mainColor, width: 3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Post Button
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: const WidgetStatePropertyAll(0),
                    backgroundColor: const WidgetStatePropertyAll(mainColor),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Post',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _uploadImage() {
    return GetBuilder<PostController>(
      init: PostController(),
      builder: (postController) {
        return GestureDetector(
          onTap: postController.pickImage,
          child: postController.image == null
              ? Container(
                  height: 260,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: mainColor,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://cdn-icons-png.flaticon.com/128/1829/1829586.png",
                        width: 80,
                      ),
                      const Text(
                        'Click to upload\nyour plant',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 260,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: mainColor,
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: FileImage(File(postController.image!.path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: lightBackground,
      foregroundColor: Colors.black,
      title: const Text(
        'Post',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
