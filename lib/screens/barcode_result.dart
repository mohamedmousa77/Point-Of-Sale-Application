import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application/models/product_model.dart';
import '../services/product_service.dart';
import '../widget/custom_appbar.dart';
import '../widget/section_product_cards.dart';

class BarCodeResult extends StatefulWidget {
  const BarCodeResult({Key? key}) : super(key: key);

  @override
  _BarCodeResultState createState() => _BarCodeResultState();
}

class _BarCodeResultState extends State<BarCodeResult> {
  bool? qrCodeSuccess;
  String? qrCode;
  List<Product> listResult = [];

  @override
  void initState() {
    if (Get.arguments[1] == false) {
      setState(() {
        qrCodeSuccess = false;
      });
    } else {
      getProducts();
    }
    super.initState();
  }

  void getProducts() async {
    List<Product> list = await ProductApi().search(barcodeType: qrCode);
    setState(() {
      listResult = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (qrCodeSuccess == false) {
      return const Scaffold(
        body: Text("Error in barcode"),
      );
    } else {
      return Scaffold(
          body: ListView(
        children: [
          customAppBar(context),
          Container(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: listResult.length,
              itemBuilder: (__,_)=>Container(),
              // itemBuilder: (BuildContext context, index) => buildSectionCard(
              //   listResult[index].name,
              //   listResult[index].image,
              //   listResult[index].id,
              // ),
            ),
          )
        ],
      ));
    }
  }
}
