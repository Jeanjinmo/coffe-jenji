import 'package:dicoding_submission_flutter_pemula/model/m_coffe_menu.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:rating_summary/rating_summary.dart';

class CoffeDetailScreen extends StatelessWidget {
  final CoffeMenuModel coffeMenuModel;
  CoffeDetailScreen({super.key, required this.coffeMenuModel});
  // CoffeMenuModel coffeMenuModelTest = coffeMenuModelList[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${coffeMenuModel.coffeName}',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.brown.shade300,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 800) {
            return CoffeDetailScreenMobile(coffeMenuModel: coffeMenuModel);
          } else {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(24),
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
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(coffeMenuModel.coffeDescription),
                              Divider(
                                thickness: 1,
                              ),
                              RatingSummary(
                                counter: 10,
                                average: 4.400,
                                showAverage: true,
                                counterFiveStars: 9,
                                counterFourStars: 4,
                                counterThreeStars: 2,
                                counterTwoStars: 1,
                                counterOneStars: 1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
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
                                      msg:
                                          'Fitur tidak tersedia untuk saat ini',
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
                                              TextStyle(color: Colors.white),
                                          // iconColor: Colors.white,
                                        ),
                                      ],
                                    );
                                  },
                                  icon: Icon(Icons.shopping_cart_checkout),
                                  label: Text('Pesan'),
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
        },
      ),
    );
  }
}

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
        Duration(milliseconds: 500),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
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
                          padding: EdgeInsets.only(top: 20),
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${coffeMenuModel.coffeName}',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${coffeMenuModel.coffePrice}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.green.shade600,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          coffeMenuModel.coffeCategory,
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        coffeMenuModel.coffeDescription,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          // wordSpacing: 1,
                          // letterSpacing: 3,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RatingSummary(
                        counter: 10,
                        average: 4.400,
                        showAverage: true,
                        counterFiveStars: 9,
                        counterFourStars: 4,
                        counterThreeStars: 2,
                        counterTwoStars: 1,
                        counterOneStars: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                            textStyle: TextStyle(color: Colors.white),
                            // iconColor: Colors.white,
                          ),
                        ],
                      );
                    },
                    icon: Icon(Icons.shopping_cart_checkout),
                    label: Text('Pesan'),
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
