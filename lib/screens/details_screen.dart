import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pos_application/models/firebase_product_model.dart';
import 'package:pos_application/services/product_service.dart';
import 'package:pos_application/widget/change_language_style.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../controllers/car_controller.dart';
import '../database/note.dart';
import '../database/notes_database.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  final FirebaseProduct product;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // List<Car> carproducts = [];
  // Future refreshCar() async {
  //   carproducts = await NotesDataBase.instance.readAllCarProducts();
  //   setState(() {});
  // }
  //
  // Future addProductToCar(String productName, String price, String image) async {
  //   if (carproducts.isEmpty) {
  //     addproductToCar(productName, price, image);
  //   } else {
  //     bool found = false;
  //     for (Car car in carproducts) {
  //       if (car.title == productName) {
  //         updateProductToCar(car.id!);
  //         found = true;
  //         break;
  //       }
  //     }
  //     if (!found) {
  //       addproductToCar(productName, price, image);
  //     }
  //   }
  // }
  //
  // Future updateProductToCar(String ID) async {
  //   Car carProduct = carproducts.firstWhere((element) => ID == element.id);
  //   carProduct = carProduct.copyCar(count: carProduct.count + 1
  //       // : carProduct.count == 1 ?  await NotesDataBase.instance.deleteCar(carProduct.id!) : carProduct.count-1 ,
  //       );
  //   await NotesDataBase.instance.updateCar(carProduct);
  //   refreshCar();
  // }
  //
  // Future addproductToCar(String productName, String price, String urlImage) async {
  //   final carproduct = Car(
  //     id: '2',
  //     title: productName,
  //     count: 1,
  //     price: double.parse(price.toString()),
  //     ImageUrl: urlImage,
  //   );
  //   await NotesDataBase.instance.createCar(carproduct);
  //   refreshCar();
  // }
  //
  // @override
  // void didChangeDependencies() {
  //   refreshCar();
  //   super.didChangeDependencies();
  // }
  //
  // void _showToast() {
  //   Fluttertoast.showToast(
  //       msg: AppLocalizations.of(context)!
  //           .getTranslatedValue('add_succe')
  //           .toString(),
  //       fontSize: 18);
  // }
  void showToast() {
    Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!
            .getTranslatedValue('add_succe')
            .toString(),
        fontSize: 18);
  }


  Widget buildBody(){
    return SingleChildScrollView(
      child: Column(
        children: [
          // app Bar
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.02,
            ),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
            child: Row(
              children: [
                // arrow back icon
                Container(
                  padding: const EdgeInsets.only(
                      left: 10, top: 20, bottom: 15),
                  child: SizedBox(
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_backspace,
                          color: Color.fromRGBO(34, 53, 53, 1)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                // app name
                Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height*0.02,
                        left: LanguageEnglish(context) == 'English'
                            ? MediaQuery.of(context).size.width*0.15
                            : 55,
                        bottom: 15),
                    child: Text(
                        AppLocalizations.of(context)!
                            .getTranslatedValue('appbarTitle')
                            .toString(),
                        style: getcustomertextStyle(
                            context,
                            20,
                            FontWeight.bold,
                            const Color.fromRGBO(34, 53, 53, 1)))),
                // car icon
                GestureDetector(
                  onTap: () async {
                    // int id = Get.arguments[1];
                    Get.find<CarController>().addProductToCar(widget.product);
                    showToast();
                    // showDialog(
                    //   context: context,
                    //   builder: (_) => const Center(
                    //       child: CircularProgressIndicator()),
                    //   barrierDismissible: false,
                    // );
                    // String price =
                    //     await ProductApi().getPriceOfTheProduct(id.toString());
                    // Navigator.pop(context);

                    // addProductToCar(
                    //   snapshot.data![0].name,
                    //   price,
                    //   snapshot.data![0].image,
                    // );
                    // _showToast();
                  },
                  child: Container(
                    color: Colors.white,
                    padding:  EdgeInsets.only(
                        top: MediaQuery.of(context).size.height*0.05,
                        left: MediaQuery.of(context).size.width*0.25,
                        bottom: MediaQuery.of(context).size.width*0.1),
                    child: SvgPicture.asset(
                      'images/car.svg',
                      color: const Color.fromRGBO(34, 53, 53, 1),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          // Body
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  // product image
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height:
                    MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40)),
                    child: Image.network(
                      widget.product.image,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) {
                        return LanguageEnglish(context) == 'English'
                            ? Image.asset(
                            'images/no_image_english.png')
                            : Image.asset(
                            'images/no_image_arabic.png');
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  // product name
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10),
                          child: Text(
                            widget.product.name,
                            style: getcustomertextStyle(
                              context,
                              24,
                              FontWeight.bold,
                              const Color.fromRGBO(34, 53, 53, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // product description
                  Container(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 20, right: 20, left: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                              widget.product.productDescription,
                              style: getcustomertextStyle(
                                  context,
                                  19,
                                  FontWeight.normal,
                                  const Color.fromRGBO(
                                      34, 53, 53, 1)))
                        ],
                      ),
                    ),
                  ),
                  // add Button
                  isExist
                      ?Container(
                       // height: MediaQuery.of(context).size.height * 0.08,
                       //  width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.1),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width * 0.12,
                            width: MediaQuery.of(context).size.width*0.12,
                            child: RaisedButton(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: const Icon(
                                Icons.minimize,
                                color: Colors.white,
                                size: 35,

                              ),
                              color: const Color.fromRGBO(210, 140, 84, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              onPressed: () async {
                                await  Get.find<CarController>().
                                updateProductToCar(
                                    Get.find<CarController>().carProductsList[index].id, false);
                                // setState(() {
                                //  element.count == 1 ?  count = element.count -1 : NotesDataBase.instance.deleteCar(element.id) ;
                                //   isChanging = true;
                                // });
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 7, left: 10),
                          margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.2,
                              right: MediaQuery.of(context).size.width*0.2
                          ),
                          child: Text(
                              '${Get.find<CarController>().carProductsList[index].count}',
                              style: getcustomertextStyle(
                                  context,
                                  25,
                                  FontWeight.bold,
                                  const Color.fromRGBO(34, 53, 53, 1))),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          // margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.08),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width * 0.12,
                            width: MediaQuery.of(context).size.width*0.12,
                            child: RaisedButton(
                              padding: const EdgeInsets.only(top: 2),
                              child: const Icon(Icons.add,
                                  color: Colors.white, size: 35),
                              color: const Color.fromRGBO(210, 140, 84, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              onPressed: () async {
                                // await  Get.find<CarController>().updateProductToCar(product.id, true);
                                await  Get.find<CarController>().updateProductToCar
                                  (Get.find<CarController>().carProductsList[index].id, true);

                                // setState(() {
                                //
                                //   count = element.count +1 ;
                                //   isChanging = true;
                                // });

                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                       : Container(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      height:
                      MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                        child: Text(
                            AppLocalizations.of(context)!
                                .getTranslatedValue('add_to_cart')
                                .toString(),
                            style: getcustomertextStyle(
                                context,
                                20,
                                FontWeight.normal,
                                const Color.fromRGBO(
                                    255, 255, 255, 1))),
                        color:
                        const Color.fromRGBO(210, 140, 84, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(16)),
                        onPressed: () async {
                          showToast();
                          Get.find<CarController>().addProductToCar(widget.product);

                          // // print(Get.arguments[1]);
                          // int id = Get.arguments[1];
                          // showDialog(
                          //   context: context,
                          //   builder: (_) => const Center(
                          //       child: CircularProgressIndicator()),
                          //   barrierDismissible: false,
                          // );
                          // String price = await ProductApi()
                          //     .getPriceOfTheProduct(id.toString());
                          // Navigator.pop(context);
                          // addProductToCar(
                          //   snapshot.data![0].name,
                          //   price,
                          //   snapshot.data![0].image,
                          // );
                          // _showToast();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // child: FutureBuilder(
            //   future:
            //       ProductApi().search(nameProduct: Get.arguments[0].toString()),
            //   builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
            //       snapshot.hasData
            //           ? SingleChildScrollView(
            //               child: Column(
            //                 children: [
            //                   SizedBox(
            //                       height: MediaQuery.of(context).size.height *
            //                           0.02),
            //                   Container(
            //                     width: MediaQuery.of(context).size.width,
            //                     height:
            //                         MediaQuery.of(context).size.height * 0.3,
            //                     decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(40)),
            //                     child: Image.network(
            //                       snapshot.data![0].image,
            //                       fit: BoxFit.contain,
            //                       errorBuilder: (_, __, ___) {
            //                         return LanguageEnglish(context) == 'English'
            //                             ? Image.asset(
            //                                 'images/no_image_english.png')
            //                             : Image.asset(
            //                                 'images/no_image_arabic.png');
            //                       },
            //                     ),
            //                   ),
            //                   SizedBox(
            //                       height: MediaQuery.of(context).size.height *
            //                           0.03),
            //                   Container(
            //                     child: Row(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         Container(
            //                           padding: const EdgeInsets.only(
            //                               left: 10, right: 10),
            //                           child: Text(
            //                             snapshot.data![0].name,
            //                             style: getcustomertextStyle(
            //                               context,
            //                               24,
            //                               FontWeight.bold,
            //                               const Color.fromRGBO(34, 53, 53, 1),
            //                             ),
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   Container(
            //                     padding: const EdgeInsets.only(
            //                         top: 30, bottom: 20, right: 20, left: 20),
            //                     child: SingleChildScrollView(
            //                       child: Column(
            //                         children: [
            //                           Text(snapshot.data![0].productDescription,
            //                               style: getcustomertextStyle(
            //                                   context,
            //                                   19,
            //                                   FontWeight.normal,
            //                                   const Color.fromRGBO(
            //                                       34, 53, 53, 1)))
            //                         ],
            //                       ),
            //                     ),
            //                   ),
            //                   Container(
            //                     padding: const EdgeInsets.all(20),
            //                     child: SizedBox(
            //                       height:
            //                           MediaQuery.of(context).size.height * 0.08,
            //                       width: MediaQuery.of(context).size.width,
            //                       child: RaisedButton(
            //                         child: Text(
            //                             AppLocalizations.of(context)!
            //                                 .getTranslatedValue('add_to_cart')
            //                                 .toString(),
            //                             style: getcustomertextStyle(
            //                                 context,
            //                                 20,
            //                                 FontWeight.normal,
            //                                 const Color.fromRGBO(
            //                                     255, 255, 255, 1))),
            //                         color:
            //                             const Color.fromRGBO(210, 140, 84, 1),
            //                         shape: RoundedRectangleBorder(
            //                             borderRadius:
            //                                 BorderRadius.circular(16)),
            //                         onPressed: () async {
            //                           // print(Get.arguments[1]);
            //                           int id = Get.arguments[1];
            //                           showDialog(
            //                             context: context,
            //                             builder: (_) => const Center(
            //                                 child: CircularProgressIndicator()),
            //                             barrierDismissible: false,
            //                           );
            //                           String price = await ProductApi()
            //                               .getPriceOfTheProduct(id.toString());
            //                           Navigator.pop(context);
            //                           addProductToCar(
            //                             snapshot.data![0].name,
            //                             price,
            //                             snapshot.data![0].image,
            //                           );
            //                           _showToast();
            //                         },
            //                       ),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             )
            //           : const Center(child: CircularProgressIndicator()),
            // ),
          ),

        ],
      ),
    );
  }
  bool isExist =false;
  int index = 0 ;
  void checkIsProductExistInCar(){
    if(Get.find<CarController>().carProductsList.isNotEmpty){
      debugPrint('carProductsList isNotEmpty');
      for(var productCar in Get.find<CarController>().carProductsList){
        // for(var product in widget.product){
          if(productCar.title == widget.product.name){
            setState(() {
              isExist = true;
              index =   Get.find<CarController>().carProductsList.indexWhere((element)
              => element.title == widget.product.name);
            });
            debugPrint('product Exist >>>>>>>>>  '+isExist.toString());
            break;
          }else{
            setState(() {
              isExist = false;
            });
            debugPrint('product Exist >>>>>>>>>  '+isExist.toString());
          }
        // }

      }

      debugPrint('product Exist >>>>>>>>>  '+isExist.toString());
    }
  }

  @override
  void initState() {
    checkIsProductExistInCar();
    Get.find<CarController>().addListener(() {setState(() {});});
    super.initState();
  }
  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   Get.find<CarController>().removeListener(() { });
  //   super.didChangeDependencies();
  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   Get.find<CarController>().removeListener(() {});
  //
  //   super.dispose();
  // }
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody()
      // ListView(
      //   children: [
      //     // FutureBuilder(
      //     //     // future: ProductApi().search(nameProduct: Get.arguments[0].toString()),
      //     //     builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) => Container(
      //     //           width: MediaQuery.of(context).size.width,
      //     //           height: MediaQuery.of(context).size.height * 0.1,
      //     //           decoration: const BoxDecoration(
      //     //               color: Colors.white,
      //     //               borderRadius: BorderRadius.only(
      //     //                 bottomLeft: Radius.circular(40),
      //     //                 bottomRight: Radius.circular(40),
      //     //               )),
      //     //           child: Row(
      //     //             children: [
      //     //               Container(
      //     //                 padding: const EdgeInsets.only(
      //     //                     left: 10, top: 20, bottom: 15),
      //     //                 child: SizedBox(
      //     //                   child: IconButton(
      //     //                     icon: const Icon(Icons.keyboard_backspace,
      //     //                         color: Color.fromRGBO(34, 53, 53, 1)),
      //     //                     onPressed: () => Navigator.pop(context),
      //     //                   ),
      //     //                 ),
      //     //               ),
      //     //               Container(
      //     //                   padding: EdgeInsets.only(
      //     //                       top: 30,
      //     //                       left: LanguageEnglish(context) == 'English'
      //     //                           ? 40
      //     //                           : 55,
      //     //                       bottom: 15),
      //     //                   child: Text(
      //     //                       AppLocalizations.of(context)!
      //     //                           .getTranslatedValue('appbarTitle')
      //     //                           .toString(),
      //     //                       style: getcustomertextStyle(
      //     //                           context,
      //     //                           20,
      //     //                           FontWeight.bold,
      //     //                           const Color.fromRGBO(34, 53, 53, 1)))),
      //     //               GestureDetector(
      //     //                 onTap: () async {
      //     //                   // int id = Get.arguments[1];
      //     //                   showDialog(
      //     //                     context: context,
      //     //                     builder: (_) => const Center(
      //     //                         child: CircularProgressIndicator()),
      //     //                     barrierDismissible: false,
      //     //                   );
      //     //                   // String price =
      //     //                   //     await ProductApi().getPriceOfTheProduct(id.toString());
      //     //                   // Navigator.pop(context);
      //     //                   Get.find<CarController>().addProductToCar(widget.product);
      //     //                   // addProductToCar(
      //     //                   //   snapshot.data![0].name,
      //     //                   //   price,
      //     //                   //   snapshot.data![0].image,
      //     //                   // );
      //     //                   // _showToast();
      //     //                 },
      //     //                 child: Container(
      //     //                   color: Colors.white,
      //     //                   padding: const EdgeInsets.only(
      //     //                       top: 20, left: 40, bottom: 15),
      //     //                   child: SvgPicture.asset(
      //     //                     'images/car.svg',
      //     //                     color: const Color.fromRGBO(34, 53, 53, 1),
      //     //                   ),
      //     //                 ),
      //     //               )
      //     //             ],
      //     //           ),
      //     //         )),
      //     // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      //
      //
      //     //   //////////////////////////////////////////////////////////////////
      //     //   //////////////////////////////////////////////////////////////////
      //     //   //////////////////////////////////////////////////////////////////
      //     // ),
      //   ],
      // ),
    );
  }
}
