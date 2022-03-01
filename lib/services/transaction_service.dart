import 'dart:convert' as convert;

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../const/links.dart';
import '../controllers/user_controller.dart';
import '../models/transaction_model.dart';

class TransactionApi {
  //the url of all the transactions
  static String getTransactionUrl = LinksUrl().transactionUrl;

  //the format of the data
  final String _formatName = LinksUrl().formatName;

  //list of Transactionss
  List<Transaction> transactionList = [];

//this method will fetch all the transactions
  Future<List<Transaction>> getTransactionFromJson() async {
    try {
      //the response result
      Map<String, dynamic> jsonResponse;

      //the response
      http.Response response;

      //here i am sending a request to get all the transactions
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
        // transactionList = List<Transaction>.from(
        //     jsonResponse["data"].map((x) => Transaction.fromJson(x)));
        for (Map<String, dynamic> transaction in jsonResponse["data"]) {
          transactionList.add(Transaction.fromJson(transaction));
        }
        return transactionList;
      } else {
        throw ('Request faild with status: ${response.statusCode}');
      }
    } catch (exeption) {
      throw ("CLASS(TransactionApi) ------ FUNCTION(getTransactionFromJson)  ---- Exeption($exeption)");
    }
  }
}
