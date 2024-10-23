import 'package:flutter/material.dart';
import 'package:plan_shop/app/constants/colors.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: AppBar(
        backgroundColor: lightBackground,
        title: const Text('Your Cart'),
      ),
    );
  }
}
