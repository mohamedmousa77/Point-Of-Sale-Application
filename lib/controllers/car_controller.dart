import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../classes/app_localizations.dart';
import '../database/note.dart';
import '../database/notes_database.dart';
import '../models/firebase_product_model.dart';
import '../services/product_service.dart';

class CarController extends GetxController {
  List<Car> carProductsList = [];
  List<Widget> carListOfWidgets = [const Text("Cart"),];
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


  // int count = 0;
  //
  // void checkCar() {
  //   carProductsList.map(
  //         (element) => count = element.count,
  //   );
  // }

  Future fetchAllCarProducts() async {
    debugPrint('fetchAllCarProducts called !!!!');
    carProductsList = await NotesDataBase.instance.readAllCarProducts();
    debugPrint('carProductsList length >  '+carProductsList.length.toString());
    // theResultOfTheSumOfTheTotalPrice();
    // setState(() {});

  }

  Future addProductToCar(FirebaseProduct product) async {
    debugPrint('addProductToCar Called !!!!! ');
    debugPrint('product id  > '+product.id);
    if (carProductsList.isEmpty) {
      debugPrint('carProductsList isEmpty');
      // addproductToCar();
      final carproduct = Car(
        id: product.id,
        title: product.name,
        count: 1,
        price: double.parse(product.price),
        imageUrl: product.image,
      );
      // debugPrint(carproduct.id);
      // debugPrint(carproduct.title);
      // debugPrint(carproduct.count.toString());
      // debugPrint(carproduct.price.toString());
      // debugPrint(carproduct.imageUrl);
      await NotesDataBase.instance.createCar(carproduct);
      fetchAllCarProducts();
    }
    else {
      // bool found = false;
      debugPrint('carProductsList is Not Empty');
      for (Car car in carProductsList) {
        if (car.title == product.name) {
          debugPrint('car.title   '+car.title);
          // updateProductToCar(car.id!);
          Car carProduct = carProductsList.firstWhere((element) => car.id == element.id);
          carProduct = carProduct.copyCar(
              count: carProduct.count + 1
            // : carProduct.count == 1 ?  await NotesDataBase.instance.deleteCar(carProduct.id!)
            // : carProduct.count-1 ,
          );
          await NotesDataBase.instance.updateCar(carProduct);
          fetchAllCarProducts();
          // found = true;
          break;
        }else{
          final carproduct = Car(
            id: product.id,
            title: product.name,
            count: 1,
            price: double.parse(product.price),
            imageUrl: product.image,
          );
          // debugPrint(carproduct.id);
          // debugPrint(carproduct.title);
          // debugPrint(carproduct.count.toString());
          // debugPrint(carproduct.price.toString());
          // debugPrint(carproduct.imageUrl);
          await NotesDataBase.instance.createCar(carproduct);
          fetchAllCarProducts();
        }
      }
      // if (!found) {
      //   addproductToCar();
      // }
    }
  }

  void theResultOfTheSumOfTheTotalPrice() {
    var result = 0.0;
    List<double> priceSum = [];
    List<int> countSum = [];
    if (carProductsList.isEmpty) {
      Get.find<CarController>().totalAmount.value = result;
    }
    else {
      for (int count = 0; count < carProductsList.length; count++) {
        priceSum.add(carProductsList[count].price);
        countSum.add(carProductsList[count].count);
      }
      for (int count = 0; count < carProductsList.length; count++) {
        result = (result + (priceSum[count] * countSum[count]));
      }
      Get.find<CarController>().totalAmount.value = result;
    }
    // setState(() {});
    update();
  }

  // await updateProductToCar(element.id! , true);
  Future<int> updateProductToCar(String id, bool isAdd) async {
    Car carProduct = carProductsList.firstWhere((element) => id == element.id);

    carProduct = carProduct.copyCar(
      count: isAdd
          ? carProduct.count + 1
          : carProduct.count == 1
          ? await NotesDataBase.instance.deleteCar(carProduct.id)
          : carProduct.count - 1,
    );

    await NotesDataBase.instance.updateCar(carProduct);
    fetchAllCarProducts();
    update();
    return carProduct.count;
  }

  // Future addproductToCar() async {
  //   // ProductApi productApi = ProductApi();
  //   // String price = await productApi.getPriceOfTheProduct(carProductsList.id);
  //   final carproduct = Car(
  //     id: widget.product.id,
  //     title: widget.product.name,
  //     count: 1,
  //     price: double.parse(price.toString()),
  //     ImageUrl: widget.product.image,
  //   );
  //   await NotesDataBase.instance.createCar(carproduct);
  //   refreshCar();
  // }
  //
  //
  // Future updateProductToCar(String ID) async {
  //   Car carProduct = carproducts.firstWhere((element) => ID == element.id);
  //   carProduct = carProduct.copyCar(count: carProduct.count + 1
  //     // : carProduct.count == 1 ?  await NotesDataBase.instance.deleteCar(carProduct.id!) : carProduct.count-1 ,
  //   );
  //   await NotesDataBase.instance.updateCar(carProduct);
  //   refreshCar();
  // }
}
