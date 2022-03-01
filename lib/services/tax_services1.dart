import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pos_application/controllers/user_controller.dart';
import '../const/links.dart';

class TaxService {
  Future<double> getTax() async {
    try {
      Uri link = Uri.https("pos.our2030vision.com", "api/tax");
      http.Response res = await http.get(
        link,
        headers: {
          "Accept": LinksUrl().formatName,
          "Authorization":
          "Bearer ${Get.find<UserController>().currentUser.token}"
        },
      );
      if (res.statusCode == 200) {
        Map<String, dynamic> resData = json.decode(res.body);
        return double.parse(resData["data"][0]["amount"]);
      } else {
        throw "TAX_SERVICE status code: ${res.statusCode}";
      }
    } catch (error) {
      print("Error $error");
      rethrow;
    }
  }
}
