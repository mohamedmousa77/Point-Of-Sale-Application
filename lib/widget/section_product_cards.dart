import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pos_application/controllers/car_controller.dart';
import 'package:pos_application/models/firebase_product_model.dart';
import 'package:pos_application/services/product_service.dart';

import '../classes/app_localizations.dart';
import '../classes/color_theme.dart';
import '../classes/localization_const.dart';
import '../database/note.dart';
import '../database/notes_database.dart';
import '../screens/details_screen.dart';
import '../theme/colors.dart';
import '../widget/change_language_style.dart';

class buildSectionCard extends StatefulWidget {
  // final String productName;
  // final String id;
  // final String urlImage;
  FirebaseProduct product ;



  buildSectionCard({required this.product});

  @override
  _buildSectionCardState createState() => _buildSectionCardState();
}

class _buildSectionCardState extends State<buildSectionCard> {


  bool isSelected = false;

  void showToast() {
    Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!
            .getTranslatedValue('add_succe')
            .toString(),
        fontSize: 18);
  }


  // Widget buildSectionCards(BuildContext context) {
  //   List<dynamic> myarguments = [
  //     widget.product
  //     // widget.productName,
  //     // widget.id,
  //     // widget.urlImage,
  //   ];
  //   return FlatButton(
  //     onPressed: () =>
  //         Get.to(() =>  DetailsScreen(product: widget.product)
  //             , arguments: myarguments
  //         ),
  //     child: Container(
  //       width: MediaQuery.of(context).size.width * 0.5,
  //       height: MediaQuery.of(context).size.height * 0.33,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         color: const Color.fromRGBO(248, 248, 248, 1),
  //         // color: Colors.red
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           // IMAGE
  //           // Container(
  //           //   width: MediaQuery.of(context).size.width * 0.9,
  //           //   height: MediaQuery.of(context).size.height * 0.08,
  //           //   decoration: BoxDecoration(
  //           //     borderRadius: BorderRadius.circular(20),
  //           //   ),
  //           //   child: ClipRRect(
  //           //     borderRadius: BorderRadius.circular(10),
  //           //     child: Image.network(
  //           //       widget.product.image,
  //           //       fit: BoxFit.contain,
  //           //       errorBuilder: (_, __, ___) {
  //           //         return LanguageEnglish(context) == 'English'
  //           //             ? Image.asset('images/no_image_english.png')
  //           //             : Image.asset('images/no_image_arabic.png');
  //           //       },
  //           //     ),
  //           //   ),
  //           //   margin: const EdgeInsets.only(bottom: 5),
  //           // ),
  //           Container(
  //             width: MediaQuery.of(context).size.width * 0.8,
  //             height: MediaQuery.of(context).size.height * 0.13,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20),
  //               // color: Colors.red
  //             ),
  //             child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(20),
  //                 child: widget.product.image.isNotEmpty
  //                     ? Image.network(
  //                  widget.product.image,
  //                   // 'https://specifications-pro.com/wp-content/uploads/2020/03/iPhone-9-600x600.jpeg',
  //                   fit: BoxFit.fill,
  //                   errorBuilder: (_, __, ___) {
  //                     return LanguageEnglish(context) == 'English'
  //                         ? Image.asset('images/no_image_english.png')
  //                         : Image.asset('images/no_image_arabic.png');
  //                   },
  //                 )
  //                     : LanguageEnglish(context) == 'English'
  //                     ? Image.asset('images/no_image_english.png')
  //                     : Image.asset('images/no_image_arabic.png')),
  //
  //             // margin: const EdgeInsets.only(bottom: 5),
  //           ),
  //           SizedBox(height: MediaQuery.of(context).size.height * 0.01),
  //           // PRODUCT NAME
  //           Container(
  //             padding: const EdgeInsets.only(left: 5),
  //             child: Text(
  //               widget.product.name.length < 15
  //                   ? widget.product.name
  //                   : widget.product.name
  //                       .replaceRange(15, widget.product.name.length, '...'),
  //               style: getcustomertextStyle(
  //                   context, 14, FontWeight.normal, Colors.black),
  //             ),
  //           ),
  //           SizedBox(height: MediaQuery.of(context).size.height * 0.01),
  //           //  BUTTON ADD IN CAR
  //           Container(
  //             padding: const EdgeInsets.only(bottom: 10, left: 15, top: 10, right: 15),
  //             child: SizedBox(
  //               width: MediaQuery.of(context).size.width * 0.5,
  //               height: MediaQuery.of(context).size.height * 0.05,
  //               child: RaisedButton(
  //                 shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(6)),
  //                 child: Text(
  //                   AppLocalizations.of(context)!
  //                       .getTranslatedValue('PutInCart')
  //                       .toString(),
  //                   style: getcustomertextStyle(
  //                       context, 10, FontWeight.normal, Colors.white),
  //                 ),
  //                  color: ColorTheme.color2,
  //                 onPressed: () {
  //                   Get.find<CarController>().addProductToCar(widget.product);
  //                   showToast();
  //                   setState(() {
  //                     isSelected = true;
  //                   });
  //                 },
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget buildCard(BuildContext context ,FirebaseProduct product) {
    List<dynamic> arguments = [
      widget.product
      // widget.productName,
      // widget.id,
      // widget.urlImage,
    ];
    bool isExist = Get.find<CarController>().carProductsList.any((element) => element.title  == product.name);
    return GestureDetector(
      onTap: () =>
          Get.to(() => DetailsScreen(product: product), arguments: arguments),
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.5,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ofWhiteColor,
          // color: Colors.red
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: Colors.red
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: product.image.isNotEmpty
                      ? Image.network(
                    product.image,
                    // 'https://specifications-pro.com/wp-content/uploads/2020/03/iPhone-9-600x600.jpeg',
                    fit: BoxFit.fill,
                    errorBuilder: (_, __, ___) {
                      return LanguageEnglish(context) == 'English'
                          ? Image.asset('images/no_image_english.png')
                          : Image.asset('images/no_image_arabic.png');
                    },
                  )
                      : LanguageEnglish(context) == 'English'
                      ? Image.asset('images/no_image_english.png')
                      : Image.asset('images/no_image_arabic.png')),

              // margin: const EdgeInsets.only(bottom: 5),
            ),
            // PRODUCT NAME
            Container(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                product.name.length < 15
                    ? product.name
                    : product.name.replaceRange(15, product.name.length, '...'),
                style: getcustomertextStyle(
                    context, 18, FontWeight.normal, Colors.black),
              ),
            ),
            //  BUTTON ADD IN CAR
            isExist ?
            Container(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 7, left: 10),
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                      width: MediaQuery.of(context).size.width * 0.08,
                      child: RaisedButton(
                        onPressed: () async {
                          await Get.find<CarController>().updateProductToCar(product.name,false);
                          // updateProductToCar(product.name,false);
                          // setState(() {
                          //  element.count == 1 ?  count = element.count -1 : NotesDataBase.instance.deleteCar(element.id) ;
                          //   isChanging = true;
                          // });
                          showToast();
                        },
                        padding: const EdgeInsets.only(bottom: 15),
                        child: const Icon(
                          Icons.minimize,
                          color: Colors.white,
                          size: 18,
                        ),
                        color: const Color.fromRGBO(210, 140, 84, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 7, left: 10),
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05),
                    child: Text(
                        '${Get.find<CarController>().carProductsList[
                        Get.find<CarController>().carProductsList.indexWhere((element) =>
                        element.title == product.name)
                        ].count}',

                        style: getcustomertextStyle(
                            context,
                            16,
                            FontWeight.bold,
                            const Color.fromRGBO(34, 53, 53, 1))),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    // margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.08),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                      width: MediaQuery.of(context).size.width * 0.08,
                      child: RaisedButton(
                        onPressed: () async {
                          // await  Get.find<CarController>().updateProductToCar(product.id, true);
                          await Get.find<CarController>()
                              .updateProductToCar(product.name, true);
                          showToast();
                          // updateProductToCar(
                          //    product.name,
                          //     true);
                          // setState(() {
                          //
                          //   count = element.count +1 ;
                          //   isChanging = true;
                          // });
                        },
                        padding: const EdgeInsets.only(top: 2),
                        child: const Icon(Icons.add,
                            color: Colors.white, size: 18),
                        color: const Color.fromRGBO(210, 140, 84, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  ),
                ],
              ),
            )
            : Container(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 15, top: 10, right: 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.03,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    AppLocalizations.of(context)!
                        .getTranslatedValue('PutInCart')
                        .toString(),
                    style: getcustomertextStyle(
                        context, 10, FontWeight.normal, Colors.white),
                  ),
                  color: ColorTheme.color2,
                  onPressed: () {
                    Get.find<CarController>().addProductToCar(product);
                    Get.to(() => DetailsScreen(product: product), arguments: arguments);
                    showToast();
                    setState(() {
                      // isSelected = true;
                      // isExist[product.name] = true;
                    });
                    // displayListContain();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    debugPrint('in buildSectionCard..........................');
    super.initState();
  }

  @override
  Widget build(BuildContext context) => buildCard(context,widget.product);
}
