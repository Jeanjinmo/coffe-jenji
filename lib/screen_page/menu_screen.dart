import 'package:blur/blur.dart';
import 'package:dicoding_submission_flutter_pemula/screen_page/coffe_menu_screen/coffe_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Menu',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          // Menu Coffe
          Expanded(
            child: InkWell(
              onTap: () {
                debugPrint('Menu Kopi');
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const CoffeMenuScreen();
                  },
                ));
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    width: double.infinity,
                    'assets/images/coffe_menu.jpg',
                    fit: BoxFit.fitWidth,
                  ).blurred(colorOpacity: 0.2, blur: 3),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Coffe',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Coffe Berkualitas',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ).frosted(
                              blur: 5,
                              borderRadius: BorderRadius.circular(5),
                              padding: const EdgeInsets.all(5),
                              frostColor: Colors.black)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Menu Special Drink
          Expanded(
            child: InkWell(
              onTap: () {
                debugPrint('Menu Special Drink');
                Dialogs.materialDialog(
                  msg:
                      'Menu Special Drink belum tersedia, pilih Menu Coffe untuk melanjutkan',
                  title: "Perhatian!!",
                  msgAlign: TextAlign.center,
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
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    width: double.infinity,
                    'assets/images/special_drink_menu.jpeg',
                    fit: BoxFit.cover,
                  ).blurred(colorOpacity: 0.2, blur: 3),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Special Drink',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Pilihan Minuman Segar Nikmat',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ).frosted(
                              blur: 5,
                              borderRadius: BorderRadius.circular(5),
                              padding: const EdgeInsets.all(5),
                              frostColor: Colors.black),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Menu Breakfast
          Expanded(
            child: InkWell(
              onTap: () {
                debugPrint('Menu Sarapan Pagi Penyemangat');
                Dialogs.materialDialog(
                  msg:
                      'Menu Breakfast belum tersedia, pilih Menu Coffe untuk melanjutkan',
                  title: "Perhatian!!",
                  msgAlign: TextAlign.center,
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
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    width: double.infinity,
                    'assets/images/breakfast_menu.jpg',
                    fit: BoxFit.fitWidth,
                  ).blurred(colorOpacity: 0.2, blur: 3),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Breakfast',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Sarapan Pagi Penyemangat',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ).frosted(
                              blur: 5,
                              borderRadius: BorderRadius.circular(5),
                              padding: const EdgeInsets.all(5),
                              frostColor: Colors.black)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
