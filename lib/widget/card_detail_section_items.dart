import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../classes/app_localizations.dart';
import '../screens/details_screen.dart';
import '../widget/change_language_style.dart';

Widget detailCard2(BuildContext context, String section, String urlImage) {
  return FlatButton(
    onPressed: () => Get.to(const DetailsScreen()),
    child: Container(
      height: 260,
      width: 300,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: const Color.fromRGBO(248, 248, 248, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  urlImage,
                  width: 110,
                  height: 60,
                ),
                padding: const EdgeInsets.only(top: 20, left: 15, bottom: 5),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: Text(section,
                    style: getcustomertextStyle(
                        context, 14, FontWeight.bold, Colors.black)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: Text('1000',
                    style: getcustomertextStyle(context, 14, FontWeight.bold,
                        const Color.fromRGBO(210, 140, 84, 1))),
              ),
              Container(
                padding: const EdgeInsets.only(
                    bottom: 10, left: 15, top: 10, right: 15),
                child: SizedBox(
                  height: 30,
                  width: 200,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Text(
                        AppLocalizations.of(context)!
                            .getTranslatedValue('PutInCart')
                            .toString(),
                        style: getcustomertextStyle(
                            context, 10, FontWeight.bold, Colors.white)

                        // TextStyle(fontSize: 10, color: Colors.white),
                        ),
                    color: const Color.fromRGBO(210, 140, 84, 1),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          )),
    ),
  );
}
