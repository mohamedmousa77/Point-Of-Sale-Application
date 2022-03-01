import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pos_application/models/product_model.dart';
import 'package:pos_application/services/product_service.dart';
import 'package:pos_application/widget/all_brands.dart';

import '../classes/localization_const.dart';
import '../widget/all_sections.dart';
import '../widget/change_language_style.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';
import '../widget/scanner_buttom.dart';
import 'classes/app_localizations.dart';
import 'controllers/busniss_controller.dart';
import 'controllers/category_brand_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  //the selected item in drop down menu
  int selectedId = 0;

  //the id of the brand
  int? idBrand;

  int? idSection;

  //the initialize value of the search bar
  String valueOfSearch = 'Looking for...';
  String ResultSearch = '';
  int BrindId = 0;

  bool isSectionPart = true;

  List<Product> searchData = [];

  @override
  void didChangeDependencies() {
    Get.find<CategoryController>().fetchData();
    Get.find<BusnissController>().fetchBusniss();
    Get.find<CategoryController>().selectedValue = null;
    Get.find<CategoryController>().selectedValueSection = null;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //dropdown menu of brands items
    Container buildBrandItems = Container(
      margin: const EdgeInsets.only(left: 29),
      padding: const EdgeInsets.only(left: 10, right: 20),
      width: MediaQuery.of(context).size.width * 0.37,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(236, 238, 244, 1),
        borderRadius: BorderRadius.circular(13),
      ),
      child: GetBuilder<CategoryController>(builder: (brands) {
        return Center(
          child: DropdownButton<int?>(
            onTap: () {
              if (!isSectionPart) {
                setState(() {
                  // // isSectionPart = true;
                });
              }
            },
            value: Get.find<CategoryController>().selectedValue == 0
                ? null
                : Get.find<CategoryController>().selectedValue,
            onChanged: (value) {
              Get.find<CategoryController>().changeSelectedValue(value);
            },
            underline: DropdownButtonHideUnderline(child: Container()),
            hint: Center(
              child: Text(
                AppLocalizations.of(context)!
                    .getTranslatedValue('brand')
                    .toString(),
              ),
            ),
            isExpanded: true,
            items: brands.brandList.map((items) {
              return DropdownMenuItem<int?>(
                child: Text(items.name.toString()),
                onTap: () async {
                  if (BrindId != 0 && ResultSearch.isNotEmpty) {
                    setState(() {
                      Get.find<CategoryController>().changeSelectedValue(items.id);

                      idBrand = items.id;
                      BrindId=items.id;
                      // valueOfSearch = items.name;
                    });
                  }
                  print('Search BY Brind ' + ResultSearch + BrindId.toString());
                  // print('section value : ' );
                  // print(Get.find<CategoryController>().selectedValueSection );
                  // print('section value : ' );
                  // print(Get.find<CategoryController>().selectedValueSection );
                  List<Product> mysearchResult = await ProductApi().search(
                      nameProduct: ResultSearch,
                      brandId: BrindId,
                      categoryId: 16);
                  setState(() {
                    Get.find<CategoryController>().changeSelectedValue(items.id);
                    idBrand = items.id;
                    BrindId = items.id;
                    searchData = mysearchResult;
                    isSectionPart = false;
                  });
                },
                value: items.id,
              );
            }).toList()
              ..insert(
                0,
                DropdownMenuItem<int?>(
                  child: Text(
                    AppLocalizations.of(context)!
                        .getTranslatedValue('brand')
                        .toString(),
                  ),
                  onTap: () {
                    setState(() {
                      Get.find<CategoryController>().changeSelectedValue(null);
                      idBrand = null;
                    });
                  },
                  value: null,
                ),
              ),
          ),
        );
      }),
    );
    //dropdown menu for sections item
    Container buildSectionItems = Container(
      margin: const EdgeInsets.only(left: 29),
      padding: const EdgeInsets.only(left: 10, right: 20),
      width: MediaQuery.of(context).size.width * 0.37,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(236, 238, 244, 1),
        borderRadius: BorderRadius.circular(13),
      ),
      child: GetBuilder<CategoryController>(builder: (category) {
        return Center(
          child: DropdownButton<int?>(
            onTap: () {
              if (!isSectionPart) {
                setState(() {
                  // isSectionPart = true;
                });
              }
            },
            value: Get.find<CategoryController>().selectedValueSection == 0
                ? null
                : Get.find<CategoryController>().selectedValueSection,
            onChanged: (value) {
              Get.find<CategoryController>().changeSelectedValueSection(value);
            },
            underline: DropdownButtonHideUnderline(child: Container()),
            hint: Center(
              child: Text(
                AppLocalizations.of(context)!
                    .getTranslatedValue('items')
                    .toString(),
              ),
            ),
            isExpanded: true,
            items: category.categoryList.map((items) {
              return DropdownMenuItem<int?>(
                child: Text(items.name.toString()),
                onTap: () async {
                      Get.find<CategoryController>().changeSelectedValueSection(items.id);
                      idSection = items.id;
                      ResultSearch = items.name;
                      print('Search BY section ' + ResultSearch );
                      // print(Get.find<CategoryController>().selectedValueSection);
                  List<Product> mysearchResult = await ProductApi().search(
                      nameProduct: ResultSearch,
                      categoryId: 16);
                  setState(() {
                    searchData = mysearchResult;
                    isSectionPart = false;
                  });
                },
                value: items.id,
              );
            }).toList()
              ..insert(
                0,
                DropdownMenuItem<int?>(
                  child: Text(AppLocalizations.of(context)!
                      .getTranslatedValue('items')
                      .toString()),
                  onTap: () {
                    setState(() {
                      Get.find<CategoryController>()
                          .changeSelectedValueSection(null);
                      idBrand = null;
                    });
                  },
                  value: null,
                ),
              ),
          ),
        );
      }),
    );
    //search buttom
    InkWell searchButtom = InkWell(
      child: Container(
        padding:
            const EdgeInsets.only(left: 10, right: 10, bottom: 30, top: 30),
        margin: EdgeInsets.only(
            left: LanguageEnglish(context) == "English" ? 0 : 30,
            right: LanguageEnglish(context) == "English" ? 30 : 0,
            top: 47),
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: LanguageEnglish(context) == "English"
            ? const BoxDecoration(
                color: Color.fromRGBO(34, 53, 53, 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                ))
            : const BoxDecoration(
                color: Color.fromRGBO(34, 53, 53, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                )),
        child: SvgPicture.asset('images/search-1.svg'),
      ),
      onTap: () async {
        print(valueOfSearch);
        List<Product> mysearchResult =
            await ProductApi().search(nameProduct: valueOfSearch);
        //brandId: int.parse(valueOfSearch),categoryId: 16
        setState(() {
          searchData = mysearchResult;
          isSectionPart = false;
        });
      },
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(context), //appbar
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.74,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(40)),
                      child: Column(
                        children: [
                          //search bar + scannar buttom
                          LanguageEnglish(context) == 'English'
                              ? Center(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 30, right: 0, top: 47),
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 25, bottom: 25),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(13),
                                            bottomLeft: Radius.circular(13),
                                          ),
                                          color:
                                              Color.fromRGBO(236, 238, 244, 1),
                                        ),
                                        child: TextField(
                                          onChanged: (text) {
                                            setState(() {
                                              valueOfSearch = text;
                                            });
                                          },
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: valueOfSearch,
                                              hintStyle: getcustomertextStyle(
                                                  context,
                                                  15,
                                                  FontWeight.w300,
                                                  const Color.fromRGBO(
                                                      34, 53, 53, 1))),
                                        ),
                                      ),
                                      customScannerButtom(),
                                      searchButtom //the search buttom
                                    ],
                                  ),
                                )
                              : Center(
                                  child: Row(children: [
                                    searchButtom,
                                    customScannerButtom(),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 30, top: 47),
                                      padding: const EdgeInsets.only(
                                          left: 75, top: 25, bottom: 25),
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(13),
                                          bottomRight: Radius.circular(13),
                                        ),
                                        color: Color.fromRGBO(236, 238, 244, 1),
                                      ),
                                      child: TextField(
                                        // textDirection: TextDirection.rtl,
                                        onChanged: (text) {
                                          setState(() {
                                            valueOfSearch = text;
                                          });
                                        },
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            // hintTextDirection: TextDirection.RTL,
                                            border: InputBorder.none,
                                            hintText: valueOfSearch,
                                            hintStyle: getcustomertextStyle(
                                                context,
                                                15,
                                                FontWeight.w300,
                                                const Color.fromRGBO(
                                                    34, 53, 53, 1))),
                                      ),
                                    ),
                                  ]),
                                ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          Center(
                            child: Row(
                              children: [
                                //the section button
                                buildSectionItems,
                                //the brand button
                                buildBrandItems //drop down button of brand items
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //////////////////////////////////////////////////////////////
                    ////////////////////SECTION And BRAND PART////////////////////
                    /////////////////////////////////////////////////////////////
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    isSectionPart
                        ? sectionsPart(
                            context) //this will show all the sections of the application
                        : resultOfSearch(context, searchData)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(1),
    );
  }
}
