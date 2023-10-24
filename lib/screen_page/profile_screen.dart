import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation checkOrientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(
          Duration(milliseconds: 500),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SafeArea(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 50),
                child: Lottie.asset('assets/lotties/loading_profile.json'),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior:
                        Clip.none, //biar foto tetap kelihatan dibawahnya
                    children: [
                      Image.asset(
                        'assets/images/cover_profile.jpeg',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 300,
                      ),
                      // BackButtonItem(),
                      Positioned(
                        // Profile image
                        bottom: -50,
                        left: checkOrientation == Orientation.portrait
                            ? MediaQuery.of(context).size.width / 2 - 60
                            : MediaQuery.of(context).size.width / 2 - 60,
                        child: Container(
                          // margin: EdgeInsets.only(left: 10),
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/profile.png'),
                            ),
                            border: Border.all(
                              color: Colors.white,
                              width: 5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 24, right: 24),
                    child: Column(
                      children: [
                        Text(
                          'Jean',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Junior Programmer',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Profile Pengembang',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            "Seorang pemula yang ingin belajar Flutter dari dasar dan mencoba mencapai tingat yang lebih tinggi.",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Temukan saya : ',
                              style: TextStyle(fontSize: 20),
                            ),
                            TextButton(
                              onPressed: () async {
                                final url =
                                    Uri.parse('https://github.com/Jeanjinmo');
                                _launchInBrowser(url);
                              },
                              child: Text(
                                'Github',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            print('Privacy Policy di tekan');
                            KebijakanPrivasiInfo(context);
                          },
                          child: const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.privacy_tip,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Kebijakan Privasi',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<dynamic> KebijakanPrivasiInfo(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.brown.shade100,
      barrierColor: Colors.brown.withOpacity(0.5),
      isDismissible: true, // false -> tidak bisa back tanpa button
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) {
        return Container(
          height: 350,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 30, left: 24, right: 24, bottom: 16),
                  child: Text(
                    'Kebijakan Privasi',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Column(
                    children: [
                      KebijakanPrivasiTitleItem(
                        titleName: '1. Data Apps',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      KebijakanPrivasiIsiItem(
                        isiItem:
                            'Coffe Shop Jenji memakai data makanan dan minuman yang ditampilkan pada aplikasi Coffe Shop ini didapat dari google. ',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      KebijakanPrivasiTitleItem(
                        titleName: '2. Informasi Apps',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      KebijakanPrivasiIsiItem(
                        isiItem:
                            'Coffe Shop Jenji adalah toko kopi yang menawarkan berbagai jenis minuman dan makanan.',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      KebijakanPrivasiTitleItem(
                        titleName: '3. Data Pengguna',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      KebijakanPrivasiIsiItem(
                        isiItem:
                            'User tidak perlu menginputkan apapun dalam menjalankan aplikasi',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}

class KebijakanPrivasiIsiItem extends StatelessWidget {
  const KebijakanPrivasiIsiItem({super.key, required this.isiItem});
  final String isiItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(isiItem),
    );
  }
}

class KebijakanPrivasiTitleItem extends StatelessWidget {
  const KebijakanPrivasiTitleItem({super.key, required this.titleName});
  final String titleName;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '${titleName}',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        textAlign: TextAlign.start,
      ),
    );
  }
}

class BackButtonItem extends StatelessWidget {
  const BackButtonItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 15),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 30,
        ),
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
