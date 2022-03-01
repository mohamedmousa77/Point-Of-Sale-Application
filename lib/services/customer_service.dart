import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../const/links.dart';
import '../controllers/user_controller.dart';

class CustomerApi {
  //the format of the data
  final String _formatName = LinksUrl().formatName;

  Future<bool> addCustomerToJson(String name, String numberphone,)
  async {
    try {
      //the response
      http.Response response;

      //the data of body that will be sent to the api
      Map<String, dynamic> bodyData = {
        "type": "company",
        "supplier_business_name": "",
        "name": name,
        "mobile": numberphone.toString(),
        "business_id": Get.find<UserController>().currentUser.businessId.toString(),
        "first_name": name.split(" ").first,
        "created_by": Get.find<UserController>().currentUser.id.toString(),
      };
      //here i am sending a request to ad a customer
      response = await http.post(
        Uri.parse(LinksUrl().addCustomerUrl),
        headers: {
          "Accept": _formatName,
          "Authorization": "Bearer ${Get.find<UserController>().currentUser.token}"
        },
        body: bodyData,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("Error $error");
      return false;
    }
  }

  //this method will search about a Customer using its id
  Future<String?> searchById(String id) async {
    //the url of the search
    final String _customerSearchByIdUrl = LinksUrl().customerSearchById + id;

    //the response result
    Map<String, dynamic> jsonResponse;
    //the response
    http.Response response;

    try {
      //here i am sending a request to the search about customer using its id
      response = await http.get(
        Uri.parse(_customerSearchByIdUrl),
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

        return jsonResponse["data"][0]["name"];
      } else {
        throw ('Request faild with status: ${response.statusCode}');
      }
    } catch (exeption) {
      throw ("CLASS(CustomerApi) ------ FUNCTION(SearchById)  ---- Exeption($exeption)");
    }
  }

  Future<List<Map<String , String>>> searchByName(String name) async {
    print('Called');
    //the url of the search
    // final String _customerSearchByIdUrl = LinksUrl().customerSearchById + id;

    //the response result
    Map<String, dynamic> jsonResponse;
    //the response
    http.Response response;


    // list where the customer's data will saved
    List<Map<String , String>> CustomerNames =[];
    try {
      //here i am sending a request to the search about customer using its id
      print('gett');
      response = await http.get(
        Uri.parse('https://pos.our2030vision.com/api/customer/${name}'),
        headers: {
          "Accept": _formatName,
          "Authorization":
          "Bearer ${Get.find<UserController>().currentUser.token}"
        },
        // body : json.encode(bodyData),
      );

      if (response.statusCode == 200) {
        //this variable contain all the data that comes from the request,
        //then we parse the data comes from the API
        jsonResponse = convert.jsonDecode(response.body);

        for(Map<String,dynamic>cutomer in jsonResponse['data']){
          CustomerNames.add({'name':cutomer['name'],'address':cutomer['address_line_1']??''});
        }
        print(CustomerNames);
        return CustomerNames;
      } else {
        throw ('Request faild with status: ${response.statusCode}');
      }
    } catch (exeption) {
      throw ("CLASS(CustomerApi) ------ FUNCTION(SearchById)  ---- Exeption($exeption)");
    }
  }
}
