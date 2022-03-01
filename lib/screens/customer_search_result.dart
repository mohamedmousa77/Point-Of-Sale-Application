import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pos_application/classes/app_localizations.dart';
import 'package:pos_application/classes/localization_const.dart';
import 'package:pos_application/controllers/car_controller.dart';
import 'package:pos_application/database/note.dart';
import 'package:pos_application/database/notes_database.dart';
import 'package:pos_application/screens/add_customer.dart';
import 'package:pos_application/screens/print_receipt.dart';
import 'package:pos_application/services/customer_service.dart';
import 'package:pos_application/services/tansaction_order_service.dart';
import 'package:pos_application/widget/change_language_style.dart';
import 'package:pos_application/widget/custom_appbar.dart';
import 'package:pos_application/widget/payment_method.dart';

import '../home_page.dart';

class SearchResult extends StatefulWidget {
  List<Map<String , String>> CustomersName;
  SearchResult(this.CustomersName);
  @override
  _searchResultState createState() => _searchResultState(CustomersName);
}

class _searchResultState extends State<SearchResult> {
  List<Map<String , String>> CustomerNames ;
  _searchResultState(this.CustomerNames);

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
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
          CustomerNames.isEmpty
              ? Container(
                 height: MediaQuery.of(context).size.height*0.5,
                  width:  MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const Center(child: Text('No Cutomer found')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
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
                                'Add New Costumer',
                                // AppLocalizations.of(context)!
                                //     .getTranslatedValue(
                                //     'print_invoice_text')
                                //     .toString(),
                                style: getcustomertextStyle(
                                    context, 20, FontWeight.w400, Colors.white),
                              ),
                              color: const Color.fromRGBO(210, 140, 84, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              onPressed: () {
                                Get.to(AddCustomer());
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
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
                    child: ListView.builder(
                      itemCount: CustomerNames.length,
                      itemBuilder: (ctx, index) {
                        return Column(
                        children: [
                         GestureDetector(
                           onTap: (){
                             Printer.secondType(CustomerNames[index]['name']!,CustomerNames[index]['address']!,context);
                           },
                           child: Container(
                             padding: const EdgeInsets.all(10),
                             margin: const EdgeInsets.all( 5),
                             decoration:  BoxDecoration(

                               // color:Colors.red,
                                 borderRadius: BorderRadius.circular(14.0),
                                 color:const Color.fromRGBO(236, 238, 244, 1)
                             ),
                             height: MediaQuery.of(context).size.height*0.08,
                             width: MediaQuery.of(context).size.width,

                             child:  Text(CustomerNames[index]['name']!
                             ,style:  getcustomertextStyle(context, 15, FontWeight.normal, Colors.black),
                             ),
                           ),
                         ),

                          index==CustomerNames.length-1
                              ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top:100,left: 10, right: 10),
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
                                        .getTranslatedValue(
                                        'add_new_customer')
                                        .toString(),
                                    style: getcustomertextStyle(context, 20,
                                        FontWeight.w400, Colors.white),
                                  ),
                                  color: const Color.fromRGBO(210, 140, 84, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  onPressed: () {
                                    Get.to(AddCustomer());
                                  },
                                ),
                              ),
                            ],
                          )
                              :Container()
                        ],

                      );
                      },
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
