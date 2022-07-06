import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import '../const/links.dart';
import '../models/product_model.dart';

class ProductApi {
  //the format of the data
  final String _formatName = LinksUrl().formatName;

  //the url of the products
  final String _productUrl = LinksUrl().productUrl;

  Future<List<Product>> search({
    int? categoryId,
    int? brandId,
    int? idProduct,
    String? barcodeType,
    String? nameProduct,
  }) async {
    Map<String, dynamic> jsonResponse;

    //the response
    http.Response response;

    //list of products
    List<Product> productList = [];

    //the body data
    Map<String, dynamic> bodyData = {
      "category_id": categoryId == null ? "" : categoryId.toString(),
      "brand_id": brandId == null ? "" : brandId.toString(),
      "business_id":
          Get.find<UserController>().currentUser.businessId.toString(),
      "barcode_type": barcodeType ?? "",
      "id": idProduct == null ? "" : idProduct.toString(),
      "name": nameProduct ?? ""
    };

    try {
      //here i am sending a request to the "_productUrl"
      response = await http.post(
        Uri.parse(_productUrl),
        headers: {
          "Accept": _formatName,
          "Content-Type": _formatName,
          "Authorization": "Bearer ${Get.find<UserController>().currentUser.token}"
        },
        body: json.encode(bodyData),
      );

      if (response.statusCode == 200) {
        //this variable contain all the data that comes from the request,
        //then we parse the data comes from the API
        jsonResponse = convert.jsonDecode(response.body);

        //the parsing of all the data
        productList = List<Product>.from(
            jsonResponse["data"].map((x) => Product.fromJson(x)));

        return productList;
      } else {
        throw ('Request faild with status: ${response.statusCode}');
      }
    } catch (exeption) {
      throw ("CLASS(ProductApi) ------ FUNCTION(search  ---- Exeption($exeption)");
    }
  }

  //this method will return the price of a product
  Future<String> getPriceOfTheProduct(String id) async {
    //the url of the price
    final _priceUrl = LinksUrl().productPriceUrl + "$id";

    //the response result
    Map<String, dynamic> jsonResponse;
    //the response
    http.Response response;

    try {
      //here i am sending a request to the get the price
      response = await http.get(
        Uri.parse(_priceUrl),
        headers: {
          "Accept": _formatName,
          "Authorization":
              "Bearer ${Get.find<UserController>().currentUser.token}"
        },
      );

      if (response.statusCode == 200) {
        //this variable contain all the data that comes from the request,
        //then we parse the data comes from the API
        jsonResponse = convert.jsonDecode(response.body);
        //the price
        String _price = jsonResponse['data'][0]['default_sell_price'];

        return _price;
      } else {
        throw ('Request faild with status: ${response.statusCode}');
      }
    } catch (exeption) {
      throw ("CLASS(ProductApi) ------ FUNCTION(getPriceOfTheProduct)  ---- Exeption($exeption)");
    }
  }
}
