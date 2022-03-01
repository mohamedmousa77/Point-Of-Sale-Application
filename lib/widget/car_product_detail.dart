import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../controllers/car_controller.dart';
import '../database/note.dart';
import '../database/notes_database.dart';
import '../screens/clientdetails.dart';
import '../widget/change_language_style.dart';

Widget detailCart(BuildContext context, String nameProduct, String urlImage,
    String price, int quantity) {
  CarController carcontroller = CarController();
  return FlatButton(
    onPressed: () {},
    child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(248, 248, 248, 1),
        ),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Color.fromRGBO(34, 53, 53, 1)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(urlImage, fit: BoxFit.cover)),
              // padding: EdgeInsets.only(top: 19, bottom: 19, right: 33, left: 33),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30, left: 10),
                  child: Text(nameProduct,
                      style: getcustomertextStyle(context, 14, FontWeight.bold,
                          Color.fromRGBO(34, 53, 53, 1))),
                ),
                Container(
                  padding: EdgeInsets.only(top: 6, left: 10),
                  child: Text(price + '\$',
                      style: getcustomertextStyle(context, 19, FontWeight.bold,
                          Color.fromRGBO(210, 140, 84, 1))),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                    width: MediaQuery.of(context).size.width * 0.08,
                    child: RaisedButton(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                      color: Color.fromRGBO(210, 140, 84, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      onPressed: () {
                        carcontroller.increment();
                      },
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 7, left: 10),
                    child: Obx(
                      () => Text('${carcontroller.NumberofProduct}',
                          style: getcustomertextStyle(context, 16,
                              FontWeight.bold, Color.fromRGBO(34, 53, 53, 1))),
                    )),
                Container(
                  padding: EdgeInsets.only(top: 7, left: 10),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                    width: MediaQuery.of(context).size.width * 0.08,
                    child: RaisedButton(
                      padding: EdgeInsets.only(bottom: 15),
                      child: const Icon(
                        Icons.minimize,
                        color: Colors.white,
                        size: 18,
                      ),
                      color: Color.fromRGBO(210, 140, 84, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      onPressed: () {
                        carcontroller.Disincrement();
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        )),
  );
}

Widget totalamountOfPruducts(BuildContext context, double totalPrice) {
  return Container(
    padding: const EdgeInsets.only(left: 25, right: 25),
    margin: const EdgeInsets.only(top: 25),
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        child: Text(
            AppLocalizations.of(context)!
                    .getTranslatedValue('buy_text')
                    .toString() +
                '${totalPrice}',
            style: getcustomertextStyle(
                context, 20, FontWeight.w400, Colors.white)),
        color: const Color.fromRGBO(210, 140, 84, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: () {
          Get.to(() => ClientDetails());
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ClientDetails()));
        },
      ),
    ),
  );
}

Widget invoiceCart(BuildContext context, String nameProduct, String urlImage,
    String price, String quantity) {
  return Container(
      height: MediaQuery.of(context).size.height * 0.16,
      width: MediaQuery.of(context).size.width * 0.95,
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
                  urlImage,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) {
                    return LanguageEnglish(context) == 'English'
                        ? Image.asset('images/no_image_english.png')
                        : Image.asset('images/no_image_arabic.png');
                  },
                )),
            //
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30, left: 10),
                child: Text(nameProduct,
                    style: getcustomertextStyle(context, 15, FontWeight.bold,
                        const Color.fromRGBO(34, 53, 53, 1))),
              ),
              Container(
                padding: const EdgeInsets.only(top: 6, left: 10),
                child: Text(price,
                    style: getcustomertextStyle(context, 15, FontWeight.bold,
                        const Color.fromRGBO(210, 140, 84, 1))),
              ),
              Container(
                padding: const EdgeInsets.only(top: 7, left: 10),
                child: Text(quantity,
                    style: getcustomertextStyle(context, 16, FontWeight.bold,
                        const Color.fromRGBO(34, 53, 53, 1))),
              ),
            ],
          ),
        ],
      ));
}
