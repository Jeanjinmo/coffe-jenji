import 'package:blur/blur.dart';
import 'package:dicoding_submission_flutter_pemula/model/m_coffe_menu.dart';
import 'package:dicoding_submission_flutter_pemula/screen_page/coffe_detail_screen.dart';
import 'package:flutter/material.dart';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;

class CoffeMenuScreen extends StatelessWidget {
  CoffeMenuScreen({super.key});
  CoffeMenuModel coffetest = coffeMenuModelList[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
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
            return CoffeMenuScreenMobile();
          } else if (constraints.maxWidth <= 1100) {
            return CoffeMenuScreenWeb(gridCount: 3);
          } else {
            return CoffeMenuScreenWeb(gridCount: 4);
          }
        },
      ),
    );
  }
}

class CoffeMenuScreenMobile extends StatelessWidget {
  const CoffeMenuScreenMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        Duration(milliseconds: 500),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.brown,
            ),
          );
        } else {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    'assets/images/coffe_menu.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Daftar Kopi Berkualitas',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ).frosted(
                              blur: 5,
                              borderRadius: BorderRadius.circular(5),
                              padding: EdgeInsets.all(5),
                              frostColor: Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final CoffeMenuModel coffeMenuModel =
                        coffeMenuModelList[index];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: () {
                          print('Klik Tombol kopi');
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return CoffeDetailScreen(
                                coffeMenuModel: coffeMenuModel,
                              );
                            },
                          ));
                        },
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      coffeMenuModel.coffePhoto,
                                      height: double.infinity,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          coffeMenuModel.coffeName,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          coffeMenuModel.coffeCategory,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Padding(
                                              padding: EdgeInsets.zero,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    coffeMenuModel.coffePrice,
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w800),
                                                  ),
                                                  FavoriteButton()
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: coffeMenuModelList.length,
                ),
              )
            ],
          );
        }
      },
    );
  }
}

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

