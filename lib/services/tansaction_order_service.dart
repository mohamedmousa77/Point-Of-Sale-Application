import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos_application/database/note.dart';

import '../const/links.dart';
import '../models/product_model.dart';
import '../controllers/user_controller.dart';

class OrderApi {
  //the format of the data
  final String _formatName = LinksUrl().formatName;

  //this method will post a transaction
  Future<int> addOrderTransaction({
    required double totalBeforeTax,
    required List<Car> products,
    String resOrderStatus = "null",
    String type = "sell",
    String status = "paid",
    String discountType = "percentage",
    String payTermType = "days",
    int taxId = 0,
    int isQuotation = 0,
    double taxAmount = 0,
    double exchangeRate = 0,
  }) async {
    try {
      //the response
      http.Response response;

      //the value of the response
      Map<String, dynamic> jsonResponse;

      List<Map<String, dynamic>> list = [];

      for (Car car in products) {
        list.add(car.toTransactionMap());
      }

      //the data of body that will be sent to the api
      Map<String, dynamic> bodyData = {
        "business_id": 3,
        "res_order_status": "received",
        "type": "type",
        "status": "paid",
        "tax_id": 1,
        "tax_amount": 0.0000,
        "discount_type": "fixed",
        "exchange_rate": 1.000,
        "created_by": 1,
        "pay_term_type": "days",
        "is_quotation": 0,
        "transaction_date": "2020-05-20",
        "total_before_tax": 250,
        "products": list,
      };

      //here i am sending a request to add an order
      response = await http.post(
        Uri.parse(LinksUrl().transactionUrl),
        headers: {
          "Content-Type": _formatName,
          "Accept": _formatName,
          "Authorization":
              "Bearer ${Get.find<UserController>().currentUser.token}"
        },
        body: json.encode({
          "business_id": Get.find<UserController>().currentUser.businessId,
          "res_order_status": "received",
          "type": "null",
          "status": "paid",
          "tax_id": 1,
          "tax_amount": 0.0000,
          "discount_type": "fixed",
          "exchange_rate": 1.000,
          "created_by": Get.find<UserController>().currentUser.id,
          "pay_term_type": "days",
          "is_quotation": 0,
          "transaction_date": DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
          "total_before_tax": 250,
          "products": list,
        }),
      );

      if (response.statusCode == 200) {
        Map<String , dynamic> responseData = json.decode(response.body);
        return responseData['data']['transaction_id'];
      } else {
        throw ("Order didnt added successfuly");
      }
    } catch (error) {
      print(error);
      throw ("Error $error");
    }
  }
}
