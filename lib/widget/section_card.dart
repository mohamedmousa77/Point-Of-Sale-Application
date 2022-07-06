// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pos_application/controllers/category_brand_controller.dart';
// import 'package:pos_application/controllers/firebase_product_controller.dart';
// import 'package:pos_application/models/firebase_product_model.dart';
// import 'package:pos_application/models/pro.dart';
// import 'package:pos_application/models/product_model.dart';
// import 'package:pos_application/services/product_service.dart';
//
// import '../classes/localization_const.dart';
// import '../screens/sections.dart';
// import '../widget/change_language_style.dart';
//
// class SectionCardHomeScreen extends StatefulWidget {
//   // final int value;
//   final String nameCategory;
//   // final String urlImage;
//   final int index;
//
//   // final int id;
//   SectionCardHomeScreen(
//       {required this.index, required this.nameCategory}
//       // , this.id
//       );
//
//   @override
//   State<SectionCardHomeScreen> createState() => _sectionCardState();
// }
//
// class _sectionCardState extends State<SectionCardHomeScreen> {
//   // final int value;
//   // final String nameCategory;
//   // final String urlImage;
//   // // final int id;
//   // _sectionCardState(this.value, this.nameCategory,
//   //     // this.id,
//   //     this.urlImage);
//   // List<Product> productList = [];
//   List<FirebaseProduct> productList = [];
//
//   Future<void> getProducts() async {
//     // List<Product> myproduct = await ProductApi().search(
//     //     // categoryId: id,
//     //     brandId: Get.find<CategoryController>().selectedValue);
//     // setState(() {
//     //   productList = myproduct;
//     // });
//     debugPrint('in SectionCardHomeScreen...........??????????');
//     List<FirebaseProduct> myProductList =
//         await Get.find<FirebaseProductController>()
//             .searchByCategory(category: widget.nameCategory);
//     setState(() {
//       productList = myProductList;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       onPressed: () async {
//         showDialog(
//           context: context,
//           builder: (_) => const Center(child: CircularProgressIndicator()),
//           barrierDismissible: false,
//         );
//         await getProducts();
//
//         Navigator.pop(context);
//         if (productList.isNotEmpty) {
//           // var argumentsOfSectionPage = [
//           //   // widget.value,
//           //   widget.nameCategory
//           //   ,Get.find<FirebaseProductController>().searchResultList /* , productList*/
//           // ];
//           Get.to(
//             () => Section(
//                 categoryName: widget.nameCategory,
//                 product: Get.find<FirebaseProductController>().searchResultList),
//             // arguments: argumentsOfSectionPage
//           );
//         } else {
//           // var argumentsOfSectionPage = [
//           //   widget.value,
//           //   // widget.id,
//           //   widget.nameCategory,
//           //   "No product"
//           // ];
//           Get.to(
//             () => Section(
//                 categoryName: widget.nameCategory,
//                 product:
//                     Get.find<FirebaseProductController>().searchResultList),
//             // arguments: argumentsOfSectionPage
//           );
//         }
//       },
//       child: Container(
//           height: MediaQuery.of(context).size.height * 0.19,
//           width: MediaQuery.of(context).size.width * 0.40,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: const Color.fromRGBO(248, 248, 248, 1),
//           ),
//           child: Column(
//             children: [
//               // productList[widget.index].image.isEmpty
//               //     ?
//           Container(
//                       height: MediaQuery.of(context).size.height * 0.1,
//                       width: MediaQuery.of(context).size.width * 0.40,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50)),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.asset(
//                          LanguageEnglish(context) == 'English'
//                                   ? 'images/no_image_english.png'
//                                   : 'images/no_image_arabic.png',
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       margin: const EdgeInsets.only(bottom: 10),
//                     ),
//                   // : Container(
//                   //     height: MediaQuery.of(context).size.height * 0.1,
//                   //     width: MediaQuery.of(context).size.width * 0.40,
//                   //     decoration: BoxDecoration(
//                   //         borderRadius: BorderRadius.circular(50)),
//                   //     child: ClipRRect(
//                   //       borderRadius: BorderRadius.circular(10),
//                   //       child: Image.network(productList[widget.index].image, fit: BoxFit.cover,),
//                   //     ),
//                   //     margin: const EdgeInsets.only(bottom: 10),
//                   //   ),
//               Container(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Text(
//                     widget.nameCategory.length > 15
//                         ? widget.nameCategory
//                             .replaceRange(10, widget.nameCategory.length, '...')
//                         : widget.nameCategory,
//                     style: getcustomertextStyle(context, 14, FontWeight.w500,
//                         const Color.fromRGBO(34, 53, 53, 1))),
//               ),
//             ],
//           )),
//     );
//   }
// }
