import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application/controllers/category_brand_controller.dart';
import 'package:pos_application/models/pro.dart';
import 'package:pos_application/models/product_model.dart';
import 'package:pos_application/services/product_service.dart';

import '../screens/sections.dart';
import '../widget/change_language_style.dart';

class sectionCard extends StatefulWidget {
  final int value;
  final String nameCategory;
  final String urlImage;
  final int id;
  sectionCard(this.value, this.nameCategory, this.urlImage, this.id);

  @override
  State<sectionCard> createState() => _sectionCardState(value, nameCategory, id, urlImage);
}

class _sectionCardState extends State<sectionCard> {
  final int value;
  final String nameCategory;
  final String urlImage;
  final int id;
  _sectionCardState(this.value, this.nameCategory, this.id, this.urlImage);
  List<Product> productList = [];

  Future<void> getProducts() async {
    List<Product> myproduct = await ProductApi().search(
        categoryId: id, brandId: Get.find<CategoryController>().selectedValue);
    setState(() {
      productList = myproduct;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () async {
        showDialog(
          context: context,
          builder: (_) => const Center(child: CircularProgressIndicator()),
          barrierDismissible: false,
        );
        await getProducts();
        Navigator.pop(context);
        if (productList.isNotEmpty) {
          var argumentsOfSectionPage = [value, id, nameCategory, productList];
          Get.to(() => const Section(), arguments: argumentsOfSectionPage);
        } else {
          var argumentsOfSectionPage = [
            widget.value,
            widget.id,
            widget.nameCategory,
            "No product"
          ];
          Get.to(() => const Section(), arguments: argumentsOfSectionPage);
        }
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.19,
          width: MediaQuery.of(context).size.width * 0.40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(248, 248, 248, 1),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(widget.urlImage, fit: BoxFit.cover),
                ),
                margin: const EdgeInsets.only(bottom: 10),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                    widget.nameCategory.length > 15
                        ? widget.nameCategory
                            .replaceRange(10, widget.nameCategory.length, '...')
                        : widget.nameCategory,
                    style: getcustomertextStyle(context, 14, FontWeight.w500,
                        const Color.fromRGBO(34, 53, 53, 1))),
              ),
            ],
          )),
    );
  }
}
