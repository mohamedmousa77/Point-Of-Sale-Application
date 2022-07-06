import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application/models/firebase_product_model.dart';

import '../models/product_model.dart';

class FirebaseProductController extends GetxController {
  List<FirebaseProduct> productsList = [];
  List<FirebaseProduct> searchResultList = [];
  List<FirebaseProduct> categoriesList = [];
  List<String> productBrands = [];
  List<String> productCategories = [];

  // add product to firebase
  Future<void> addProduct({required FirebaseProduct product}) async {
    await FirebaseFirestore.instance.collection('products').add({
      'id': product.id,
      'name': product.name,
      'productDescription': product.productDescription,
      'barcodeType': product.barcodeType,
      'alertQuantity': product.alertQuantity,
      'gategory': product.gategory,
      'brand': product.brand,
      'image': product.image,
      'price': product.price,
    });
  }

  // fetch products
  Future<List<FirebaseProduct>> fetchProduct() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshotProduct =
        await FirebaseFirestore.instance.collection('products').get();
    for (var product in querySnapshotProduct.docs) {
      final productData = await FirebaseFirestore.instance
          .collection('products')
          .doc(product.id)
          .get();
      if (productsList.any((element) => element.id == productData.id)) {
        productsList[productsList
                .indexWhere((element) => element.id == productData.id)] =
            FirebaseProduct(
                id: product.id,
                price: productData['price'],
                name: productData['name'],
                productDescription: productData['productDescription'],
                barcodeType: productData['barcodeType'],
                alertQuantity: productData['alertQuantity'],
                image: productData['image'],
                gategory: productData['gategory'],
                brand: productData['brand']);
      } else {
        productsList.add(FirebaseProduct(
            id: product.id,
            price: productData['price'],
            name: productData['name'],
            productDescription: productData['productDescription'],
            barcodeType: productData['barcodeType'],
            alertQuantity: productData['alertQuantity'],
            image: productData['image'],
            gategory: productData['gategory'],
            brand: productData['brand']));
      }
    }
    return productsList;
  }

  Future<List<String>> fetchProductCategory() async {
    debugPrint('fetchProductCategory called!!!!! ');
    QuerySnapshot<Map<String, dynamic>> querySnapshotProduct =
        await FirebaseFirestore.instance.collection('products').get();
    for (var product in querySnapshotProduct.docs) {
      final productData = await FirebaseFirestore.instance
          .collection('products')
          .doc(product.id)
          .get();
      if (productCategories
          .any((element) => element == productData['gategory'])) {
        productCategories[productCategories
                .indexWhere((element) => element == productData['gategory'])] =
            productData['gategory'];
      } else {
        productCategories.add(productData['gategory']);
      }
    }
    return productCategories;
  }

  Future<List<String>> fetchProductBrand() async {
    debugPrint('fetchProductBrand called!!!!! ');
    QuerySnapshot<Map<String, dynamic>> querySnapshotProduct =
        await FirebaseFirestore.instance.collection('products').get();
    for (var product in querySnapshotProduct.docs) {
      final productData = await FirebaseFirestore.instance
          .collection('products')
          .doc(product.id)
          .get();
      if (productBrands.any((element) => element == productData['brand'])) {
        productBrands[productBrands
                .indexWhere((element) => element == productData['brand'])] =
            productData['brand'];
      } else {
        productBrands.add(productData['brand']);
      }
    }
    return productBrands;
  }

  Future<List<FirebaseProduct>> fetchAllProductCategory() async {
    debugPrint('fetchAllProductCategory called!!!!! ');
    for(var product in productsList){
      if(categoriesList.isNotEmpty){
        if(categoriesList.any((element) => element.gategory == product.gategory)) {
          categoriesList[categoriesList.indexWhere(
                  (element) => element.gategory == product.gategory)] =
          FirebaseProduct(
              id: product.id,
              price: product.price,
              name: product.name,
              productDescription: product.productDescription,
              barcodeType: product.barcodeType,
              alertQuantity: product.alertQuantity,
              image: product.image,
              gategory: product.gategory,
              brand: product.brand);
          debugPrint(product.name +' add Done length > ' + categoriesList.length.toString());
        }
        else{
          categoriesList.add(FirebaseProduct(
              id: product.id,
              price: product.price,
              name: product.name,
              productDescription: product.productDescription,
              barcodeType: product.barcodeType,
              alertQuantity: product.alertQuantity,
              image: product.image,
              gategory: product.gategory,
              brand: product.brand));
          debugPrint(product.name +' add Done length > ' + categoriesList.length.toString());

        }
      }
      else{
        categoriesList.add(FirebaseProduct(
            id: product.id,
            price: product.price,
            name: product.name,
            productDescription: product.productDescription,
            barcodeType: product.barcodeType,
            alertQuantity: product.alertQuantity,
            image: product.image,
            gategory: product.gategory,
            brand: product.brand));
        debugPrint(product.name +' add Done length > ' + categoriesList.length.toString());
      }
    }

    return categoriesList;
  }

  Future<List<FirebaseProduct>> searchByBrand({required String brand}) async {
    debugPrint('searchByBrand called !!!!!');
    debugPrint('brand sent ' + brand);
    searchResultList.clear();
    debugPrint('searchResultList.clear() called !  length = ' +
        searchResultList.length.toString());
    if (productsList.isNotEmpty) {
      debugPrint('productsList isNotEmpty !!!!!');
      for (var product in productsList) {
        if (product.brand == brand) {
          debugPrint('brand in productsList is =  > ' + brand);
          searchResultList.add(FirebaseProduct(
              price: product.price,
              id: product.id,
              name: product.name,
              productDescription: product.productDescription,
              barcodeType: product.barcodeType,
              alertQuantity: product.alertQuantity,
              image: product.image,
              gategory: product.gategory,
              brand: product.brand));
          // if (searchResultList.isEmpty) {
          //   debugPrint('searchResultList isEmpty !!!!!');
          //   // {
          //   searchResultList.add(FirebaseProduct(
          //     price: product.price,
          //       id: product.id,
          //       name: product.name,
          //       productDescription: product.productDescription,
          //       barcodeType: product.barcodeType,
          //       alertQuantity: product.alertQuantity,
          //       image: product.image,
          //       gategory: product.gategory,
          //       brand: product.brand
          //   ));
          //   debugPrint('product add in  searchResultList & length = '
          //       +searchResultList.length.toString());
          //
          //   debugPrint('brand of product added is  '+product.brand);
          //   // }
          // }
          // else{
          //   debugPrint('searchResultList is not Empty ');
          //   if(searchResultList.any((element) => element.brand != brand)){
          //   searchResultList.add(FirebaseProduct(
          //       price: product.price,
          //       id: product.id,
          //       name: product.name,
          //       productDescription: product.productDescription,
          //       barcodeType: product.barcodeType,
          //       alertQuantity: product.alertQuantity,
          //       image: product.image,
          //       gategory: product.gategory,
          //       brand: product.brand
          //   ));
          //   }
          //   // searchResultList.clear();
          //   debugPrint('searchResultList NW is Empty & length =  '
          //       +searchResultList.length.toString());
          //
          //   debugPrint('product add in  searchResultList & length = '
          //       +searchResultList.length.toString());
          //   debugPrint('brand of product added is  '+product.brand);
          // }
        }
      }
    }
    return searchResultList;
  }

  Future<List<FirebaseProduct>> searchByCategory({required String category}) async {
    debugPrint('searchByCategory called !!!!!');
    debugPrint('brand sent ' + category);
    searchResultList.clear();
    debugPrint('searchResultList.clear() called !  length = ' +
        searchResultList.length.toString());
    if (productsList.isNotEmpty) {
      debugPrint('productsList isNotEmpty !!!!!');
      for (var product in productsList) {
        if (product.gategory == category) {
          debugPrint('brand in productsList is =  > ' + category);
          searchResultList.add(FirebaseProduct(
              price: product.price,
              id: product.id,
              name: product.name,
              productDescription: product.productDescription,
              barcodeType: product.barcodeType,
              alertQuantity: product.alertQuantity,
              image: product.image,
              gategory: product.gategory,
              brand: product.brand));
          // if (searchResultList.isEmpty) {
          //   searchResultList.add(FirebaseProduct(
          //     price: product.price,
          //       id: product.id,
          //       name: product.name,
          //       productDescription: product.productDescription,
          //       barcodeType: product.barcodeType,
          //       alertQuantity: product.alertQuantity,
          //       image: product.image,
          //       gategory: product.gategory,
          //       brand: product.brand
          //   ));
          //   //   }
          // }
          // else{
          //   searchResultList.clear();
          //   searchResultList.add(FirebaseProduct(
          //     price:product.price,
          //       id: product.id,
          //       name: product.name,
          //       productDescription: product.productDescription,
          //       barcodeType: product.barcodeType,
          //       alertQuantity: product.alertQuantity,
          //       image: product.image,
          //       gategory: product.gategory,
          //       brand: product.brand
          //   ));
          // }
        }
      }
    }
    return searchResultList;
  }
}
