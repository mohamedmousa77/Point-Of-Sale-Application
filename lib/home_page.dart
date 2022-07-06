import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_application/models/firebase_product_model.dart';
import 'package:pos_application/models/product_model.dart';
import 'package:pos_application/screens/details_screen.dart';
import 'package:pos_application/services/product_service.dart';
import 'package:pos_application/theme/colors.dart';
import 'package:pos_application/widget/all_brands.dart';

import '../classes/localization_const.dart';
import '../widget/all_sections.dart';
import '../widget/change_language_style.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';
import '../widget/scanner_buttom.dart';
import 'classes/app_localizations.dart';
import 'controllers/busniss_controller.dart';
import 'controllers/car_controller.dart';
import 'controllers/category_brand_controller.dart';
import 'controllers/firebase_product_controller.dart';

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
  String valueOfSearch = 'Looking For....';

  // String resultSearch = '';
  int BrindId = 0;

  bool isSectionPart = true;
  bool isSearchingByName = false;

  // search data in API
  // List<Product> searchData = [];
  // List<FirebaseProduct> searchData = [];
  String? brandSelected;
  String? categorySelected;

  List<FirebaseProduct> searchedList = [];

  @override
  void didChangeDependencies() {
    // Get.find<CategoryController>().fetchData();
    // Get.find<BusnissController>().fetchBusniss();
    // Get.find<CategoryController>().selectedValue = null;
    // Get.find<CategoryController>().selectedValueSection = null;
    Get.find<FirebaseProductController>().fetchProductBrand();
    Get.find<FirebaseProductController>().fetchProductCategory();
    Get.find<FirebaseProductController>().fetchProduct();
    Get.find<FirebaseProductController>().searchResultList.clear();
    Get.find<FirebaseProductController>().fetchAllProductCategory();

    super.didChangeDependencies();
  }

  @override
  void initState() {
    Get.find<CarController>().fetchAllCarProducts();
    Get.find<FirebaseProductController>().fetchAllProductCategory();
    // Get.find<CarController>().theResultOfTheSumOfTheTotalPrice();
    Get.find<FirebaseProductController>().searchResultList.clear();
    controller.addListener(() {
      controller.offset == 20
          ? controller.jumpTo(2)
          : debugPrint(controller.offset.toString());
      // setState(() {
      //   closeSearchPart = controller.offset > 0;
      // });
    });
    Timer(const Duration(seconds: 2), () async {
      Get.find<FirebaseProductController>().fetchProduct();
      Get.find<FirebaseProductController>().fetchProductBrand();
      Get.find<FirebaseProductController>().fetchProductCategory();
      Get.find<FirebaseProductController>().fetchAllProductCategory();
    });

    super.initState();
  }

  List<dynamic> myarguments = [
    Get.find<FirebaseProductController>().productsList
    // widget.productName,
    // widget.id,
    // widget.urlImage,
  ];
  bool closeSearchPart = false ;
  ScrollController controller = ScrollController();
  List<FirebaseProduct> displayList =
      List.from(Get.find<FirebaseProductController>().productsList);

  @override
  Widget build(BuildContext context) {
    // List<String> itemsSection = ['laptop' , 'phone' , 'pc' ];
    //dropdown menu of brands items
    // Container buildBrandItems = Container(
    //   margin: const EdgeInsets.only(left: 29),
    //   padding: const EdgeInsets.only(left: 10, right: 20),
    //   width: MediaQuery.of(context).size.width * 0.37,
    //   height: MediaQuery.of(context).size.height * 0.09,
    //   decoration: BoxDecoration(
    //     color: const Color.fromRGBO(236, 238, 244, 1),
    //     borderRadius: BorderRadius.circular(13),
    //   ),
    //   child: GetBuilder<CategoryController>(builder: (brands) {
    //     return Center(
    //       child: DropdownButton<int?>(
    //         onTap: () {
    //           if (!isSectionPart) {
    //             setState(() {
    //               // // isSectionPart = true;
    //             });
    //           }
    //         },
    //         value: Get.find<CategoryController>().selectedValue == 0
    //             ? null
    //             : Get.find<CategoryController>().selectedValue,
    //         onChanged: (value) {
    //           Get.find<CategoryController>().changeSelectedValue(value);
    //         },
    //         underline: DropdownButtonHideUnderline(child: Container()),
    //         hint: Center(
    //           child: Text(
    //             AppLocalizations.of(context)!
    //                 .getTranslatedValue('brand')
    //                 .toString(),
    //           ),
    //         ),
    //         isExpanded: true,
    //         items:
    //         // brands.brandList.map((items)
    //           Get.find<FirebaseProductController>().productBrands.map((items)
    //         {
    //           return DropdownMenuItem<int?>(
    //             child: Text(items),
    //             onTap: () async {
    //               if (BrindId != 0 && ResultSearch.isNotEmpty) {
    //                 setState(() {
    //                   // Get.find<CategoryController>().changeSelectedValue(items.id);
    //                   // idBrand = items.id;
    //                   // BrindId=items.id;
    //                   // valueOfSearch = items.name;
    //                 });
    //               }
    //               // List<Product> mySearchResult = await ProductApi().search(
    //               //     nameProduct: ResultSearch,
    //               //     brandId: BrindId,
    //               //     categoryId: 16
    //               // );
    //               setState(() {
    //                 // Get.find<CategoryController>().changeSelectedValue(items.id);
    //                 // idBrand = items.id;
    //                 // BrindId = items.id;
    //                 // searchData = mySearchResult;
    //                 // isSectionPart = false;
    //               });
    //             },
    //             value: items as int,
    //           );
    //         }).toList()..insert(
    //             0,
    //             DropdownMenuItem<int?>(
    //               child: Text(
    //                 AppLocalizations.of(context)!
    //                     .getTranslatedValue('brand')
    //                     .toString(),
    //               ),
    //               onTap: () {
    //                 setState(() {
    //                   Get.find<CategoryController>().changeSelectedValue(null);
    //                   idBrand = null;
    //                 });
    //               },
    //               value: null,
    //             ),
    //           ),
    //       ),
    //     );
    //   }),
    // );
    //dropdown menu for sections item
    //dropdown menu of brands items
    //dropdown menu of Gategory items
    // Container buildSectionItems = Container(
    //   margin: const EdgeInsets.only(left: 29),
    //   padding: const EdgeInsets.only(left: 10, right: 20),
    //   width: MediaQuery.of(context).size.width * 0.37,
    //   height: MediaQuery.of(context).size.height * 0.09,
    //   decoration: BoxDecoration(
    //     color: const Color.fromRGBO(236, 238, 244, 1),
    //     borderRadius: BorderRadius.circular(13),
    //   ),
    //   child: GetBuilder<CategoryController>(builder: (category) {
    //     return Center(
    //       child: DropdownButton<int?>(
    //         onTap: () {
    //           if (!isSectionPart) {
    //             setState(() {
    //               // isSectionPart = true;
    //             });
    //           }
    //         },
    //         value: Get.find<CategoryController>().selectedValueSection == 0
    //             ? null
    //             : Get.find<CategoryController>().selectedValueSection,
    //         onChanged: (value) {
    //           Get.find<CategoryController>().changeSelectedValueSection(value);
    //         },
    //         underline: DropdownButtonHideUnderline(child: Container()),
    //         hint: Center(
    //           child: Text(
    //             AppLocalizations.of(context)!
    //                 .getTranslatedValue('items')
    //                 .toString(),
    //           ),
    //         ),
    //         isExpanded: true,
    //         items:
    //         // category.categoryList.map((items)
    //         Get.find<FirebaseProductController>().productCategories.map((items)
    //         {
    //           return DropdownMenuItem<int?>(
    //             child: Text(items),
    //             onTap: () async {
    //               // Get.find<CategoryController>().changeSelectedValueSection(items.id);
    //               // idSection = items.id;
    //               // ResultSearch = items.name;
    //               // debugPrint('Search BY section ' + ResultSearch );
    //               // print(Get.find<CategoryController>().selectedValueSection);
    //               // List<Product> mysearchResult = await ProductApi().search(
    //               //     nameProduct: ResultSearch,
    //               //     categoryId: 16);
    //               // setState(() {
    //               //   searchData = mysearchResult;
    //               //   isSectionPart = false;
    //               // });
    //             },
    //             value: items as int,
    //           );
    //         }).toList()
    //           ..insert(
    //             0,
    //             DropdownMenuItem<int?>(
    //               child: Text(AppLocalizations.of(context)!
    //                   .getTranslatedValue('items')
    //                   .toString()),
    //               onTap: () {
    //                 setState(() {
    //                   Get.find<CategoryController>()
    //                       .changeSelectedValueSection(null);
    //                   idBrand = null;
    //                 });
    //               },
    //               value: null,
    //             ),
    //           ),
    //       ),
    //     );
    //   }),
    // );
    /*//dropdown menu of BRAND items*/
    /*// Filter By BRAND*/
    Container buildBrandItems = Container(
      margin: const EdgeInsets.only(left: 29),
      padding: const EdgeInsets.only(left: 10, right: 20),
      width: MediaQuery.of(context).size.width * 0.37,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(236, 238, 244, 1),
        borderRadius: BorderRadius.circular(13),
      ),
      child: GetBuilder<FirebaseProductController>(builder: (brands) {
        return Center(
          child: DropdownButton<String>(
            value: brandSelected,
            onChanged: (value) {
              brandSelected = value;
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
            items: Get.find<FirebaseProductController>()
                .productBrands
                .map((items) {
              // if brand is selected
              return DropdownMenuItem<String>(
                child: Text(items),
                onTap: () async {
                  Get.find<FirebaseProductController>()
                      .searchByBrand(brand: items);
                  setState(() {
                    isSectionPart = false;
                    isSearchingByName = false;
                    controller.jumpTo(0.0);
                    brandSelected = items;
                  });
                },
                value: items,
              );
            }).toList()
              ..insert(
                0,
                // is nothing is selected
                DropdownMenuItem<String>(
                  child: Text(
                    AppLocalizations.of(context)!
                        .getTranslatedValue('brand')
                        .toString(),
                  ),
                  onTap: () {
                    setState(() {
                      Get.find<CategoryController>()
                          .changeSelectedValueSection(null);
                      idBrand = null;
                      categorySelected = null;
                      isSectionPart = true;
                      controller.jumpTo(0.0);
                      isSearchingByName = false;
                    });
                    // setState(() {
                    //   Get.find<CategoryController>().changeSelectedValue(null);
                    //   idBrand = null;
                    //   controller.jumpTo(0.0);
                    // });
                  },
                  value: null,
                ),
              ),
          ),
        );
      }),
    );
    //dropdown menu of CATEGORY items
    // Filter By CATEGORY
    Container buildSectionItems = Container(
      margin: const EdgeInsets.only(left: 29),
      padding: const EdgeInsets.only(left: 10, right: 20),
      width: MediaQuery.of(context).size.width * 0.37,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(236, 238, 244, 1),
        borderRadius: BorderRadius.circular(13),
      ),
      child: GetBuilder<FirebaseProductController>(builder: (category) {
        return Center(
          child: DropdownButton<String>(
            onTap: () {},
            value: categorySelected,
            onChanged: (value) {
              categorySelected = value;
            },
            underline: DropdownButtonHideUnderline(child: Container()),
            hint: Center(
              child: Text(
                // Section / Category
                AppLocalizations.of(context)!
                    .getTranslatedValue('items')
                    .toString(),
              ),
            ),
            isExpanded: true,
            items: Get.find<FirebaseProductController>()
                .productCategories
                .map((items) {
              // if Category is selected
              return DropdownMenuItem<String>(
                child: Text(items),
                onTap: () async {
                  Get.find<FirebaseProductController>()
                      .searchByCategory(category: items);
                  setState(() {
                    isSectionPart = false;
                    isSearchingByName = false;
                    controller.jumpTo(0.0);
                    categorySelected = items;
                  });
                },
                value: items,
              );
            }).toList()
              ..insert(
                0,
                // if nothing is selected
                DropdownMenuItem<String>(
                  child: Text(
                      // Section / Category
                      AppLocalizations.of(context)!
                          .getTranslatedValue('items')
                          .toString()),
                  onTap: () {
                    setState(() {
                      Get.find<CategoryController>()
                          .changeSelectedValueSection(null);
                      idBrand = null;
                      categorySelected = null;
                      isSectionPart = true;
                      controller.jumpTo(0.0);
                      isSearchingByName = false;
                    });
                  },
                  value: null,
                ),
              ),
          ),
        );
      }),
    );
    //search button
    InkWell searchButton = InkWell(
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
        // List<Product> mysearchResult =
        //     await ProductApi().search(nameProduct: valueOfSearch);
        //brandId: int.parse(valueOfSearch),categoryId: 16

        setState(() {
          // searchData = mysearchResult;
          isSectionPart = false;
        });
      },
    );
    // Filter By Text Field
    // void addSearchedForItemsToSearchedList(String item){
    // searchedList =  Get.find<FirebaseProductController>().productsList.where((element)
    //   => element.name.toLowerCase().startsWith(item)).toList();
    // }
    /*// Generate List For searching By Text Field */
    //
    void updateList(String value) {
      setState(() {
        displayList = Get.find<FirebaseProductController>()
            .productsList
            .where((element) => element.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }

    Widget productNameDropDown() {
      return Container(
          // margin: const EdgeInsets.only(left: 30, right: 0, top: 47),
          // padding: const EdgeInsets.only(left: 20, top: 25, bottom: 25),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.56,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13),
              bottomLeft: Radius.circular(13),
            ),
            color: Colors.white,
          ),
          child: Column(
              children: List.generate(
            // Get.find<FirebaseProductController>().productsList.length,
            displayList.length,
            (index) => GestureDetector(
              onTap: () {
                List<dynamic> myarguments = [
                  displayList[index]
                  // widget.productName,
                  // widget.id,
                  // widget.urlImage,
                ];
                Get.to(() => DetailsScreen(product: displayList[index]),
                    arguments: myarguments);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height * 0.1,
                // padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: ofWhiteColor,
                ),

                child: Row(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:
                          Image.network(
                              displayList[index].image,
                              errorBuilder: (_,__,___){
                                return Image.asset(LanguageEnglish(context) == 'English'
                                    ? 'images/no_image_english.png'
                                    : 'images/no_image_arabic.png');
                              },

                              fit: BoxFit.cover),
                        ),
                        padding: const EdgeInsets.all(10)),
                    Text(
                      // Get.find<FirebaseProductController>().productsList[index].name,
                      displayList[index].name,
                      style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: textPrimaryColor)),
                    ),
                  ],
                ),
              ),
            ),
          )));
    }
    // Container buildFilterItems = Container(
    //   margin: const EdgeInsets.only(left: 30, right: 0, top: 47),
    //   padding: const EdgeInsets.only(left: 20, top: 25, bottom: 25),
    //   width: MediaQuery.of(context).size.width * 0.45,
    //   height: MediaQuery.of(context).size.height * 0.1,
    //   decoration: const BoxDecoration(
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(13),
    //       bottomLeft: Radius.circular(13),
    //     ),
    //     color:
    //     Color.fromRGBO(236, 238, 244, 1),
    //   ),
    //   child:Column(
    //     children: List.generate(
    //         Get.find<FirebaseProductController>().productsList.length,
    //             (index) => Container(
    //                     padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(14),
    //                       color: Colors.black,
    //                     ),
    //                     width: MediaQuery.of(context).size.width * 0.88,
    //                     height: MediaQuery.of(context).size.height * 0.07,
    //                     child: Text(
    //                       Get.find<FirebaseProductController>().productsList[index].name,
    //                       style: GoogleFonts.montserrat(
    //                     textStyle:
    //                     const  TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color:  Color.fromRGBO(34, 53, 53, 1)))
    //                       ,
    //                     ),
    //                   ),
    //
    //
    //     )
    //   )
    //
    //
    // );

    Widget buildSearchPart(){
      return AnimatedContainer(
        duration: const Duration(milliseconds: 2000),
        alignment: Alignment.topCenter,
        height: closeSearchPart?0: MediaQuery.of(context).size.height * 0.3,

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          // margin: EdgeInsets.only(top:  MediaQuery.of(context).size.height*0),
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
                      width: MediaQuery.of(context).size.width *
                          0.45,
                      height:
                      MediaQuery.of(context).size.height *
                          0.1,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13),
                          bottomLeft: Radius.circular(13),
                        ),
                        color: Color.fromRGBO(236, 238, 244, 1),
                      ),
                      child: TextField(
                        onTap: () {
                          debugPrint('clicked');
                          setState(() {
                            controller
                                .jumpTo(142.33333333333363);
                            isSearchingByName = true;
                            isSectionPart = false;

                            setState(() {});
                          });
                          productNameDropDown();
                        },
                        onChanged: (text) {
                          // addSearchedForItemsToSearchedList(text);
                          updateList(text);
                          setState(() {
                            valueOfSearch = text;
                          });
                        },
                        cursorColor: textPrimaryColor,
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
                    searchButton //the search button
                  ],
                ),
              )
                  : Center(
                child: Row(children: [
                  searchButton,
                  customScannerButtom(),
                  Container(
                    margin: const EdgeInsets.only(
                        right: 30, top: 47),
                    padding: const EdgeInsets.only(
                        left: 75, top: 25, bottom: 25),
                    width: MediaQuery.of(context).size.width *
                        0.45,
                    height: MediaQuery.of(context).size.height *
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
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
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        controller: controller,
        child: Column(
          children: [
            customAppBar(context),//appbar
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            buildSearchPart(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            isSectionPart
                ? sectionsPart(context) //this will show all the sections of the application
                : isSearchingByName
                ? productNameDropDown()
                : resultOfSearch(context, result: Get.find<FirebaseProductController>().searchResultList),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(1),
    );

  }


}
