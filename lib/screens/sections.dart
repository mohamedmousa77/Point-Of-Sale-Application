import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application/widget/section_product_cards.dart';

import '../widget/change_language_style.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';
import '../widget/custom_sizedbox.dart';

class Section extends StatefulWidget {
  const Section({Key? key}) : super(key: key);

  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          customAppBar(context, key: 2),
          customSizedBox(context, 0.03),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.093,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                )),
            alignment: Alignment.center,
            //printing the name of the category
            child: Text(" ${Get.arguments[2]}",
                style: getcustomertextStyle(context, 28, FontWeight.bold,
                    const Color.fromRGBO(34, 53, 53, 1))),
          ),
          /////////////////////////////////////////////////////////////////////////////////////////////
          //////////////////////////////////////////items//////////////////////////////////////////////////

          //checking the product list
          Get.arguments[3] == "No product"
              ? Container(
                color: Colors.white,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.7),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text("No product"),
                )
              : Container(
            decoration:const BoxDecoration(
              color: Colors.white,
            ),

                  height: MediaQuery.of(context).size.height * 0.7,
                  child: GridView.builder(

                    gridDelegate: const
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: Get.arguments[3].length,
                    itemBuilder: (BuildContext context, index) =>
                        buildSectionCard(
                      Get.arguments[3][index].name,
                      Get.arguments[3][index].image,
                      Get.arguments[3][index].id,
                    ),

                  ),
                ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(1),
    );
  }
}
