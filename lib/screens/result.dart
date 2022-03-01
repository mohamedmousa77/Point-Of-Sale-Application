import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../classes/app_localizations.dart';
import '../widget/change_language_style.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Get.arguments.length == 0
          ? Container(
              child: Center(
                child: Text("There is no product with this name"),
              ),
            )
          : Column(
              children: [
                customAppBar(context),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Image
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40)),
                        child: Image.network("${Get.arguments[0].image}",
                            fit: BoxFit.contain),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        child: Row(
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(Get.arguments[0].name,
                                    style: getcustomertextStyle(
                                        context,
                                        24,
                                        FontWeight.bold,
                                        const Color.fromRGBO(34, 53, 53, 1)))),
                            Container(
                              child: Text(Get.arguments[0].sku + '\$',
                                  style: getcustomertextStyle(
                                      context,
                                      24,
                                      FontWeight.bold,
                                      Color.fromRGBO(210, 140, 84, 1))),
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
                              Text(Get.arguments[0].name,
                                  style: getcustomertextStyle(
                                      context,
                                      19,
                                      FontWeight.normal,
                                      Color.fromRGBO(34, 53, 53, 1)))
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
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
                                    const Color.fromRGBO(255, 255, 255, 1))
                                // TextStyle(fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1))
                                ),
                            color: const Color.fromRGBO(210, 140, 84, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
      bottomNavigationBar: CustomNavigationBar(1),
    );
  }
}
