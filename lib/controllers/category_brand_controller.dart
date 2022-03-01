import 'package:get/get.dart';
import 'package:pos_application/models/brand_model.dart';
import 'package:pos_application/services/category_service.dart';
import '../models/category_model.dart';

class CategoryController extends GetxController {
  //this will be true when the data is loading,
  //but when the data has done, it will be false
  bool isLoading = true;

  //this is the value of dropdown button of the brand
  int? selectedValue;

  //this is the value of dropdown button of the section
  int? selectedValueSection;

  //this list will contain all the category
  List<Category> categoryList = [];
  //this list will contain all the brands
  List<Brand> brandList = [];

  // the result of the search
  Map<String, dynamic> result = {};

  void changeSelectedValue(int? value) {
    selectedValue = value;
    update();
  }

  void changeSelectedValueSection(int? value) {
    selectedValueSection = value;
    update();
  }

//this method will fetch all the Category and brands
  Future<void> fetchData() async {
    try {
      //if the application in proccess to get the data, this means that the app
      //is weating
      isLoading = true;

      result = await CategoryApi().getHomedata();

      //assigning all the elements of category and brands that came
      //from api to the variable "categoryList", "brandList"
      if (result.isNotEmpty) {
        categoryList = result["category"];
        brandList = result["brands"];
        update();
      }
    } finally {
      //after the respose done, this variable will be converted to "false"
      isLoading = false;
    }
  }
}
