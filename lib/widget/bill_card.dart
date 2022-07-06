import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../screens/receipt_details.dart';
import '../services/customer_service.dart';
import '../services/invoice_pdf/invoice_model.dart';
import '../widget/change_language_style.dart';

Widget billCard(BuildContext context, Invoice invoice
    // int idBill,
    // DateTime date,
    // String type,
    // int contactId,
    // String price,
    ) {
  // List<dynamic> myList = [
  //   idBill,
  //   date,
  //   type,
  //   price,
  //   contactId,
  // ];

  return GestureDetector(
    onTap: () {
      // Get.to(() => const ReceiptDetails(), arguments: myList);
    },
    child: Container(
        width: MediaQuery.of(context).size.width * 0.89,
        height: MediaQuery.of(context).size.height * 0.19,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromRGBO(248, 248, 248, 1),
        ),
        child: LanguageEnglish(context) == 'English'
            ? Container(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Column(
                  children: [
                    // customer name
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SvgPicture.asset('images/add-user-1.svg')),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 10, left: 10),
                            child: Text(invoice
                                        .customer
                                        .name
                                        // snapshot.data.toString()
                                        .length <
                                    30
                                ? invoice.customer.name
                                : invoice.customer.name.replaceRange(
                                    30, invoice.customer.name.length, '...')))
                      ],
                    ),
                    // invoice date
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SvgPicture.asset('images/calendar.svg')),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 10, left: 10),
                            child: Text(invoice.info.date.toString(),
                                style: getcustomertextStyle(
                                    context,
                                    14,
                                    FontWeight.normal,
                                    const Color.fromRGBO(34, 53, 53, 1))
                                // TextStyle(fontSize: 14),
                                ))
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Container(
                    //         padding:
                    //         const EdgeInsets.only(bottom: 10),
                    //         child: SvgPicture.asset(
                    //             'images/ticket.svg')),
                    //     Container(
                    //         padding: const EdgeInsets.only(
                    //             bottom: 10, left: 10),
                    //         child: Text(type,
                    //             style: getcustomertextStyle(
                    //                 context,
                    //                 14,
                    //                 FontWeight.normal,
                    //                 const Color.fromRGBO(
                    //                     34, 53, 53, 1))
                    //
                    //           // TextStyle(fontSize: 14),
                    //         ))
                    //   ],
                    // ),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SvgPicture.asset('images/wallet.svg')),
                        Container(
                            padding:
                                const EdgeInsets.only(bottom: 10, left: 10),
                            child: Text('2000 \$',
                                style: getcustomertextStyle(
                                    context,
                                    14,
                                    FontWeight.normal,
                                    const Color.fromRGBO(34, 53, 53, 1))

                                // TextStyle(fontSize: 14),
                                ))
                      ],
                    ),
                  ],
                )
                // FutureBuilder(
                //   future: CustomerApi().searchById(contactId.toString()),
                //   builder: (BuildContext ctx, AsyncSnapshot snapshot) =>
                //       snapshot.hasData
                //           ? Column(
                //               children: [
                //                 Row(
                //                   children: [
                //                     Container(
                //                         padding:
                //                             const EdgeInsets.only(bottom: 10),
                //                         child: SvgPicture.asset(
                //                             'images/add-user-1.svg')),
                //                     Container(
                //                         padding: const EdgeInsets.only(
                //                             bottom: 10, left: 10),
                //                         child: Text(
                //                             snapshot.data.toString().length < 30
                //                                 ? snapshot.data
                //                                 : snapshot.data
                //                                     .toString()
                //                                     .replaceRange(
                //                                         30,
                //                                         snapshot.data
                //                                             .toString()
                //                                             .length,
                //                                         '...')))
                //                   ],
                //                 ),
                //                 Row(
                //                   children: [
                //                     Container(
                //                         padding:
                //                             const EdgeInsets.only(bottom: 10),
                //                         child: SvgPicture.asset(
                //                             'images/calendar.svg')),
                //                     Container(
                //                         padding: const EdgeInsets.only(
                //                             bottom: 10, left: 10),
                //                         child: Text("$date",
                //                             style: getcustomertextStyle(
                //                                 context,
                //                                 14,
                //                                 FontWeight.normal,
                //                                 const Color.fromRGBO(
                //                                     34, 53, 53, 1))
                //                             // TextStyle(fontSize: 14),
                //                             ))
                //                   ],
                //                 ),
                //                 Row(
                //                   children: [
                //                     Container(
                //                         padding:
                //                             const EdgeInsets.only(bottom: 10),
                //                         child: SvgPicture.asset(
                //                             'images/ticket.svg')),
                //                     Container(
                //                         padding: const EdgeInsets.only(
                //                             bottom: 10, left: 10),
                //                         child: Text(type,
                //                             style: getcustomertextStyle(
                //                                 context,
                //                                 14,
                //                                 FontWeight.normal,
                //                                 const Color.fromRGBO(
                //                                     34, 53, 53, 1))
                //
                //                             // TextStyle(fontSize: 14),
                //                             ))
                //                   ],
                //                 ),
                //                 Row(
                //                   children: [
                //                     Container(
                //                         padding:
                //                             const EdgeInsets.only(bottom: 10),
                //                         child: SvgPicture.asset(
                //                             'images/wallet.svg')),
                //                     Container(
                //                         padding: const EdgeInsets.only(
                //                             bottom: 10, left: 10),
                //                         child: Text(price,
                //                             style: getcustomertextStyle(
                //                                 context,
                //                                 14,
                //                                 FontWeight.normal,
                //                                 const Color.fromRGBO(
                //                                     34, 53, 53, 1))
                //
                //                             // TextStyle(fontSize: 14),
                //                             ))
                //                   ],
                //                 ),
                //               ],
                //             )
                //           : const Center(child: CircularProgressIndicator()),
                // )

                )
            : Container(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child:
                // FutureBuilder(
                //   future: CustomerApi().searchById(contactId.toString()),
                //   builder: (BuildContext ctx, AsyncSnapshot snapshot) {
                //     return snapshot.hasData
                //         ? Row(
                //             children: [
                //               Row(
                //                 // crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Column(
                //                     // crossAxisAlignment: CrossAxisAlignment.end,
                //                     children: [
                //                       Container(
                //                           padding:
                //                               const EdgeInsets.only(top: 10),
                //                           child: Text(
                //                               snapshot.data.toString().length <
                //                                       30
                //                                   ? snapshot.data
                //                                   : snapshot.data
                //                                       .toString()
                //                                       .replaceRange(
                //                                           30,
                //                                           snapshot.data
                //                                               .toString()
                //                                               .length,
                //                                           '...'))),
                //                       Container(
                //                           padding: const EdgeInsets.only(
                //                               top: 10, left: 100),
                //                           child: Text("$date",
                //                               style: getcustomertextStyle(
                //                                   context,
                //                                   14,
                //                                   FontWeight.normal,
                //                                   const Color.fromRGBO(
                //                                       34, 53, 53, 1))
                //                               // TextStyle(fontSize: 14),
                //                               )),
                //                       Container(
                //                           padding: const EdgeInsets.only(
                //                               top: 10, left: 180),
                //                           child: Text(type.toString(),
                //                               style: getcustomertextStyle(
                //                                   context,
                //                                   14,
                //                                   FontWeight.normal,
                //                                   const Color.fromRGBO(
                //                                       34, 53, 53, 1))
                //
                //                               // TextStyle(fontSize: 14),
                //                               )),
                //                       Container(
                //                           padding: const EdgeInsets.only(
                //                               top: 10, left: 180),
                //                           child: Text(price,
                //                               style: getcustomertextStyle(
                //                                   context,
                //                                   14,
                //                                   FontWeight.normal,
                //                                   const Color.fromRGBO(
                //                                       34, 53, 53, 1))
                //
                //                               // TextStyle(fontSize: 14),
                //                               )),
                //                     ],
                //                   ),
                //                   Column(
                //                     // crossAxisAlignment: CrossAxisAlignment.s,
                //                     children: [
                //                       Container(
                //                           padding: const EdgeInsets.only(
                //                               top: 15, left: 10),
                //                           child: SvgPicture.asset(
                //                               'images/add-user-1.svg')),
                //                       Container(
                //                           padding: const EdgeInsets.only(
                //                               top: 15, left: 10),
                //                           child: SvgPicture.asset(
                //                               'images/calendar.svg')),
                //                       Container(
                //                           padding: const EdgeInsets.only(
                //                               top: 15, left: 10),
                //                           child: SvgPicture.asset(
                //                               'images/ticket.svg')),
                //                       Container(
                //                           padding: const EdgeInsets.only(
                //                               top: 15, left: 10),
                //                           child: SvgPicture.asset(
                //                               'images/wallet.svg')),
                //                     ],
                //                   ),
                //
                //                   //   Row(
                //                   //     // crossAxisAlignment: CrossAxisAlignment.end,
                //                   //     children: [
                //                   //       Container(
                //                   //           // padding: const EdgeInsets.only(bottom: 10, right: 50),
                //                   //           child: Text(
                //                   //               snapshot.data.toString().length <
                //                   //                       30
                //                   //                   ? snapshot.data
                //                   //                   : snapshot.data
                //                   //                       .toString()
                //                   //                       .replaceRange(
                //                   //                           30,
                //                   //                           snapshot.data
                //                   //                               .toString()
                //                   //                               .length,
                //                   //                           '...'))),
                //                   //       Container(
                //                   //           // padding: const EdgeInsets.only(bottom: 10,right: 20),
                //                   //           child: SvgPicture.asset(
                //                   //               'images/add-user-1.svg')),
                //                   //     ],
                //                   //   ),
                //                   //   Row(
                //                   //     // crossAxisAlignment: CrossAxisAlignment.baseline,
                //                   //     children: [
                //                   //       Container(
                //                   //           padding: const EdgeInsets.only(
                //                   //               top: 10, bottom: 10, left: 100),
                //                   //           child: Text("$date",
                //                   //               style: getcustomertextStyle(
                //                   //                   context,
                //                   //                   14,
                //                   //                   FontWeight.normal,
                //                   //                   const Color.fromRGBO(
                //                   //                       34, 53, 53, 1))
                //                   //               // TextStyle(fontSize: 14),
                //                   //               )),
                //                   //       Container(
                //                   //           padding: const EdgeInsets.only(
                //                   //               top: 10, bottom: 10, left: 10),
                //                   //           child: SvgPicture.asset(
                //                   //               'images/calendar.svg')),
                //                   //     ],
                //                   //   ),
                //                   //   Row(
                //                   //     children: [
                //                   //       // Container(
                //                   //       //     padding: const EdgeInsets.only(
                //                   //       //         bottom: 10, left: 150),
                //                   //       //     child: Text(type,
                //                   //       //         style: getcustomertextStyle(
                //                   //       //             context,
                //                   //       //             14,
                //                   //       //             FontWeight.normal,
                //                   //       //             const Color.fromRGBO(
                //                   //       //                 34, 53, 53, 1))
                //                   //       //         // TextStyle(fontSize: 14),
                //                   //       //         )),
                //                   //       Container(
                //                   //           padding: const EdgeInsets.only(
                //                   //               bottom: 10, left: 10),
                //                   //           child: SvgPicture.asset(
                //                   //               'images/ticket.svg')),
                //                   //     ],
                //                   //   ),
                //                   //   Row(
                //                   //     children: [
                //                   //       Container(
                //                   //           padding: const EdgeInsets.only(
                //                   //               bottom: 10, left: 180),
                //                   //           child: Text(price,
                //                   //               style: getcustomertextStyle(
                //                   //                   context,
                //                   //                   14,
                //                   //                   FontWeight.normal,
                //                   //                   const Color.fromRGBO(
                //                   //                       34, 53, 53, 1))
                //                   //               // TextStyle(fontSize: 14),
                //                   //               )),
                //                   //       Container(
                //                   //           padding: const EdgeInsets.only(
                //                   //               bottom: 10, left: 10),
                //                   //           child: SvgPicture.asset(
                //                   //               'images/wallet.svg')),
                //                   //     ],
                //                   //   ),
                //                 ],
                //               ),
                //               // Row(
                //               //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                //               //   children: [
                //               //     Column(
                //               //       // crossAxisAlignment: CrossAxisAlignment.s,
                //               //       children: [
                //               //         Container(
                //               //             padding: const EdgeInsets.only(
                //               //                 top: 15, left: 10),
                //               //             child: SvgPicture.asset(
                //               //                 'images/add-user-1.svg')),
                //               //         Container(
                //               //             padding: const EdgeInsets.only(
                //               //                 top: 15, left: 10),
                //               //             child: SvgPicture.asset(
                //               //                 'images/calendar.svg')),
                //               //         Container(
                //               //             padding: const EdgeInsets.only(
                //               //                 top: 15, left: 10),
                //               //             child: SvgPicture.asset(
                //               //                 'images/ticket.svg')),
                //               //         Container(
                //               //             padding: const EdgeInsets.only(
                //               //                 top: 15, left: 10),
                //               //             child: SvgPicture.asset(
                //               //                 'images/wallet.svg')),
                //               //       ],
                //               //     ),
                //               //     Row(
                //               //       // crossAxisAlignment: CrossAxisAlignment.end,
                //               //       children: [
                //               //         Container(
                //               //             // padding: const EdgeInsets.only(bottom: 10, right: 50),
                //               //             child: Text(
                //               //                 snapshot.data.toString().length <
                //               //                         30
                //               //                     ? snapshot.data
                //               //                     : snapshot.data
                //               //                         .toString()
                //               //                         .replaceRange(
                //               //                             30,
                //               //                             snapshot.data
                //               //                                 .toString()
                //               //                                 .length,
                //               //                             '...'))),
                //               //         Container(
                //               //             // padding: const EdgeInsets.only(bottom: 10,right: 20),
                //               //             child: SvgPicture.asset(
                //               //                 'images/add-user-1.svg')),
                //               //       ],
                //               //     ),
                //               //     Row(
                //               //       // crossAxisAlignment: CrossAxisAlignment.baseline,
                //               //       children: [
                //               //         Container(
                //               //             padding: const EdgeInsets.only(
                //               //                 top: 10, bottom: 10, left: 100),
                //               //             child: Text("$date",
                //               //                 style: getcustomertextStyle(
                //               //                     context,
                //               //                     14,
                //               //                     FontWeight.normal,
                //               //                     const Color.fromRGBO(
                //               //                         34, 53, 53, 1))
                //               //                 // TextStyle(fontSize: 14),
                //               //                 )),
                //               //         Container(
                //               //             padding: const EdgeInsets.only(
                //               //                 top: 10, bottom: 10, left: 10),
                //               //             child: SvgPicture.asset(
                //               //                 'images/calendar.svg')),
                //               //       ],
                //               //     ),
                //               //     Row(
                //               //       children: [
                //               //         Container(
                //               //             padding: const EdgeInsets.only(
                //               //                 bottom: 10, left: 150),
                //               //             child: Text(type,
                //               //                 style: getcustomertextStyle(
                //               //                     context,
                //               //                     14,
                //               //                     FontWeight.normal,
                //               //                     const Color.fromRGBO(
                //               //                         34, 53, 53, 1))
                //               //                 // TextStyle(fontSize: 14),
                //               //                 )),
                //               //         Container(
                //               //             padding: const EdgeInsets.only(
                //               //                 bottom: 10, left: 10),
                //               //             child: SvgPicture.asset(
                //               //                 'images/ticket.svg')),
                //               //       ],
                //               //     ),
                //               //     Row(
                //               //       children: [
                //               //         Container(
                //               //             padding: const EdgeInsets.only(
                //               //                 bottom: 10, left: 180),
                //               //             child: Text(price,
                //               //                 style: getcustomertextStyle(
                //               //                     context,
                //               //                     14,
                //               //                     FontWeight.normal,
                //               //                     const Color.fromRGBO(
                //               //                         34, 53, 53, 1))
                //               //                 // TextStyle(fontSize: 14),
                //               //                 )),
                //               //         Container(
                //               //             padding: const EdgeInsets.only(
                //               //                 bottom: 10, left: 10),
                //               //             child: SvgPicture.asset(
                //               //                 'images/wallet.svg')),
                //               //       ],
                //               //     ),
                //               //   ],
                //               // ),
                //             ],
                //           )
                //         : const Center(child: CircularProgressIndicator());
                //   },
                // )
                Row(
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //customer name
                            Container(
                                padding:
                                const EdgeInsets.only(top: 10),
                                child: Text(
                                    invoice.customer.name.length <
                                        30
                                        ? invoice.customer.name
                                        : invoice.customer.name
                                        .replaceRange(
                                        30,
                                        invoice.customer.name.length,
                                        '...'))),
                            //invoice date
                            Container(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 100),
                                child: Text(invoice.info.date.toString(),
                                    style: getcustomertextStyle(
                                        context,
                                        14,
                                        FontWeight.normal,
                                        const Color.fromRGBO(
                                            34, 53, 53, 1))
                                  // TextStyle(fontSize: 14),
                                )),
                            //
                            // Container(
                            //     padding: const EdgeInsets.only(
                            //         top: 10, left: 180),
                            //     child: Text(type.toString(),
                            //         style: getcustomertextStyle(
                            //             context,
                            //             14,
                            //             FontWeight.normal,
                            //             const Color.fromRGBO(
                            //                 34, 53, 53, 1))
                            //
                            //       // TextStyle(fontSize: 14),
                            //     )),
                            Container(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 180),
                                child: Text('2000 \$',
                                    style: getcustomertextStyle(
                                        context,
                                        14,
                                        FontWeight.normal,
                                        const Color.fromRGBO(
                                            34, 53, 53, 1))

                                  // TextStyle(fontSize: 14),
                                )),
                          ],
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.s,
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 10),
                                child: SvgPicture.asset(
                                    'images/add-user-1.svg')),
                            Container(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 10),
                                child: SvgPicture.asset(
                                    'images/calendar.svg')),
                            Container(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 10),
                                child: SvgPicture.asset(
                                    'images/ticket.svg')),
                            Container(
                                padding: const EdgeInsets.only(
                                    top: 15, left: 10),
                                child: SvgPicture.asset(
                                    'images/wallet.svg')),
                          ],
                        ),

                        //   Row(
                        //     // crossAxisAlignment: CrossAxisAlignment.end,
                        //     children: [
                        //       Container(
                        //           // padding: const EdgeInsets.only(bottom: 10, right: 50),
                        //           child: Text(
                        //               snapshot.data.toString().length <
                        //                       30
                        //                   ? snapshot.data
                        //                   : snapshot.data
                        //                       .toString()
                        //                       .replaceRange(
                        //                           30,
                        //                           snapshot.data
                        //                               .toString()
                        //                               .length,
                        //                           '...'))),
                        //       Container(
                        //           // padding: const EdgeInsets.only(bottom: 10,right: 20),
                        //           child: SvgPicture.asset(
                        //               'images/add-user-1.svg')),
                        //     ],
                        //   ),
                        //   Row(
                        //     // crossAxisAlignment: CrossAxisAlignment.baseline,
                        //     children: [
                        //       Container(
                        //           padding: const EdgeInsets.only(
                        //               top: 10, bottom: 10, left: 100),
                        //           child: Text("$date",
                        //               style: getcustomertextStyle(
                        //                   context,
                        //                   14,
                        //                   FontWeight.normal,
                        //                   const Color.fromRGBO(
                        //                       34, 53, 53, 1))
                        //               // TextStyle(fontSize: 14),
                        //               )),
                        //       Container(
                        //           padding: const EdgeInsets.only(
                        //               top: 10, bottom: 10, left: 10),
                        //           child: SvgPicture.asset(
                        //               'images/calendar.svg')),
                        //     ],
                        //   ),
                        //   Row(
                        //     children: [
                        //       // Container(
                        //       //     padding: const EdgeInsets.only(
                        //       //         bottom: 10, left: 150),
                        //       //     child: Text(type,
                        //       //         style: getcustomertextStyle(
                        //       //             context,
                        //       //             14,
                        //       //             FontWeight.normal,
                        //       //             const Color.fromRGBO(
                        //       //                 34, 53, 53, 1))
                        //       //         // TextStyle(fontSize: 14),
                        //       //         )),
                        //       Container(
                        //           padding: const EdgeInsets.only(
                        //               bottom: 10, left: 10),
                        //           child: SvgPicture.asset(
                        //               'images/ticket.svg')),
                        //     ],
                        //   ),
                        //   Row(
                        //     children: [
                        //       Container(
                        //           padding: const EdgeInsets.only(
                        //               bottom: 10, left: 180),
                        //           child: Text(price,
                        //               style: getcustomertextStyle(
                        //                   context,
                        //                   14,
                        //                   FontWeight.normal,
                        //                   const Color.fromRGBO(
                        //                       34, 53, 53, 1))
                        //               // TextStyle(fontSize: 14),
                        //               )),
                        //       Container(
                        //           padding: const EdgeInsets.only(
                        //               bottom: 10, left: 10),
                        //           child: SvgPicture.asset(
                        //               'images/wallet.svg')),
                        //     ],
                        //   ),
                      ],
                    ),
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Column(
                    //       // crossAxisAlignment: CrossAxisAlignment.s,
                    //       children: [
                    //         Container(
                    //             padding: const EdgeInsets.only(
                    //                 top: 15, left: 10),
                    //             child: SvgPicture.asset(
                    //                 'images/add-user-1.svg')),
                    //         Container(
                    //             padding: const EdgeInsets.only(
                    //                 top: 15, left: 10),
                    //             child: SvgPicture.asset(
                    //                 'images/calendar.svg')),
                    //         Container(
                    //             padding: const EdgeInsets.only(
                    //                 top: 15, left: 10),
                    //             child: SvgPicture.asset(
                    //                 'images/ticket.svg')),
                    //         Container(
                    //             padding: const EdgeInsets.only(
                    //                 top: 15, left: 10),
                    //             child: SvgPicture.asset(
                    //                 'images/wallet.svg')),
                    //       ],
                    //     ),
                    //     Row(
                    //       // crossAxisAlignment: CrossAxisAlignment.end,
                    //       children: [
                    //         Container(
                    //             // padding: const EdgeInsets.only(bottom: 10, right: 50),
                    //             child: Text(
                    //                 snapshot.data.toString().length <
                    //                         30
                    //                     ? snapshot.data
                    //                     : snapshot.data
                    //                         .toString()
                    //                         .replaceRange(
                    //                             30,
                    //                             snapshot.data
                    //                                 .toString()
                    //                                 .length,
                    //                             '...'))),
                    //         Container(
                    //             // padding: const EdgeInsets.only(bottom: 10,right: 20),
                    //             child: SvgPicture.asset(
                    //                 'images/add-user-1.svg')),
                    //       ],
                    //     ),
                    //     Row(
                    //       // crossAxisAlignment: CrossAxisAlignment.baseline,
                    //       children: [
                    //         Container(
                    //             padding: const EdgeInsets.only(
                    //                 top: 10, bottom: 10, left: 100),
                    //             child: Text("$date",
                    //                 style: getcustomertextStyle(
                    //                     context,
                    //                     14,
                    //                     FontWeight.normal,
                    //                     const Color.fromRGBO(
                    //                         34, 53, 53, 1))
                    //                 // TextStyle(fontSize: 14),
                    //                 )),
                    //         Container(
                    //             padding: const EdgeInsets.only(
                    //                 top: 10, bottom: 10, left: 10),
                    //             child: SvgPicture.asset(
                    //                 'images/calendar.svg')),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         Container(
                    //             padding: const EdgeInsets.only(
                    //                 bottom: 10, left: 150),
                    //             child: Text(type,
                    //                 style: getcustomertextStyle(
                    //                     context,
                    //                     14,
                    //                     FontWeight.normal,
                    //                     const Color.fromRGBO(
                    //                         34, 53, 53, 1))
                    //                 // TextStyle(fontSize: 14),
                    //                 )),
                    //         Container(
                    //             padding: const EdgeInsets.only(
                    //                 bottom: 10, left: 10),
                    //             child: SvgPicture.asset(
                    //                 'images/ticket.svg')),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         Container(
                    //             padding: const EdgeInsets.only(
                    //                 bottom: 10, left: 180),
                    //             child: Text(price,
                    //                 style: getcustomertextStyle(
                    //                     context,
                    //                     14,
                    //                     FontWeight.normal,
                    //                     const Color.fromRGBO(
                    //                         34, 53, 53, 1))
                    //                 // TextStyle(fontSize: 14),
                    //                 )),
                    //         Container(
                    //             padding: const EdgeInsets.only(
                    //                 bottom: 10, left: 10),
                    //             child: SvgPicture.asset(
                    //                 'images/wallet.svg')),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ],
                )

        )
    ),
  );
}
