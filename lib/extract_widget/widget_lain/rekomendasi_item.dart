import 'package:flutter/material.dart';

class RekomendasiItem extends StatelessWidget {
  final String imageName;
  final String nameMenu;
  final String nameCategoryMenu;
  final String descMenu;
  const RekomendasiItem({
    super.key,
    required this.imageName,
    required this.nameMenu,
    required this.nameCategoryMenu,
    required this.descMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            // 'assets/images/daftar_coffe/cappuccino_coffe.jpeg',
            imageName,
            fit: BoxFit.cover,
            width: 230,
            height: 270,
          ),
        ),
        Positioned(
          bottom: 1,
          child: Container(
            width: 230,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: Colors.black.withOpacity(0.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Cappucino',
                    nameMenu,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    // 'Kopi Hitam',
                    nameCategoryMenu,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    // 'Cappuccino adalah minuman kopi yang dibuat dengan campuran espresso, susu panas, dan busa susu.',
                    descMenu,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}