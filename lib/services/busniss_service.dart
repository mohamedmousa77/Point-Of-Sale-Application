import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../const/links.dart';
import '../models/busniss_model.dart';

class BusnissApi {
  //the busniss url
  static String getBusnissUrl = LinksUrl().busnissUrl;

  //the format of the data
  final String _formatName = LinksUrl().formatName;

  //list of busnisses
  List<Business>? busnissList = [];

// this method will return all the busniss
  Future<List<Business>> getBusnissFromJson() async {
    try {
      //the response result
      Map<String, dynamic> jsonResponse;

      //the response
      http.Response response;

      //here i am sending a request to get all the busnisses
      response = await http.get(
        Uri.parse(getBusnissUrl),
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
        busnissList = List<Business>.from(
            jsonResponse["data"].map((x) => Business.fromJson(x)));

        return busnissList!;
      } else {
        throw ('Request faild with status: ${response.statusCode}');
      }
    } catch (exeption) {
      throw ("CLASS(BusnissApi) ------ FUNCTION(getBusnissFromJson) --- Exeption  $exeption");
    }
  }
}
