import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../classes/app_localizations.dart';

class CarController extends GetxController {
  List<Widget> carListOfWidgets = [
    const Text("Cart"),
  ];
  RxInt NumberofProduct = 1.obs;
  var totalAmount = 0.0.obs;

  // List<int> AddToCardlist = [0].obs ;

  var count = 0.obs;

  void addNewProductToCount() {
    count++;
  }

  void addNewProduct(Widget widget) {
    carListOfWidgets.add(widget);
  }

  void increment() {
    NumberofProduct++;
  }

  void Disincrement() {
    if (NumberofProduct > 0) {
      NumberofProduct--;
    }
  }

  @override
  void onInit() {
    increment();
    Disincrement();
    //  addNewProductToList();
    addNewProductToCount();

    super.onInit();
  }
}
