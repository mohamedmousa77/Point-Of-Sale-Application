import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application/controllers/category_brand_controller.dart';
import 'package:pos_application/models/firebase_product_model.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';
import '../widget/change_language_style.dart';
import '../widget/section_product_cards.dart';

Widget resultOfSearch(BuildContext context,
    {required List<FirebaseProduct> result}) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height *0.05,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white),
        padding: EdgeInsets.only(
            left: LanguageEnglish(context) == 'English' ? 100 : 130, top: 25, bottom: 15),
        child: Text(
            AppLocalizations.of(context)!
                .getTranslatedValue('result')
                .toString(),
            style: getcustomertextStyle(context, 20, FontWeight.bold, Colors.black)),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,

        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: result.isEmpty
            ? Center(
                child: Text(
                  AppLocalizations.of(context)!
                      .getTranslatedValue('There_is_no_product_with_this_name')
                      .toString(),
                  style: getcustomertextStyle(
                      context, 20, FontWeight.normal, Colors.black),
                ),
              )
            : GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: result.length,
                itemBuilder: (BuildContext context, index) => buildSectionCard(
                   product: result[index])),
      ),
    ],
  );
}
