import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pos_application/services/product_service.dart';

import '../classes/app_localizations.dart';
import '../classes/color_theme.dart';
import '../classes/localization_const.dart';
import '../database/note.dart';
import '../database/notes_database.dart';
import '../screens/details_screen.dart';
import '../widget/change_language_style.dart';

class buildSectionCard extends StatefulWidget {
  final String productName;
  final int id;
  final String urlImage;

  buildSectionCard(this.productName, this.urlImage, this.id);

  @override
  _buildSectionCardState createState() => _buildSectionCardState();
}

class _buildSectionCardState extends State<buildSectionCard> {
  void _showToast() {
    Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!
            .getTranslatedValue('add_succe')
            .toString(),
        fontSize: 18);
  }

  bool isSelected = false;

  @override
  void didChangeDependencies() {
    refreshCar();
    super.didChangeDependencies();
  }

  List<Car> carproducts = [];

  Future refreshCar() async {
    carproducts = await NotesDataBase.instance.readAllCarProducts();
    setState(() {});
  }

  Future addProductToCar() async {
    if (carproducts.isEmpty) {
      addproductToCar();
    } else {
      bool found = false;
      for (Car car in carproducts) {
        if (car.title == widget.productName) {
          updateProductToCar(car.id!);
          found = true;
          break;
        }
      }
      if (!found) {
        addproductToCar();
      }
    }
  }

  Future updateProductToCar(int ID) async {
    Car carProduct = carproducts.firstWhere((element) => ID == element.id);
    carProduct = carProduct.copyCar(count: carProduct.count + 1
        // : carProduct.count == 1 ?  await NotesDataBase.instance.deleteCar(carProduct.id!) : carProduct.count-1 ,
        );
    await NotesDataBase.instance.updateCar(carProduct);
    refreshCar();
  }

  Future addproductToCar() async {
    ProductApi productApi = ProductApi();
    String price = await productApi.getPriceOfTheProduct(widget.id);
    final carproduct = Car(
      id: widget.id,
      title: widget.productName,
      count: 1,
      price: double.parse(price.toString()),
      ImageUrl: widget.urlImage,
    );
    await NotesDataBase.instance.createCar(carproduct);
    refreshCar();
  }

  int count = 0;

  void checkCar() {
    carproducts.map(
      (element) => count = element.count,
    );
  }

  Widget buildSectionCards(BuildContext context) {
    List<dynamic> myarguments = [
      widget.productName,
      widget.id,
      widget.urlImage,
    ];
    return FlatButton(
      onPressed: () =>
          Get.to(() => const DetailsScreen(), arguments: myarguments),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.33,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(248, 248, 248, 1),
          // color: Colors.red
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.urlImage,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) {
                    return LanguageEnglish(context) == 'English'
                        ? Image.asset('images/no_image_english.png')
                        : Image.asset('images/no_image_arabic.png');
                  },
                ),
              ),
              margin: const EdgeInsets.only(bottom: 5),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Container(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                widget.productName.length < 15
                    ? widget.productName
                    : widget.productName
                        .replaceRange(15, widget.productName.length, '...'),
                style: getcustomertextStyle(
                    context, 14, FontWeight.normal, Colors.black),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Container(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 15, top: 10, right: 15),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.04,
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
                    addProductToCar();
                    _showToast();
                    setState(() {
                      isSelected = true;
                    });
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
  Widget build(BuildContext context) => buildSectionCards(context);
}
