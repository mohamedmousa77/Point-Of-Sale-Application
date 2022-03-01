import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../const/links.dart';
import '../controllers/user_controller.dart';

class DropDownMenuSection extends StatefulWidget {
  const DropDownMenuSection({Key? key}) : super(key: key);

  @override
  _DropDownMenuSectionState createState() => _DropDownMenuSectionState();
}

class _DropDownMenuSectionState extends State<DropDownMenuSection> {
  String? _mySelection;

// the url of all categories
  final String getGategoryUrl = LinksUrl().categoryUrl;
  //the format of the data
  final String _formatName = LinksUrl().formatName;

  //list of Categories
  List categoryList = [];

//this method will fetch all the Category
  Future<void> getGategoryFromJson() async {
    //the response result
    Map<String, dynamic> jsonResponse;

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

        setState(() {
          categoryList = jsonResponse['data'];
        });
        throw (categoryList);
      } else {
        throw ('Request faild with status: ${response.statusCode}');
      }
    } catch (exeption) {
      throw ("CLASS(CatrgoryApi) ------ FUNCTION(getGategoryFromJson()) ----- Exeption($exeption)");
    }
  }

  @override
  void initState() {
    super.initState();
    getGategoryFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hospital Management"),
      ),
      body: Center(
        child: DropdownButton(
          items: categoryList.map((item) {
            return DropdownMenuItem(
              child: Text(item['name']),
              value: item['id'].toString(),
            );
          }).toList(),
          onChanged: (newVal) {
            setState(() {
              _mySelection = newVal as String?;
            });
          },
          value: _mySelection,
        ),
      ),
    );
  }
}
