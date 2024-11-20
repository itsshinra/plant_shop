import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

// ignore: must_be_immutable
class ListTileItem extends StatelessWidget {
  ListTileItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  String? title;
  IconData? icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: mainColor,
      ),
      title: Text(
        title!,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 20,
        color: mainColor,
      ),
    );
  }
}
