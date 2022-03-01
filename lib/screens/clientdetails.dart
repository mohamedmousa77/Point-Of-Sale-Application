import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pos_application/controllers/car_controller.dart';
import 'package:pos_application/database/note.dart';
import 'package:pos_application/database/notes_database.dart';
import 'package:pos_application/home_page.dart';
import 'package:pos_application/screens/customer_search_result.dart';
import '../screens/print_receipt.dart';

import '../controllers/user_controller.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../services/customer_service.dart';
import '../widget/change_language_style.dart';
import '../widget/custom_appbar.dart';
import '../widget/paymentmethod.dart';
import '../services/tansaction_order_service.dart';

class ClientDetails extends StatefulWidget {
  const ClientDetails({Key? key}) : super(key: key);

  @override
  _ClientDetailsState createState() => _ClientDetailsState();
}

class _ClientDetailsState extends State<ClientDetails> {
  bool isSecondType = false;
  bool isFirstType = false;
  bool isSearched = false;

  // Customer Type
  bool isOpend = false;
  late OverlayEntry floating;

  String type = 'customer_type';

  OverlayEntry _create() {
    return OverlayEntry(builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () {
              isSecondType = false;
              isFirstType = false;
              floating.remove();
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Positioned(
            top: 300,
            left: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              // child: DropDown(),
              child: CustomerTypeDropDown(),
            ),
          )
        ],
      );
    });
  }

  Widget CustomerTypeDropDown() {
    return Column(
      children: [
        Material(
          color: Colors.black.withOpacity(0.001),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.only(top: 10, right: 220),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                      color: Color.fromRGBO(236, 238, 244, 1),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          type = 'first_type';
                          isFirstType = true;
                          isSecondType = false;
                        });
                        isOpend = !isOpend;
                        floating.remove();
                      },
                      child: Text(
                        // 'Second Type'
                        AppLocalizations.of(context)!
                            .getTranslatedValue('first_type')
                            .toString(),
                        style: getcustomertextStyle(
                            context,
                            15,
                            FontWeight.w500,
                            const Color.fromRGBO(34, 53, 53, 1)),
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding:
                        const EdgeInsets.only(top: 10, right: 195, bottom: 20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                      ),
                      color: Color.fromRGBO(236, 238, 244, 1),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          type = 'second_type';
                          isSecondType = true;
                          isFirstType = false;
                        });
                        isOpend = !isOpend;
                        floating.remove();
                      },
                      child: Text(
                        // 'Second Type'
                        AppLocalizations.of(context)!
                            .getTranslatedValue('second_type')
                            .toString(),
                        style: getcustomertextStyle(
                            context,
                            15,
                            FontWeight.w500,
                            const Color.fromRGBO(34, 53, 53, 1)),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Customer Type
  String customerName = "";
  String massage = "";
  String addCustomerName = "";
  String addCustomerPhoneNumber = "";
  String addCustomerVat = "";
  String addCustomerAddress = "";
  List<Car> carproducts = [];
  List<Map<String ,String>> CustomersName =[];

  Future refreshCar() async {
    carproducts = await NotesDataBase.instance.readAllCarProducts();
  }
  @override
  void didChangeDependencies() {
    refreshCar();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            Container(
              padding: const EdgeInsets.only(left: 80, top: 15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  )),
              child: Text(
                  AppLocalizations.of(context)!
                      .getTranslatedValue('customer_data_text')
                      .toString(),
                  style: getcustomertextStyle(context, 28, FontWeight.bold,
                      const Color.fromRGBO(34, 53, 53, 1))),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isSecondType = false;
                  isFirstType = false;
                });
                floating = _create();
                Overlay.of(context)!.insert(floating);
                isOpend = !isOpend;
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                // 0.725
                height: (isSecondType || isFirstType)
                    ? MediaQuery.of(context).size.height * 0.1
                    : MediaQuery.of(context).size.height * 0.725,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          padding: const EdgeInsets.only(left: 10, right: 20),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.09,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(236, 238, 244, 1),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!
                                      .getTranslatedValue(type)
                                      .toString(),
                                  style: getcustomertextStyle(
                                      context,
                                      15,
                                      FontWeight.w500,
                                      const Color.fromRGBO(34, 53, 53, 1)),
                                ),
                                const Spacer(),
                                SvgPicture.asset('images/arrow-down.svg',
                                    color: const Color.fromRGBO(34, 53, 53, 1))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            isFirstType
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.6,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                // padding: EdgeInsets.only(left: 10, right: 20),
                                width: MediaQuery.of(context).size.width * 0.88,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                decoration: const BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(92, 145, 246, 0.11),
                                      offset: Offset(0, 8),
                                      blurRadius: 28.0),
                                ]),
                                child: RaisedButton(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .getTranslatedValue(
                                            'print_invoice_text')
                                        .toString(),
                                    style: getcustomertextStyle(context, 20,
                                        FontWeight.w400, Colors.white),
                                  ),
                                  color: const Color.fromRGBO(210, 140, 84, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  onPressed: () async {
                                    //added new
                                    Get.find<UserController>().currentUser.businessId;
                                    OrderApi orderApi = OrderApi();
                                    // List<Car> carproducts = await NotesDataBase.instance.readAllCarProducts();
                                   int transactionId = await orderApi.addOrderTransaction(
                                            totalBeforeTax: Get.find<CarController>().totalAmount.value,
                                            products: carproducts).catchError((error) {});
                                    Printer.firstType(carproducts,transactionId.toString(),context);
                                    await NotesDataBase.instance.clearCar();
                                   navigator!.pushReplacement(MaterialPageRoute(builder: (_) => MyHomePage()));
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
            isSecondType
                ? LanguageEnglish(context) == 'English'
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Material(
                          color: Colors.black.withOpacity(0.01),
                          child: ListView(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 20),
                                    width: MediaQuery.of(context).size.width *
                                        0.72,
                                    height: MediaQuery.of(context).size.height *
                                        0.09,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(13),
                                          bottomLeft: Radius.circular(13),
                                        ),
                                        color: Color.fromRGBO(236, 238, 244, 1)
                                      // color:Colors.orange
                                    ),
                                    child: TextField(
                                      onChanged: (text) {
                                        setState(() {
                                          addCustomerName = text;
                                        });
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: AppLocalizations.of(context)!
                                            .getTranslatedValue('customer_name')
                                            .toString(),
                                        hintStyle: getcustomertextStyle(
                                            context,
                                            15,
                                            FontWeight.normal,
                                            const Color.fromRGBO(
                                                196, 198, 204, 1)),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.16,
                                    height: MediaQuery.of(context).size.height *
                                        0.09,
                                    // margin:const EdgeInsets.only(right: 10),
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        top: 15,
                                        right: 20,
                                        bottom: 25),
                                    decoration: const BoxDecoration(
                                      // color:Colors.red,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(14),
                                          topRight: Radius.circular(14),
                                        ),
                                        color:
                                        Color.fromRGBO(236, 238, 244, 1)),
                                    child: SvgPicture.asset(
                                        'images/search-1.svg',
                                        color: const Color.fromRGBO(
                                            196, 198, 204, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    width: MediaQuery.of(context).size.width *
                                        0.88,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    decoration: const BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              92, 145, 246, 0.11),
                                          offset: Offset(0, 8),
                                          blurRadius: 28.0),
                                    ]),
                                    child: RaisedButton(
                                      child: Text(
                                        'Search',
                                        // AppLocalizations.of(context)!
                                        //     .getTranslatedValue(
                                        //     'print_invoice_text')
                                        //     .toString(),
                                        style: getcustomertextStyle(context, 20,
                                            FontWeight.w400, Colors.white),
                                      ),
                                      color: const Color.fromRGBO(210, 140, 84, 1),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
                                      ),
                                      onPressed: ()async {
                                       CustomersName = await CustomerApi().searchByName(addCustomerName);
                                        Get.to(SearchResult(CustomersName));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.6,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Material(
                          color: Colors.black.withOpacity(0.01),
                          child: ListView(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.16,
                                    height: MediaQuery.of(context).size.height * 0.09,
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        top: 15,
                                        right: 20,
                                        bottom: 25),
                                    margin: const EdgeInsets.only(left: 10),
                                    decoration: const BoxDecoration(
                                        // color:Colors.red,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(14),
                                          topLeft: Radius.circular(14),
                                        ),
                                        color: Color.fromRGBO(236, 238, 244, 1)
                                    ),
                                    child: SvgPicture.asset(
                                        'images/search-1.svg',
                                        color: const Color.fromRGBO(
                                            196, 198, 204, 1)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 150, bottom: 20),
                                    width: MediaQuery.of(context).size.width *
                                        0.72,
                                    height: MediaQuery.of(context).size.height *
                                        0.09,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(13),
                                          bottomRight: Radius.circular(13),
                                        ),
                                        color: Color.fromRGBO(236, 238, 244, 1)
                                        // color:Colors.orange
                                        ),
                                    child: TextField(
                                      textDirection: TextDirection.rtl,
                                      onChanged: (text) {
                                        setState(() {
                                          addCustomerName = text;
                                        });
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: AppLocalizations.of(context)!
                                            .getTranslatedValue('customer_name')
                                            .toString(),
                                        hintStyle: getcustomertextStyle(
                                            context,
                                            15,
                                            FontWeight.normal,
                                            const Color.fromRGBO(
                                                196, 198, 204, 1)),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    width: MediaQuery.of(context).size.width *
                                        0.88,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    decoration: const BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              92, 145, 246, 0.11),
                                          offset: Offset(0, 8),
                                          blurRadius: 28.0),
                                    ]),
                                    child: RaisedButton(
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .getTranslatedValue('search').toString(),
                                        style: getcustomertextStyle(context, 20, FontWeight.w400, Colors.white),
                                      ),
                                      color: const Color.fromRGBO(210, 140, 84, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      onPressed: () async {
                                        CustomersName =await CustomerApi().searchByName(addCustomerName);
                                        Get.to(SearchResult(CustomersName));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              //the text of validation
                              // Center(child: Text(massage)),
                            ],
                          ),
                        ),
                      )
                : Container(),

          ],
        ),
      ),
    );
  }
}
