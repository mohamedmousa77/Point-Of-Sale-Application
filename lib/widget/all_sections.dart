import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application/controllers/category_brand_controller.dart';
import '../models/category_model.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../widget/change_language_style.dart';
import '../widget/section_card.dart';

Widget sectionsPart(BuildContext context) {
  return GetBuilder<CategoryController>(builder: (category) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          padding: EdgeInsets.only(left: LanguageEnglish(context) == 'English' ? 140 : 150, top: 25, bottom: 15),
          child: Text(
              AppLocalizations.of(context)!
                  .getTranslatedValue('items')
                  .toString(),
              style: getcustomertextStyle(
                  context, 20, FontWeight.bold, Colors.black)),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: category.categoryList.length,
            itemBuilder: (BuildContext context, index) => sectionCard(
                1,
                category.categoryList[index].name,
                LanguageEnglish(context) == 'English'
                    ? 'images/no_image_english.png'
                    : 'images/no_image_arabic.png',
                category.categoryList[index].id),
          ),
        ),
      ],
    );
  });
}
