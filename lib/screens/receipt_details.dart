import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../services/customer_service.dart';
import '../services/product_service.dart';
import '../services/transaction_selling_servivce.dart';
import '../widget/car_product_detail.dart';
import '../widget/change_language_style.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';

class ReceiptDetails extends StatefulWidget {
  const ReceiptDetails({Key? key}) : super(key: key);

  @override
  _ReceiptDetailsState createState() => _ReceiptDetailsState();
}

class _ReceiptDetailsState extends State<ReceiptDetails> {
  String id = Get.arguments[0].toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.039),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            padding: EdgeInsets.only(
                left: LanguageEnglish(context) == 'English' ? 130 : 150,
                top: 25,
                bottom: 15),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
            child: Text(
                AppLocalizations.of(context)!
                    .getTranslatedValue('receipt_text')
                    .toString(),
                style: getcustomertextStyle(
                    context, 20, FontWeight.bold, Colors.black)
                // TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                LanguageEnglish(context) == 'English'
                    ? Row(
                        children: [
                          FutureBuilder(
                            future: CustomerApi().searchById(Get.arguments[4].toString()),
                            builder: (BuildContext ctx,
                                    AsyncSnapshot snapshot) =>
                                snapshot.hasData
                                    ? Row(
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: SvgPicture.asset(
                                                  'images/add-user-1.svg')),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              child: Text(
                                                snapshot.data
                                                            .toString()
                                                            .length <
                                                        30
                                                    ? snapshot.data
                                                    : snapshot.data
                                                        .toString()
                                                        .replaceRange(
                                                            15,
                                                            snapshot.data
                                                                .toString()
                                                                .length,
                                                            '...'),
                                                style: getcustomertextStyle(
                                                    context,
                                                    14,
                                                    FontWeight.normal,
                                                    const Color.fromRGBO(
                                                        34, 53, 53, 1)),
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                              ))
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: SvgPicture.asset(
                                                  'images/add-user-1.svg')),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4,
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                // Get.arguments[4],
                                                'no name',
                                                style: getcustomertextStyle(
                                                    context,
                                                    14,
                                                    FontWeight.normal,
                                                    const Color.fromRGBO(
                                                        34, 53, 53, 1)),
                                              ))
                                        ],
                                      ),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: SvgPicture.asset('images/calendar.svg')),
                          Container(
                              width: MediaQuery.of(context).size.width / 4 -
                                  MediaQuery.of(context).size.width * 0.03,
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                  DateFormat("dd/MM/yyyy")
                                      .format(Get.arguments[1]),
                                  // "${Get.arguments[1]}",
                                  style: getcustomertextStyle(
                                      context,
                                      14,
                                      FontWeight.normal,
                                      const Color.fromRGBO(34, 53, 53, 1)))),
                          Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: SvgPicture.asset('images/ticket.svg')),
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Text("${Get.arguments[2]}",
                                style: getcustomertextStyle(
                                    context,
                                    14,
                                    FontWeight.normal,
                                    const Color.fromRGBO(34, 53, 53, 1))),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                                // AppLocalizations.of(context)!
                                //     .getTranslatedValue('cash_payment')
                                //     .toString(),
                                "${Get.arguments[2]}",
                                style: getcustomertextStyle(
                                    context,
                                    14,
                                    FontWeight.normal,
                                    const Color.fromRGBO(34, 53, 53, 1))),
                          ),
                          Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: SvgPicture.asset('images/ticket.svg')),
                          Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                  DateFormat("dd/MM/yyyy")
                                      .format(Get.arguments[1]),
                                  // "${Get.arguments[1]}",
                                  style: getcustomertextStyle(
                                      context,
                                      14,
                                      FontWeight.normal,
                                      const Color.fromRGBO(34, 53, 53, 1)))),
                          Container(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: SvgPicture.asset('images/calendar.svg')),
                          FutureBuilder(
                            future: CustomerApi()
                                .searchById(Get.arguments[4].toString()),
                            builder: (BuildContext ctx,
                                    AsyncSnapshot snapshot) =>
                                snapshot.hasData
                                    ? Row(
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                  snapshot.data
                                                              .toString()
                                                              .length <
                                                          30
                                                      ? snapshot.data.toString()
                                                      : snapshot.data
                                                          .toString()
                                                          .replaceRange(
                                                              15,
                                                              snapshot.data
                                                                  .toString()
                                                                  .length,
                                                              '...'),
                                                  style: getcustomertextStyle(
                                                      context,
                                                      14,
                                                      FontWeight.normal,
                                                      const Color.fromRGBO(
                                                          34, 53, 53, 1)))),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: SvgPicture.asset(
                                                  'images/add-user-1.svg')),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                // Get.arguments[4],
                                                'name?',
                                                style: getcustomertextStyle(
                                                    context,
                                                    7,
                                                    FontWeight.normal,
                                                    const Color.fromRGBO(
                                                        34, 53, 53, 1)),
                                              )),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: SvgPicture.asset(
                                                  'images/add-user-1.svg')),
                                        ],
                                      ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
          // const SizedBox(height: 30),
          //////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////
          Container(
            height: MediaQuery.of(context).size.height * 0.54,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: FutureBuilder(
              future: TransactionSellingApi().searchByTransactionId(id),
              builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(child: CircularProgressIndicator())
                      : snapshot.hasData
                          ? ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 8),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, index) {
                                return FutureBuilder(
                                  future: ProductApi().search(
                                      idProduct: int.parse(snapshot
                                          .data![index].productId
                                          .toString())),
                                  builder: (BuildContext ctx,
                                      AsyncSnapshot<List> s) {
                                    return s.connectionState ==
                                            ConnectionState.waiting
                                        ? const Center(
                                            child: CircularProgressIndicator())
                                        : s.hasData
                                            ? FutureBuilder(
                                                future: ProductApi()
                                                    .getPriceOfTheProduct(
                                                        s.data![0].id),
                                                builder: (BuildContext ctx,
                                                        AsyncSnapshot x) =>
                                                    x.connectionState ==
                                                            ConnectionState
                                                                .waiting
                                                        ? Container()
                                                        : x.hasData
                                                            ? invoiceCart(
                                                                context,
                                                                s.data![0].name,
                                                                s.data![0]
                                                                    .image,
                                                                x.data,
                                                                s.data![0]
                                                                    .alertQuantity,
                                                              )
                                                            : const SizedBox())
                                            : const SizedBox();
                                  },
                                );
                              })
                          : const Center(child: Text("No Data")),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(3),
    );
  }
}
