import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../database/note.dart';
import '../database/notes_database.dart';
import '../widget/car_product_detail.dart';
import '../widget/change_language_style.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';
import '../controllers/car_controller.dart';
import 'package:sqflite/sqflite.dart';

class ShoppingCar extends StatefulWidget {
  @override
  _ShoppingCarState createState() => _ShoppingCarState();
}

class _ShoppingCarState extends State<ShoppingCar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Container(
                height: MediaQuery.of(context).size.height * 0.735,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
                child: carproducts == null
                    ? const Center(child: Text('No Products'))
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Center(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 160, bottom: 15, top: 15),
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    )),
                                child: Text(
                                    AppLocalizations.of(context)!
                                        .getTranslatedValue('cart')
                                        .toString(),
                                    style: getcustomertextStyle(
                                        context,
                                        20,
                                        FontWeight.bold,
                                        const Color.fromRGBO(34, 53, 53, 1))),
                              ),
                            ),
                            buildCart_2(context),
                            Get.find<CarController>().totalAmount.value == 0
                                ? Container()
                                : totalamountOfPruducts(
                                    context,
                                    Get.find<CarController>()
                                        .totalAmount
                                        .value),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02,
                            )
                          ],
                        ),
                      )),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(2),
    );
  }

  void theResultOfTheSumOfTheTotalPrice() {
    var result = 0.0;
    List<double> priceSum = [];
    List<int> countSum = [];
    if (carproducts.isEmpty) {
      Get.find<CarController>().totalAmount.value = result;
    } else {
      for (int count = 0; count < carproducts.length; count++) {
        priceSum.add(carproducts[count].price);
        countSum.add(carproducts[count].count);
      }
      for (int count = 0; count < carproducts.length; count++) {
        result = (result + (priceSum[count] * countSum[count]));
      }
      Get.find<CarController>().totalAmount.value = result;
    }
    setState(() {});
  }

  buildCart_2(BuildContext context) {
    return Column(
      children: carproducts.map((element) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.16,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(248, 248, 248, 1),
            ),
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      color: const Color.fromRGBO(34, 53, 53, 1)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        element.ImageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return LanguageEnglish(context) == 'English'
                              ? Image.asset('images/no_image_english.png')
                              : Image.asset('images/no_image_arabic.png');
                        },
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: const EdgeInsets.only(top: 30, left: 15),
                      child: Text(element.title,
                          style: getcustomertextStyle(
                              context,
                              18,
                              FontWeight.bold,
                              const Color.fromRGBO(34, 53, 53, 1))),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 6, left: 10),
                      child: Text(' ${element.price.toString().trim()}',
                          style: getcustomertextStyle(
                              context,
                              16,
                              FontWeight.bold,
                              const Color.fromRGBO(210, 140, 84, 1))),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                        width: MediaQuery.of(context).size.width * 0.08,
                        child: RaisedButton(
                          padding: const EdgeInsets.only(top: 2),
                          child: const Icon(Icons.add,
                              color: Colors.white, size: 18),
                          color: const Color.fromRGBO(210, 140, 84, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          onPressed: () async {
                            await updateProductToCar(element.id!, true);
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 7, left: 10),
                      child: Text('${element.count}',
                          style: getcustomertextStyle(
                              context,
                              16,
                              FontWeight.bold,
                              const Color.fromRGBO(34, 53, 53, 1))),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 7, left: 10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                        width: MediaQuery.of(context).size.width * 0.08,
                        child: RaisedButton(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: const Icon(
                            Icons.minimize,
                            color: Colors.white,
                            size: 18,
                          ),
                          color: const Color.fromRGBO(210, 140, 84, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          onPressed: () async {
                            await updateProductToCar(element.id!, false);
                          },
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ));
      }).toList(),
    );
  }

  @override
  void didChangeDependencies() {
    refreshCar();
    super.didChangeDependencies();
    theResultOfTheSumOfTheTotalPrice();
  }

  List<Car> carproducts = [];

  Future refreshCar() async {
    carproducts = await NotesDataBase.instance.readAllCarProducts();
    theResultOfTheSumOfTheTotalPrice();
    setState(() {});
  }

  // await updateProductToCar(element.id! , true);
  Future updateProductToCar(int ID, bool isAdd) async {
    Car carProduct = carproducts.firstWhere((element) => ID == element.id);

    carProduct = carProduct.copyCar(
      count: isAdd
          ? carProduct.count + 1
          : carProduct.count == 1
              ? await NotesDataBase.instance.deleteCar(carProduct.id!)
              : carProduct.count - 1,
    );

    await NotesDataBase.instance.updateCar(carProduct);
    refreshCar();
  }
}
