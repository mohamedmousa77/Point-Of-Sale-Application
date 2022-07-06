import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application/controllers/category_brand_controller.dart';
import 'package:pos_application/controllers/firebase_product_controller.dart';
import '../models/category_model.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../models/firebase_product_model.dart';
import '../screens/sections.dart';
import '../widget/change_language_style.dart';
import '../widget/section_card.dart';

Widget sectionsPart(BuildContext context ) {
  // return GetBuilder<CategoryController>(builder: (category) {
  return  GetBuilder<FirebaseProductController>(builder: (category) {
    return Column(
      children: [
        // Category Name
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          padding: EdgeInsets.only(left: LanguageEnglish(context) == 'English' ? 140 : 150, top: 25, bottom: 0),
          child: Text(
              AppLocalizations.of(context)!
                  .getTranslatedValue('items')
                  .toString(),
              style: getcustomertextStyle(
                  context, 20, FontWeight.bold, Colors.black)),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height * 0.4,
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            // itemCount: category.categoryList.length,
            itemCount : category.productCategories.length ,
            itemBuilder: (BuildContext context, index) {
              // SectionCardHomeScreen(
              //   index: index,
              //   nameCategory: category.productCategories[index],
              //
              //   // value: 1,
              //   // 'category.categoryList[index].name',
              //   // urlImage: category.searchResultList[index].image
              //   // 'category.categoryList[index].id'
              //   // 1
              // );
              return buildSectionCardHomeScreen (
                context,category.productCategories[index],
                category.categoriesList[index]
              );

            },
          ),
        ),
      ],
    );
  });
}


Widget buildSectionCardHomeScreen (context ,String categoryName,FirebaseProduct product){
  return GestureDetector(
    onTap: () {
      Get.find<FirebaseProductController>().searchByCategory(category:categoryName);
      Get.to(
      SectionScreen(
        categoryName: categoryName,
        product: Get.find<FirebaseProductController>().searchResultList));
    },
    child: Container(
        height: MediaQuery.of(context).size.height * 0.19,
        width: MediaQuery.of(context).size.width * 0.4,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromRGBO(248, 248, 248, 1),
        ),
        child: Column(
          children: [
            //Category Image
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5)
              // ,color: Colors.red
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  LanguageEnglish(context) == 'English'
                      ? 'images/no_image_english.png'
                      : 'images/no_image_arabic.png',
                  fit: BoxFit.fill,
                ),
              ),
              // margin: const EdgeInsets.only(bottom: 10),
            ),
            // : Container(
            //     height: MediaQuery.of(context).size.height * 0.1,
            //     width: MediaQuery.of(context).size.width * 0.40,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(50)),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(10),
            //       child: Image.network(productList[widget.index].image, fit: BoxFit.cover,),
            //     ),
            //     margin: const EdgeInsets.only(bottom: 10),
            //   ),
            Container(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
              child: Text(
                  categoryName.length > 15
                      ? categoryName
                      .replaceRange(10, categoryName.length, '...')
                      : categoryName.toUpperCase(),
                  style: getcustomertextStyle(context, 14, FontWeight.w500,
                      const Color.fromRGBO(34, 53, 53, 1))),
            ),
          ],
        )),
  );
}


