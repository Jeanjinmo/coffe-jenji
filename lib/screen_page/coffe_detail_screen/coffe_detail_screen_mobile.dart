import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:rating_summary/rating_summary.dart';

import '../../model/m_coffe_menu.dart';

class CoffeDetailScreenMobile extends StatelessWidget {
  const CoffeDetailScreenMobile({
    super.key,
    required this.coffeMenuModel,
  });

  final CoffeMenuModel coffeMenuModel;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(milliseconds: 500),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              coffeMenuModel.coffePhoto,
                              fit: BoxFit.cover,
                              height: 300,
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            coffeMenuModel.coffeName,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            coffeMenuModel.coffePrice,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.green.shade600,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          coffeMenuModel.coffeCategory,
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        coffeMenuModel.coffeDescription,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          // wordSpacing: 1,
                          // letterSpacing: 3,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const RatingSummary(
                        counter: 10,
                        average: 4.400,
                        showAverage: true,
                        counterFiveStars: 9,
                        counterFourStars: 4,
                        counterThreeStars: 2,
                        counterTwoStars: 1,
                        counterOneStars: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Dialogs.materialDialog(
                        msg: 'Fitur tidak tersedia untuk saat ini',
                        title: "Perhatian!!",
                        color: Colors.brown.shade50,
                        context: context,
                        actions: [
                          IconsButton(
                            shape: Dialogs.dialogShape,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: 'Ok',
                            // iconData: Icons.delete,
                            color: Colors.green,
                            textStyle: const TextStyle(color: Colors.white),
                            // iconColor: Colors.white,
                          ),
                        ],
                      );
                    },
                    icon: const Icon(Icons.shopping_cart_checkout),
                    label: const Text('Pesan'),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
