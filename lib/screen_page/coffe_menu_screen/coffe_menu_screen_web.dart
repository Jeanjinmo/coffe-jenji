import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

import '../../model/m_coffe_menu.dart';
import '../coffe_detail_screen/coffe_detail_screen.dart';
import 'coffe_menu_screen.dart';

class CoffeMenuScreenWeb extends StatelessWidget {
  const CoffeMenuScreenWeb({super.key, required this.gridCount});
  final int gridCount;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(milliseconds: 0),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.brown,
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width <= 900 ? 150 : 300,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        'assets/images/coffe_menu.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        // height: MediaQuery.of(context).size.width <= 900 ? 150 : 300,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Align(
                                child: const Text(
                                  'Daftar Kopi Berkualitas',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ).frosted(
                                    blur: 5,
                                    borderRadius: BorderRadius.circular(5),
                                    padding: const EdgeInsets.all(5),
                                    frostColor: Colors.black),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  crossAxisCount: gridCount,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  // childAspectRatio: 0.95,
                  children: coffeMenuModelList.map(
                    (coffeMenuModel) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CoffeDetailScreen(
                                    coffeMenuModel: coffeMenuModel);
                              },
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.grey.shade100,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 10),
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  coffeMenuModel.coffeName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  coffeMenuModel.coffeCategory,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade500),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      coffeMenuModel.coffePhoto,
                                      fit: BoxFit.cover,
                                      // height: 120,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      coffeMenuModel.coffePrice,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green.shade500),
                                    ),
                                    const FavoriteButton()
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
