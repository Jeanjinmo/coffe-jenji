import 'package:dicoding_submission_flutter_pemula/extract_widget/widget_lain/rekomendasi_item.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          leadingWidth: 50,
          // backgroundColor: Colors.brown,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: ClipRRect(
              child: Icon(
                Icons.person,
                color: Colors.brown.shade800,
                size: 40,
              ),
            ),
          ),
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 5),
              onPressed: () {},
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.brown.shade800,
                size: 40,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(
                    'Jelajahi Makanan dan Minuman Meranik!',
                    style: TextStyle(
                      color: Colors.brown.shade600,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.brown,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    // controller: ,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.list_outlined,
                          color: Colors.brown,
                        ),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.brown,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 215,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.coffee_outlined,
                          color: Colors.brown.shade300,
                          size: 150,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Coffe Jenji',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Buka Jam 7 - 12 Siang',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Menawarkan aneka kopi nikmat, minuman segar dan Sarapan Pagi',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.brown.shade200,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SocialMediaButton.facebook(
                                        color: Colors.brown.shade50,
                                      ),
                                      const Text(
                                        'Facebook',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SocialMediaButton.instagram(
                                        color: Colors.brown.shade50,
                                      ),
                                      const Text(
                                        'Instagram',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SocialMediaButton.twitter(
                                        color: Colors.brown.shade50,
                                      ),
                                      const Text(
                                        'Twitter',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Rekomendasi',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Pilihan Menu Menarik Hari ini'),
                        const SizedBox(
                          height: 10,
                        ),
                        Scrollbar(
                          controller: _scrollController,
                          thickness: 20,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            child: const Row(
                              children: [
                                RekomendasiItem(
                                  imageName:
                                      'assets/images/daftar_coffe/cappuccino_coffe.jpeg',
                                  nameMenu: 'Cappucino',
                                  nameCategoryMenu: 'Kopi Hitam',
                                  descMenu:
                                      'Cappuccino adalah minuman kopi yang dibuat dengan campuran espresso, susu panas, dan busa susu.',
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RekomendasiItem(
                                  imageName:
                                      'assets/images/daftar_minuman/pink_drink.jpeg',
                                  nameMenu: 'Strawberry With Milk',
                                  nameCategoryMenu: 'Susu Buah',
                                  descMenu:
                                      'Minuman yang terbuat dari susu, buah stroberi,campuran buah lainnya, dan gula. Minuman ini memiliki perpaduan rasa yang manis dan asam dari buah stroberi, serta creamy dari susu. Minuman ini cocok untuk dinikmati saat cuaca panas atau sebagai camilan.',
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RekomendasiItem(
                                  imageName:
                                      'assets/images/daftar_makanan/roti_bakar_teluar_campur.jpeg',
                                  nameMenu: 'Roti Telur Buah',
                                  nameCategoryMenu: 'Makanan Ringan',
                                  descMenu:
                                      'Rotibakar dibalut dengan campuran telur dan ada sedikit Avocado',
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RekomendasiItem(
                                  imageName:
                                      'assets/images/daftar_makanan/telur_gulung.jpeg',
                                  nameMenu: 'Telur Gulung',
                                  nameCategoryMenu: 'Makanan Ringan',
                                  descMenu:
                                      'Telur Gulung dengan campuran saus dan sayur',
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                RekomendasiItem(
                                  imageName:
                                      'assets/images/daftar_minuman/susu_segar.jpeg',
                                  nameMenu: 'Susu Segar',
                                  nameCategoryMenu: 'Minuman Sehat',
                                  descMenu:
                                      'Susu Murni yang diperah dari Sapi tanpa tambahan gula',
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}