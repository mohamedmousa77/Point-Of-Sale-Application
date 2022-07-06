import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pos_application/models/firebase_product_model.dart';
import 'package:pos_application/theme/colors.dart';
import 'package:pos_application/widget/section_product_cards.dart';

import '../classes/app_localizations.dart';
import '../classes/color_theme.dart';
import '../classes/localization_const.dart';
import '../controllers/car_controller.dart';
import '../controllers/firebase_product_controller.dart';
import '../database/note.dart';
import '../database/notes_database.dart';
import '../widget/change_language_style.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';
import '../widget/custom_sizedbox.dart';
import 'details_screen.dart';

class SectionScreen extends StatefulWidget {
  SectionScreen({Key? key, required this.product, required this.categoryName})
      : super(key: key);

  List<FirebaseProduct> product;

  String categoryName;

  @override
  _SectionScreenState createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  Map<String,bool> isExist = {};
  Map<String, int> count = {};
  // int index = 0;

  void checkIsProductExistInCar() {
    if (Get.find<CarController>().carProductsList.isNotEmpty) {
      debugPrint('carProductsList isNotEmpty');
      for (var productCar in Get.find<CarController>().carProductsList) {
        for (var product in widget.product) {
          if (productCar.title == product.name) {
            setState(() {
              isExist[productCar.title] = true;
              // index = Get.find<CarController>()
              //     .carProductsList
              //     .indexWhere((element) => element.title == product.name);
            });
            debugPrint('product Exist >>>>>>>>>  ' + isExist.toString());
          } else {
            setState(() {
              isExist[productCar.title] = false;
            });
            debugPrint('product Exist >>>>>>>>>  ' + isExist.toString());
          }
        }
      }

      debugPrint('product Exist >>>>>>>>>  ' + isExist.toString());
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    displayListContain();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState
    checkIsProductExistInCar();
    displayListContain();
    Get.find<FirebaseProductController>()
        .searchByCategory(category: widget.categoryName);
    // Get.find<CarController>().addListener(() { setState(() {});});
    debugPrint('in sections........................');

    super.initState();
  }



  void displayListContain() async {
    Get.find<CarController>().fetchAllCarProducts();
      for (var product in Get.find<CarController>().carProductsList) {
        count.addAllIf(Get.find<CarController>().carProductsList.isNotEmpty ,{product.title: product.count});
        isExist.addAllIf(Get.find<CarController>().carProductsList.isNotEmpty &&
            Get.find<CarController>().carProductsList.contains(product.title),{product.title : true});
        debugPrint('is Exist List  '+isExist.toString());
        debugPrint('count List  ' + count.toString());
      }


  }

  void updateProductToCar(String title, bool isIncrement) async {
    debugPrint('updateProductToCar Called');
    debugPrint('title is ' + title);
    debugPrint(count[title]!.toString());

    setState(() {
      isIncrement
          ? count[title]! + 1
          : count[title] == 1
              ? isExist[title] = false
              : count[title]! - 1;
    });
    displayListContain();

    // return carProduct.count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          customAppBar(context, key: 2),
          customSizedBox(context, 0.03),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.093,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                )),
            alignment: Alignment.center,
            //printing the name of the category
            child: Text(
                // " ${Get.arguments[0]}",
                widget.categoryName,
                style: getcustomertextStyle(context, 28, FontWeight.bold,
                    const Color.fromRGBO(34, 53, 53, 1))),
          ),
          /////////////////////////////////////////////////////////////////////////////////////////////
          //////////////////////////////////////////items//////////////////////////////////////////////////
          //checking the product list
          // Get.arguments[1] == "No product"
          widget.product.isEmpty
              ? Container(
                  color: Colors.white,
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.7),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text("No product"),
                )
              : Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    // itemCount: Get.arguments[1].length,
                    itemCount: widget.product.length,
                    itemBuilder: (context, index) =>
                        buildCard(context,widget.product[index]),
                  ),
                ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(1),
    );
  }

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
                          displayListContain();
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  // bool isSelected = false;

  void showToast() {
    Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!
            .getTranslatedValue('add_succe')
            .toString(),
        fontSize: 18);
  }
}
