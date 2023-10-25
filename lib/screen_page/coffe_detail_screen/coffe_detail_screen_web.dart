import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:rating_summary/rating_summary.dart';

import '../../model/m_coffe_menu.dart';

class CoffeDetailScreenWeb extends StatelessWidget {
  const CoffeDetailScreenWeb({
    super.key,
    required this.coffeMenuModel,
  });

  final CoffeMenuModel coffeMenuModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    coffeMenuModel.coffePhoto,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coffeMenuModel.coffeName,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(coffeMenuModel.coffeDescription),
                      const Divider(
                        thickness: 1,
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
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green),
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
                                  textStyle:
                                      const TextStyle(color: Colors.white),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
