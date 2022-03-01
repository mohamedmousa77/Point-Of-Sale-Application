import 'dart:convert' as convert;

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pos_application/models/brand_model.dart';

import '../const/links.dart';
import '../controllers/user_controller.dart';
import '../models/category_model.dart';

class CategoryApi {
  //the format of the data
  final String _formatName = LinksUrl().formatName;
  // the url of all categories
  final String getGategoryUrl = LinksUrl().categoryUrl;

//this method will fetch all the Category
  Future<Map<String, dynamic>> getHomedata() async {
    //list of Categories
    List<Category> categoryList = [];
    List<Brand> brandList = [];

    //the response result
    Map<String, dynamic> jsonResponse;
    Map<String, dynamic> result = {};

    //the response
    http.Response response;

    try {
      //here i am sending a request all the categories
      response = await http.get(
        Uri.parse(getGategoryUrl),
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

        //assigning the value to category
        categoryList = List<Category>.from(
            jsonResponse["data"]["category"].map((x) => Category.fromJson(x)));
        result.putIfAbsent("category", () => categoryList);

        //assigning the value to brands
        brandList = List<Brand>.from(
            jsonResponse["data"]["brands"].map((x) => Brand.fromJson(x)));
        result.putIfAbsent("brands", () => brandList);

        return result;
      } else {
        throw ('Request faild with status: ${response.statusCode}');
      }
    } catch (exeption) {
      throw ("CLASS(CatrgoryApi) ------ FUNCTION(getHomedata()) ----- Exeption($exeption)");
    }
  }
}
