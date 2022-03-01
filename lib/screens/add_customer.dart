import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pos_application/classes/app_localizations.dart';
import 'package:pos_application/classes/localization_const.dart';
import 'package:pos_application/controllers/car_controller.dart';
import 'package:pos_application/database/note.dart';
import 'package:pos_application/database/notes_database.dart';
import 'package:pos_application/screens/print_receipt.dart';
import 'package:pos_application/services/customer_service.dart';
import 'package:pos_application/services/tansaction_order_service.dart';
import 'package:pos_application/widget/change_language_style.dart';
import 'package:pos_application/widget/custom_appbar.dart';
import 'package:pos_application/widget/payment_method.dart';

import '../home_page.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  String customerName = "";
  String massage = "";
  String addCustomerName = "";
  String addCustomerPhoneNumber = "";
  String addCustomerVat = "";
  String addCustomerAddress = "";
  List<Car> carproducts = [];

  Future refreshCar() async {
    carproducts = await NotesDataBase.instance.readAllCarProducts();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    refreshCar();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(context),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
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
          LanguageEnglish(context) == 'English'
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
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
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 20),
                              width: MediaQuery.of(context).size.width * 0.72,
                              height: MediaQuery.of(context).size.height * 0.09,
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
                                      const Color.fromRGBO(196, 198, 204, 1)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.16,
                              height: MediaQuery.of(context).size.height * 0.09,
                              // margin:const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.only(
                                  left: 20, top: 15, right: 20, bottom: 25),
                              decoration: const BoxDecoration(
                                  // color:Colors.red,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                    topRight: Radius.circular(14),
                                  ),
                                  color: Color.fromRGBO(236, 238, 244, 1)),
                              child: SvgPicture.asset('images/search-1.svg',
                                  color:
                                      const Color.fromRGBO(196, 198, 204, 1)),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 20),
                              width: MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: const Color.fromRGBO(236, 238, 244, 1)
                                  // color:Colors.orange
                                  ),
                              child: TextField(
                                onChanged: (text) {
                                  setState(() {
                                    addCustomerPhoneNumber = text;
                                  });
                                },
                                //added new
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .getTranslatedValue('customer_phone')
                                      .toString(),
                                  hintStyle: getcustomertextStyle(
                                      context,
                                      15,
                                      FontWeight.normal,
                                      const Color.fromRGBO(196, 198, 204, 1)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 20),
                              width: MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: const Color.fromRGBO(236, 238, 244, 1)
                                  // color:Colors.orange
                                  ),
                              child: TextField(
                                onChanged: (text) {
                                  setState(() {
                                    addCustomerVat = text;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .getTranslatedValue('vat_num')
                                      .toString(),
                                  hintStyle: getcustomertextStyle(
                                      context,
                                      15,
                                      FontWeight.normal,
                                      const Color.fromRGBO(196, 198, 204, 1)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 20),
                              width: MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color:
                                      const Color.fromRGBO(236, 238, 244, 1)),
                              child: TextField(
                                onChanged: (text) {
                                  setState(() {
                                    addCustomerAddress = text;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .getTranslatedValue('customer_address')
                                      .toString(),
                                  hintStyle: getcustomertextStyle(
                                      context,
                                      15,
                                      FontWeight.normal,
                                      const Color.fromRGBO(196, 198, 204, 1)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                              const EdgeInsets.only(left: 10, right: 10),
                              padding:
                              const EdgeInsets.only(left: 10, right: 20),
                              width: MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(236, 238, 244, 1),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: PaymentMethod(),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              width: MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(92, 145, 246, 0.11),
                                    offset: Offset(0, 8),
                                    blurRadius: 28.0),
                              ]),
                              child: RaisedButton(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .getTranslatedValue('print_invoice_text')
                                      .toString(),
                                  style: getcustomertextStyle(context, 20,
                                      FontWeight.w400, Colors.white),
                                ),
                                color: const Color.fromRGBO(210, 140, 84, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                onPressed: () async {
                                  if ((addCustomerAddress == "") &&
                                      (addCustomerName == "") &&
                                      (addCustomerPhoneNumber == "") &&
                                      (addCustomerVat == "")) {
                                    setState(() {
                                      massage = "All fields required";
                                    });
                                  } else {
                                    bool validation =
                                        await CustomerApi().addCustomerToJson(
                                      addCustomerName,
                                      addCustomerPhoneNumber,
                                    );
                                    if (!validation) {
                                      massage =
                                          "Error happend when a customer is going to be added";
                                    } else {
                                      OrderApi orderApi = OrderApi();
                                      List<Car> carproducts =
                                          await NotesDataBase.instance
                                              .readAllCarProducts();
                                      int transactionId = await orderApi
                                          .addOrderTransaction(
                                              totalBeforeTax:
                                                  Get.find<CarController>()
                                                      .totalAmount
                                                      .value,
                                              products: carproducts)
                                          .catchError((error) {});
                                      Printer.secondType(
                                          addCustomerAddress,
                                          addCustomerName,
                                        context
                                      );
                                      // printReceipt();
                                      await NotesDataBase.instance.clearCar();
                                      navigator!.pushReplacement(
                                          MaterialPageRoute(
                                              builder: (_) => MyHomePage()));
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        // the text of validation
                        // Center(child: Text(massage)),
                      ],
                    ),
                  ),
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
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
                                  left: 20, top: 15, right: 20, bottom: 25),
                              margin: const EdgeInsets.only(left: 10),
                              decoration: const BoxDecoration(
                                  // color:Colors.red,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(14),
                                    topLeft: Radius.circular(14),
                                  ),
                                  color: Color.fromRGBO(236, 238, 244, 1)),
                              child: SvgPicture.asset('images/search-1.svg',
                                  color:
                                      const Color.fromRGBO(196, 198, 204, 1)),
                            ),
                            Container(
                              // margin: const EdgeInsets.only(left: 10),
                              padding:
                                  const EdgeInsets.only(left: 150, bottom: 20),
                              width: MediaQuery.of(context).size.width * 0.72,
                              height: MediaQuery.of(context).size.height * 0.09,
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
                                      const Color.fromRGBO(196, 198, 204, 1)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding:
                                  const EdgeInsets.only(left: 210, bottom: 20),
                              width: MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: const Color.fromRGBO(236, 238, 244, 1)
                                  // color:Colors.orange
                                  ),
                              child: TextField(
                                textDirection: TextDirection.rtl,
                                onChanged: (text) {
                                  setState(() {
                                    addCustomerPhoneNumber = text;
                                  });
                                },
                                //added new
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .getTranslatedValue('customer_phone')
                                      .toString(),
                                  hintStyle: getcustomertextStyle(
                                      context,
                                      15,
                                      FontWeight.normal,
                                      const Color.fromRGBO(196, 198, 204, 1)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding:
                                  const EdgeInsets.only(left: 190, bottom: 20),
                              width: MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color: const Color.fromRGBO(236, 238, 244, 1)
                                  // color:Colors.orange
                                  ),
                              child: TextField(
                                textDirection: TextDirection.rtl,
                                onChanged: (text) {
                                  setState(() {
                                    addCustomerVat = text;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .getTranslatedValue('vat_num')
                                      .toString(),
                                  hintStyle: getcustomertextStyle(
                                      context,
                                      15,
                                      FontWeight.normal,
                                      const Color.fromRGBO(196, 198, 204, 1)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding:
                                  const EdgeInsets.only(left: 230, bottom: 20),
                              width: MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  color:
                                      const Color.fromRGBO(236, 238, 244, 1)),
                              child: TextField(
                                textDirection: TextDirection.rtl,
                                onChanged: (text) {
                                  setState(() {
                                    addCustomerAddress = text;
                                  });
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .getTranslatedValue('customer_address')
                                      .toString(),
                                  hintStyle: getcustomertextStyle(
                                      context,
                                      15,
                                      FontWeight.normal,
                                      const Color.fromRGBO(196, 198, 204, 1)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              padding:
                                  const EdgeInsets.only(left: 10, right: 20),
                              width: MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height * 0.09,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(236, 238, 244, 1),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: PaymentMethod(),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10, right: 10),
                              width: MediaQuery.of(context).size.width * 0.88,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(92, 145, 246, 0.11),
                                    offset: Offset(0, 8),
                                    blurRadius: 28.0),
                              ]),
                              child: RaisedButton(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .getTranslatedValue('print_invoice_text')
                                      .toString(),
                                  style: getcustomertextStyle(context, 20,
                                      FontWeight.w400, Colors.white),
                                ),
                                color: const Color.fromRGBO(210, 140, 84, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                onPressed: () async {
                                  if ((addCustomerAddress == "") &&
                                      (addCustomerName == "") &&
                                      (addCustomerPhoneNumber == "") &&
                                      (addCustomerVat == "")) {
                                    setState(() {
                                      massage = "All fields required";
                                    });
                                  } else {
                                    bool validation =
                                        await CustomerApi().addCustomerToJson(
                                      addCustomerName,
                                      addCustomerPhoneNumber,
                                    );
                                    if (validation == false) {
                                      massage =
                                          "Error happend when a customer is going to be added";
                                    } else {
                                      OrderApi orderApi = OrderApi();
                                      // List<Car> carproducts = await NotesDataBase.instance.readAllCarProducts();
                                      int transactionId = await orderApi
                                          .addOrderTransaction(
                                              totalBeforeTax:
                                                  Get.find<CarController>()
                                                      .totalAmount
                                                      .value,
                                              products: carproducts)
                                          .catchError((error) {});
                                      Printer.secondType(
                                          addCustomerAddress,
                                          addCustomerName,
                                        context
                                      );
                                      await NotesDataBase.instance.clearCar();
                                      navigator!.pushReplacement(
                                          MaterialPageRoute(
                                              builder: (_) => MyHomePage()));
                                    }
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        //the text of validation
                        // Center(child: Text(massage)),
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
