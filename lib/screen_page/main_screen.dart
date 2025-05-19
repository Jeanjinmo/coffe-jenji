import 'dart:ui';

import 'package:dicoding_submission_flutter_pemula/data/dummy_rekomendasi_menu.dart';
import 'package:dicoding_submission_flutter_pemula/extract_widget/widget_lain/rekomendasi_item.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// buat run in web
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: ClipRRect(
              child: Icon(Icons.person, color: Colors.brown.shade800, size: 40),
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
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              spacing: 15, // Sizedbox height 15
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleMainScreen(context),
                _searchMenu(),
                _coffeJenjiInfo(),
                const Text(
                  'Rekomendasi',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                _recommendationMenu(dummyRekomendasiItem),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _recommendationMenu(List<RekomendasiItem> dummyItem) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
          ),
          child: Scrollbar(
            thumbVisibility: false,
            controller: _scrollController,
            child: ListView.separated(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final itemRekomendasi = dummyRekomendasiItem[index];
                return RekomendasiItem(
                  imageName: itemRekomendasi.imageName,
                  nameMenu: itemRekomendasi.nameMenu,
                  nameCategoryMenu: itemRekomendasi.nameCategoryMenu,
                  descMenu: itemRekomendasi.descMenu,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: dummyItem.length,
            ),
          ),
        ),
      ),
    );
  }

  Container _coffeJenjiInfo() {
    return Container(
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
                const SizedBox(height: 10),
                const Text(
                  'Buka: 08:00 - 21:00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Menawarkan aneka kopi nikmat, minuman segar dan Sarapan Pagi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Divider(thickness: 1, color: Colors.brown.shade200),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SocialMediaButton.facebook(
                            color: Colors.brown.shade50,
                          ),
                          const Text(
                            'Facebook',
                            style: TextStyle(color: Colors.white),
                          ),
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
                          ),
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
                          ),
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
    );
  }

  Container _searchMenu() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        // controller: ,
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.list_outlined, color: Colors.brown),
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.brown),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
    );
  }

  SizedBox _titleMainScreen(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      child: Text(
        'Jelajahi Makanan dan Minuman Meranik!',
        style: TextStyle(
          color: Colors.brown.shade600,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }
}
