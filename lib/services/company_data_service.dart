import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controllers/user_controller.dart';
import '../const/links.dart';
import '../models/company_model.dart';

class CompanyDataService {
  Future<CompanyInfo> getCompanyData() async {
    try {
      Uri link = Uri.https("pos.our2030vision.com", "api/setting");
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
        return CompanyInfo.fromJSON(resData["data"][0]);
      } else {
        throw "TAX_SERVICE status code: ${res.statusCode}";
      }
    } catch (error) {
      print("Error $error");
      rethrow;
    }
  }
}
