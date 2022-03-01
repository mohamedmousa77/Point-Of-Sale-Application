import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../classes/localization_const.dart';
import '../models/product_model.dart';
import '../screens/result.dart';
import '../services/product_service.dart';

Widget customSearchButtom(BuildContext context, String value) {
  return LanguageEnglish(context) == 'English'
      ? InkWell(
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 30, top: 30),
            margin: const EdgeInsets.only(left: 0, right: 30, top: 47),
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(34, 53, 53, 1),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                )),
            child: SvgPicture.asset('images/search-1.svg'),
          ),
          onTap: () async {
            List<Product> data = await ProductApi().search(nameProduct: value);
            Get.to(() => const Result(), arguments: data);
          },
        )
      : InkWell(
          child: Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 30, top: 30),
            margin: const EdgeInsets.only(left: 30, top: 47),
            width: MediaQuery.of(context).size.width * 0.25,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(34, 53, 53, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                )),
            child: SvgPicture.asset('images/search-1.svg'),
          ),
          onTap: () async {
            List<Product> data = await ProductApi().search(nameProduct: value);
            Get.to(() => const Result(), arguments: data);
          },
        );
}
