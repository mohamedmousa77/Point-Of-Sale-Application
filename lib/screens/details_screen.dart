import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pos_application/services/product_service.dart';
import 'package:pos_application/widget/change_language_style.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../database/note.dart';
import '../database/notes_database.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<Car> carproducts = [];
  Future refreshCar() async {
    carproducts = await NotesDataBase.instance.readAllCarProducts();
    setState(() {});
  }

  Future addProductToCar(String productName, String price, String image) async {
    if (carproducts.isEmpty) {
      addproductToCar(productName, price, image);
    } else {
      bool found = false;
      for (Car car in carproducts) {
        if (car.title == productName) {
          updateProductToCar(car.id!);
          found = true;
          break;
        }
      }
      if (!found) {
        addproductToCar(productName, price, image);
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

  Future addproductToCar(
      String productName, String price, String urlImage) async {
    final carproduct = Car(
      id: 2,
      title: productName,
      count: 1,
      price: double.parse(price.toString()),
      ImageUrl: urlImage,
    );
    await NotesDataBase.instance.createCar(carproduct);
    refreshCar();
  }

  @override
  void didChangeDependencies() {
    refreshCar();
    super.didChangeDependencies();
  }

  void _showToast() {
    Fluttertoast.showToast(
        msg: AppLocalizations.of(context)!
            .getTranslatedValue('add_succe')
            .toString(),
        fontSize: 18);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          FutureBuilder(
              future:
                  ProductApi().search(nameProduct: Get.arguments[0].toString()),
              builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )),
                    child: Row(
                      children: [
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
                        Container(
                            padding: EdgeInsets.only(
                                top: 30,
                                left: LanguageEnglish(context) == 'English'
                                    ? 40
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
                        GestureDetector(
                          onTap: () async {
                            int id = Get.arguments[1];
                            showDialog(
                              context: context,
                              builder: (_) => const Center(
                                  child: CircularProgressIndicator()),
                              barrierDismissible: false,
                            );
                            String price =
                                await ProductApi().getPriceOfTheProduct(id);
                            Navigator.pop(context);
                            addProductToCar(
                              snapshot.data![0].name,
                              price,
                              snapshot.data![0].image,
                            );
                            _showToast();
                          },
                          child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.only(
                                top: 20, left: 40, bottom: 15),
                            child: SvgPicture.asset(
                              'images/car.svg',
                              color: const Color.fromRGBO(34, 53, 53, 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: FutureBuilder(
              future:
                  ProductApi().search(nameProduct: Get.arguments[0].toString()),
              builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                  snapshot.hasData
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40)),
                                child: Image.network(
                                  snapshot.data![0].image,
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
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.03),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Text(
                                        snapshot.data![0].name,
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
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 30, bottom: 20, right: 20, left: 20),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data![0].productDescription,
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
                              Container(
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
                                      // print(Get.arguments[1]);
                                      int id = Get.arguments[1];
                                      showDialog(
                                        context: context,
                                        builder: (_) => const Center(
                                            child: CircularProgressIndicator()),
                                        barrierDismissible: false,
                                      );
                                      String price = await ProductApi()
                                          .getPriceOfTheProduct(id);
                                      Navigator.pop(context);
                                      addProductToCar(
                                        snapshot.data![0].name,
                                        price,
                                        snapshot.data![0].image,
                                      );
                                      _showToast();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()),
            ),
          ),

          //   //////////////////////////////////////////////////////////////////
          //   //////////////////////////////////////////////////////////////////
          //   //////////////////////////////////////////////////////////////////
          // ),
        ],
      ),
    );
  }
}