class CoffeMenuScreenWeb extends StatelessWidget {
  const CoffeMenuScreenWeb({super.key, required this.gridCount});
  final int gridCount;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        Duration(milliseconds: 0),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
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
                                child: Text(
                                  'Daftar Kopi Berkualitas',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ).frosted(
                                    blur: 5,
                                    borderRadius: BorderRadius.circular(5),
                                    padding: EdgeInsets.all(5),
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
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(16),
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
                                  '${coffeMenuModel.coffeName}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${coffeMenuModel.coffeCategory}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade500),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      '${coffeMenuModel.coffePhoto}',
                                      fit: BoxFit.cover,
                                      // height: 120,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                SizedBox(
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
                                    FavoriteButton()
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

          // return SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       Container(
          //         height: MediaQuery.of(context).size.width <= 900 ? 150 : 300,
          //         child: Stack(
          //           alignment: Alignment.bottomCenter,
          //           children: [
          //             Image.asset(
          //               'assets/images/coffe_menu.jpg',
          //               fit: BoxFit.cover,
          //               width: double.infinity,
          //               // height: MediaQuery.of(context).size.width <= 900 ? 150 : 300,
          //             ),
          //             Center(
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Padding(
          //                     padding: const EdgeInsets.all(16.0),
          //                     child: Text(
          //                       'Daftar Kopi Berkualitas',
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.w500,
          //                         fontSize: 20,
          //                       ),
          //                     ).frosted(
          //                         blur: 5,
          //                         borderRadius: BorderRadius.circular(5),
          //                         padding: EdgeInsets.all(5),
          //                         frostColor: Colors.black),
          //                   )
          //                 ],
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //       // InkWell(
          //       //   onTap: () {
          //       //     // Navigator.push(
          //       //     //   context,
          //       //     //   MaterialPageRoute(
          //       //     //     builder: (context) {
          //       //     //       return CoffeDetailScreen(
          //       //     //           coffeMenuModel: coffeMenuModel);
          //       //     //     },
          //       //     //   ),
          //       //     // );
          //       //   },
          //       //   child: Container(
          //       //     width: 250,
          //       //     child: Card(
          //       //       color: Colors.grey.shade100,
          //       //       shape: RoundedRectangleBorder(
          //       //           borderRadius: BorderRadius.circular(10)),
          //       //       elevation: 3,
          //       //       child: Padding(
          //       //         padding: const EdgeInsets.only(left: 8, right: 4),
          //       //         child: Column(
          //       //           mainAxisSize: MainAxisSize.min,
          //       //           crossAxisAlignment: CrossAxisAlignment.start,
          //       //           children: [
          //       //             Text(
          //       //               'Espresso',
          //       //               style: TextStyle(
          //       //                 fontWeight: FontWeight.bold,
          //       //                 fontSize: 20,
          //       //               ),
          //       //             ),
          //       //             SizedBox(
          //       //               height: 5,
          //       //             ),
          //       //             Text(
          //       //               'Espresso',
          //       //               style: TextStyle(
          //       //                   fontSize: 15, color: Colors.grey.shade500),
          //       //             ),
          //       //             SizedBox(
          //       //               height: 5,
          //       //             ),
          //       //             Padding(
          //       //               padding: const EdgeInsets.symmetric(
          //       //                   horizontal: 5.0, vertical: 2),
          //       //               child: ClipRRect(
          //       //                 borderRadius: BorderRadius.circular(10),
          //       //                 child: Image.asset(
          //       //                   'assets/images/daftar_coffe/espresso_coffe.jpeg',
          //       //                   fit: BoxFit.cover,
          //       //                   height: 120,
          //       //                   width: double.infinity,
          //       //                 ),
          //       //               ),
          //       //             ),
          //       //             Row(
          //       //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       //               children: [
          //       //                 Text(
          //       //                   '100000',
          //       //                   style: TextStyle(color: Colors.green.shade500),
          //       //                 ),
          //       //                 IconButton(
          //       //                   alignment: Alignment.centerRight,
          //       //                   onPressed: () {},
          //       //                   icon: Icon(
          //       //                     Icons.favorite_border_outlined,
          //       //                   ),
          //       //                 )
          //       //               ],
          //       //             )
          //       //           ],
          //       //         ),
          //       //       ),
          //       //     ),
          //       //   ),
          //       // )

          //       GridView.count(
          //         shrinkWrap: true,
          //         physics: NeverScrollableScrollPhysics(),
          //         padding: EdgeInsets.all(16),
          //         crossAxisCount: 3,
          //         crossAxisSpacing: 8,
          //         mainAxisSpacing: 8,
          //         childAspectRatio: 0.95,
          //         children: coffeMenuModelList.map(
          //           (coffeMenuModel) {
          //             return InkWell(
          //               onTap: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                     builder: (context) {
          //                       return CoffeDetailScreen(
          //                           coffeMenuModel: coffeMenuModel);
          //                     },
          //                   ),
          //                 );
          //               },
          //               child: Card(
          //                 color: Colors.grey.shade100,
          //                 shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(10)),
          //                 elevation: 3,
          //                 child: Padding(
          //                   padding: const EdgeInsets.symmetric(
          //                       horizontal: 8, vertical: 10),
          //                   child: Column(
          //                     // mainAxisSize: MainAxisSize.min,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text(
          //                         '${coffeMenuModel.coffeName}',
          //                         style: TextStyle(
          //                           fontWeight: FontWeight.bold,
          //                           fontSize: 20,
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         height: 5,
          //                       ),
          //                       Text(
          //                         '${coffeMenuModel.coffeCategory}',
          //                         style: TextStyle(
          //                             fontSize: 15,
          //                             color: Colors.grey.shade500),
          //                       ),
          //                       SizedBox(
          //                         height: 5,
          //                       ),
          //                       Padding(
          //                         padding: const EdgeInsets.all(10),
          //                         child: ClipRRect(
          //                           borderRadius: BorderRadius.circular(10),
          //                           child: Image.asset(
          //                             '${coffeMenuModel.coffePhoto}',
          //                             fit: BoxFit.cover,
          //                             height: 120,
          //                             width: double.infinity,
          //                           ),
          //                         ),
          //                       ),
          //                       Row(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Text(
          //                             coffeMenuModel.coffePrice,
          //                             style: TextStyle(
          //                                 color: Colors.green.shade500),
          //                           ),
          //                           IconButton(
          //                             alignment: Alignment.centerRight,
          //                             onPressed: () {},
          //                             icon: Icon(
          //                               Icons.favorite_border_outlined,
          //                             ),
          //                           )
          //                         ],
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             );
          //           },
          //         ).toList(),
          //       ),
          //     ],
          //   ),
          // );
        }
      },
    );
  }
}


// Expanded(
//                 child: GridView.count(
//                     padding: EdgeInsets.all(8),
//                     crossAxisCount: 3,
//                     crossAxisSpacing: 8,
//                     mainAxisSpacing: 8,
//                     children: coffeMenuModelList.map((coffeMenuModel) {
//                       return InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) {
//                                 return CoffeDetailScreen(
//                                     coffeMenuModel: coffeMenuModel);
//                               },
//                             ),
//                           );
//                         },
//                         child: Card(
//                           color: Colors.grey.shade100,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)
//                           ),
//                           elevation: 3,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 8, right: 4),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   '${coffeMenuModel.coffeName}',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Text(
//                                   '${coffeMenuModel.coffeCategory}',
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       color: Colors.grey.shade500),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 5.0, vertical: 2),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(10),
//                                     child: Image.asset(
//                                       '${coffeMenuModel.coffePhoto}',
//                                       fit: BoxFit.cover,
//                                       height: 120,
//                                       width: double.infinity,
//                                     ),
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       coffeMenuModel.coffePrice,
//                                       style: TextStyle(
//                                           color: Colors.green.shade500),
//                                     ),
//                                     IconButton(
//                                       alignment: Alignment.centerRight,
//                                       onPressed: () {},
//                                       icon: Icon(
//                                         Icons.favorite_border_outlined,
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }).toList()),
//               )