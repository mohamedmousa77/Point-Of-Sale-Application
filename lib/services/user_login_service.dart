import 'dart:convert' as convert;

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/user_login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../const/links.dart';
import '../controllers/user_controller.dart';

class UserLoginApi {
  //the format of the data
  final String _formatName = LinksUrl().formatName;

  // this method used to login in the application
  Future<bool> logIn(String username, String password) async {
    //the url of the login
    final String url = LinksUrl().userLoginUrl;
    //the response result
    Map<String, dynamic>? jsonResponse;
    try {
      //I'm sending a request to api to validate the username and password
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {"Accept": _formatName},
        body: {
          "email": username,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        //this variable will deserialize the data comes from api
        jsonResponse = convert.jsonDecode(response.body);
        // //the parsing of all data that comes from internet
        Get.find<UserController>().setCurrentUser(
          UserLogin.fromJson(
            jsonResponse!["data"],
          ),
        );

        _saveLoginData(jsonResponse["data"]["token"], username, password);
        //the function will return true if the username and password are correct
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw ("Class(UserLoginApi  ---  Function(login) ---- Error($error)");
    }
  }

  Future<void> _saveLoginData(
    String tokenid,
    String email,
    String password,
  ) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("tokenid", tokenid);
    _pref.setString("email", email);
    _pref.setString("password", password);
  }

  // this method used to logout from the application
  Future<bool> logout() async {
    //the url of the login
    final String url = LinksUrl().userLogoutUrl;
    //the response result
    Map<String, dynamic>? jsonResponse;
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": _formatName,
          "Authorization":
              "Bearer ${Get.find<UserController>().currentUser.token}",
        },
      );
      if (response.statusCode == 200) {
        //this variable will deserialize the data comes from api
        jsonResponse = convert.jsonDecode(response.body);
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.clear();
        Get.find<UserController>().setCurrentUser(UserLogin.empty());
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw ("Class(UserLoginApi  ---  Function(logout) ---- Error($error)");
    }
  }

  // this method used to reset and update the password
  Future<bool> resetPassword(
      String password, String confirmationPassword) async {
    //the url of the reset password
    final String _url = LinksUrl().resetPassword;

    //the response result
    Map<String, dynamic>? jsonResponse;
    try {
      //I'm sending a request to api to set a new password
      http.Response response = await http.post(
        Uri.parse(_url),
        headers: {
          "Accept": _formatName,
          "Authorization":
              "Bearer ${Get.find<UserController>().currentUser.token}",
        },
        body: {
          "password": password,
          "password_confirmation": confirmationPassword
        },
      );

      if (response.statusCode == 200) {
        //this variable will deserialize the data comes from api
        jsonResponse = convert.jsonDecode(response.body);
        //the function will return true if the proccess of updating password success
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw ("Class(UserLoginApi  ---  Function(resetPassword) ---- Error($error)");
    }
  }
}
