import 'dart:convert' as convert;

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../const/links.dart';
import '../controllers/user_controller.dart';
import '../models/transaction_selling.dart';

class TransactionSellingApi {
  //the format of the data
  final String _formatName = LinksUrl().formatName;

  //this method will fetch all the trnansaction selling from the api
  Future<List<TransactionSelling>> getTransactionSelling() async {
    //the url of all the transaction selling
    final String getTransactionSellingUrl = LinksUrl().transactionSellingUrl;
    //list of products
    List<TransactionSelling>? trnansactionSellingList = [];

    try {
      //the response result
      Map<String, dynamic> jsonResponse;

      //the response
      http.Response response;

      //here i am sending a request to get all the transaction selling
      response = await http.get(
        Uri.parse(getTransactionSellingUrl),
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

        //the parsing of all the data
        trnansactionSellingList = List<TransactionSelling>.from(
            jsonResponse["data"].map((x) => TransactionSelling.fromJson(x)));

        return trnansactionSellingList;
      } else {
        throw ('Request faild with status: ${response.statusCode}');
      }
    } catch (exeption) {
      throw ("CLASS(TransactionSellingApi) ------ FUNCTION(getTransactionSelling)  ---- Exeption($exeption)");
    }
  }

  Future<List<TransactionSelling>> searchByTransactionId(String id) async {
    //the url of all the transaction selling
    final String getTransactionUrl =
        LinksUrl().transactionSearchByTransactionId + id;
    //list of products
    List<TransactionSelling> trnansactionSellingList = [];

    try {
      //the response result
      Map<String, dynamic> jsonResponse;

      //the response
      http.Response response;

      //here i am sending a request to get all the transaction selling
      response = await http.get(
        Uri.parse(getTransactionUrl),
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

        //the parsing of all the data

        trnansactionSellingList = List<TransactionSelling>.from(
            jsonResponse["data"].map((x) => TransactionSelling.fromJson(x)));
        return trnansactionSellingList;
      } else {
        throw ('Request faild with status: ${response.statusCode}');
      }
    } catch (exeption) {
      throw ("CLASS(TransactionSellingApi) ------ FUNCTION(getTransactionSelling)  ---- Exeption($exeption)");
    }
  }
}
