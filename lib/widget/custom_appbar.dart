import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pos_application/controllers/car_controller.dart';

import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../database/note.dart';
import '../database/notes_database.dart';
import '../services/product_service.dart';
import '../widget/change_language_style.dart';

Widget customAppBar(BuildContext context, {int? key}) {
  // Future addProductToCar(String productName, String price, String image) async {
  //   final carproduct = Car(
  //     id: '2',
  //     title: productName,
  //     count: 1,
  //     price: double.parse(price.toString()),
  //     imageUrl: image,
  //   );
  //   await NotesDataBase.instance.createCar(carproduct);
  // }

  void _showToast() {
    Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!
            .getTranslatedValue('add_succe')
            .toString(),
        fontSize: 18);
  }

  // in Car
  if (key == 1) {
    return FutureBuilder(
        future: ProductApi().search(nameProduct: Get.arguments[0].toString()),
        builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  )),
              child: Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 15),
                    child: SizedBox(
                      child: IconButton(
                        icon: const Icon(Icons.keyboard_backspace,
                            color: Color.fromRGBO(34, 53, 53, 1)),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          top: 30,
                          left: LanguageEnglish(context) == 'English' ? 40 : 55,
                          bottom: 15),
                      child: Text(
                          AppLocalizations.of(context)!
                              .getTranslatedValue('appbarTitle')
                              .toString(),
                          style: getcustomertextStyle(
                              context,
                              20,
                              FontWeight.bold,
                              const Color.fromRGBO(34, 53, 53, 1)))),
                  GestureDetector(
                    onTap: () {
                      // Get.find<CarController>().addProductToCar(snapshot.data![0].name, Get.arguments[1],
                      //     snapshot.data![0].image);
                      _showToast();
                    },
                    child: Container(
                      color: Colors.white,
                      padding:
                          const EdgeInsets.only(top: 20, left: 40, bottom: 15),
                      child: SvgPicture.asset(
                        'images/car.svg',
                        color: const Color.fromRGBO(34, 53, 53, 1),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
  else if (key == 2) {
    return Column(
      children: [

        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )),
          child: LanguageEnglish(context) == 'English'
              ? Row(
                  children: [
                    Container(
                      padding:
                       EdgeInsets.only(
                          // top: 30,
                          // left: 90,
                          // bottom: 15
                          // top: MediaQuery.of(context).size.height*0.1,
                          left:  MediaQuery.of(context).size.width*0.05,
                          // bottom:  MediaQuery.of(context).size.height*0.1
                      ),
                      child: SizedBox(
                        child: IconButton(
                          icon: const Icon(Icons.keyboard_backspace,
                              color: Color.fromRGBO(34, 53, 53, 1)),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    Container(
                        padding:  EdgeInsets.only(
                            // top: MediaQuery.of(context).size.height*0.1,
                            left:  MediaQuery.of(context).size.width*0.16,
                            // bottom:  MediaQuery.of(context).size.height*0.1
                        ),
                        child: Text(
                            AppLocalizations.of(context)!
                                .getTranslatedValue('appbarTitle')
                                .toString(),
                            style: getcustomertextStyle(
                                context,
                                20,
                                FontWeight.bold,
                                const Color.fromRGBO(34, 53, 53, 1)))),

                  ],
                )
              : Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 20, right: 135, bottom: 15),
                      child: SizedBox(
                        child: IconButton(
                          icon: const Icon(Icons.keyboard_backspace,
                              color: Color.fromRGBO(34, 53, 53, 1)),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            top: 30, right: 20, bottom: 15),
                        child: Text(
                            AppLocalizations.of(context)!
                                .getTranslatedValue('appbarTitle')
                                .toString(),
                            style: getcustomertextStyle(
                                context,
                                20,
                                FontWeight.bold,
                                const Color.fromRGBO(34, 53, 53, 1)))),
                  ],
                ),
        ),
      ],
    );
  }
  else {
    return Column(children: [
      Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )),
          child: Container(
              padding: EdgeInsets.only(
                  top: 60,
                  left: LanguageEnglish(context) == 'English' ?
                  // 100
                   MediaQuery.of(context).size.width*0.3
                      : 120),
              child: Text(
                  AppLocalizations.of(context)!
                      .getTranslatedValue('appbarTitle')
                      .toString(),
                  style: getcustomertextStyle(context, 20, FontWeight.bold,
                      const Color.fromRGBO(34, 53, 53, 1)))))
    ]);
  }
}
