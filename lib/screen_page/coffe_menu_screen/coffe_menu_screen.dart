import 'package:flutter/material.dart';

import 'coffe_menu_screen_mobile.dart';
import 'coffe_menu_screen_web.dart';

class CoffeMenuScreen extends StatelessWidget {
  const CoffeMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Coffe',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        // backgroundColor: Color(0x44000000),
        backgroundColor: Colors.transparent,
        // backgroundColor: const Color.fromRGBO(0, 0, 0, 0).withOpacity(0.25),
        elevation: 1,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 750) {
            return const CoffeMenuScreenMobile();
          } else if (constraints.maxWidth <= 1100) {
            return const CoffeMenuScreenWeb(gridCount: 3);
          } else {
            return const CoffeMenuScreenWeb(gridCount: 4);
          }
        },
      ),
    );
  }
}

// Favorite Button Item
class FavoriteButton extends StatefulWidget {
  const FavoriteButton({
    super.key,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
