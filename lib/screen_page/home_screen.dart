import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:social_media_buttons/social_media_button.dart';

import './menu_screen.dart';
import './profile_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    MenuScreen(),
    // SettingPage()
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: GNav(
        backgroundColor:
            const Color.fromRGBO(121, 85, 72, 1), // warna background
        activeColor: Colors.white, // warna yang sedang diselect
        color: Colors.white54, // warna icon yang tidak diselect
        tabBackgroundColor: Colors.brown.shade900,
        gap: 8, // memberikan jarak text dan icon
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        tabMargin: EdgeInsets.all(12),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.restaurant_menu,
            text: 'Menu',
          ),
          // GButton(icon: Icons.),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (value) {
          print(value);
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}

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
              padding: EdgeInsets.only(right: 5),
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
                SizedBox(
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
                        icon: Icon(
                          Icons.list_outlined,
                          color: Colors.brown,
                        ),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.brown,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
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
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Coffe Jenji',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Buka Jam 7 - 12 Siang',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
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
                              padding: EdgeInsets.only(right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SocialMediaButton.facebook(
                                        color: Colors.brown.shade50,
                                      ),
                                      Text(
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
                                      Text(
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
                                      Text(
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Rekomendasi',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
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
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pilihan Menu Menarik Hari ini'),
                        SizedBox(
                          height: 10,
                        ),
                        Scrollbar(
                          controller: _scrollController,
                          thickness: 20,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Row(
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
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: Colors.black.withOpacity(0.2),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // 'Cappucino',
                    nameMenu,
                    style: TextStyle(
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
