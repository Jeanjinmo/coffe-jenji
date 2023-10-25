import 'package:dicoding_submission_flutter_pemula/model/m_coffe_menu.dart';
import 'package:flutter/material.dart';

import 'coffe_detail_screen_mobile.dart';
import 'coffe_detail_screen_web.dart';

class CoffeDetailScreen extends StatelessWidget {
  final CoffeMenuModel coffeMenuModel;
  const CoffeDetailScreen({super.key, required this.coffeMenuModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          coffeMenuModel.coffeName,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.brown.shade300,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 800) {
            return CoffeDetailScreenMobile(coffeMenuModel: coffeMenuModel);
          } else {
            return CoffeDetailScreenWeb(coffeMenuModel: coffeMenuModel);
          }
        },
      ),
    );
  }
}
