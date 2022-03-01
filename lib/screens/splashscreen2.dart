import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pos_application/controllers/user_controller.dart';
import 'package:pos_application/models/user_login_model.dart';
import '../home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String _tokenid = '';
  String useremail = '';
  String password = '';

  //trying to login by using only the saved data without any extra information
  Future<bool> tryAutoLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("tokenid")) {
      _tokenid = pref.getString("tokenid")!;
      useremail = pref.getString("email")!;
      password = pref.getString("password")!;
      await _getUserData(_tokenid);
      return true;
    }
    return false;
  }

  Future<void> _getUserData(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String firstName = pref.getString("first_name") ?? "";
    int id = pref.getInt("id") ?? 0;
    int businessId = pref.getInt("business_id") ?? 1;
    Get.find<UserController>().setCurrentUser(
      UserLogin(
        id: id,
        firstName: firstName,
        token: token,
        businessId: 1,
      ),
    );
  }

  @override
  void initState() {
    //creating the timer for the splash screen to load the data and to show the company icon
    Timer(
      const Duration(seconds: 3),
      () async {
        tryAutoLogin().then((value) {
          value
              ?
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>AuthPage()));
              Get.off(() => MyHomePage())
              : Get.off(() => AuthPage());
        });

        // Get.to(() => PrinterScreen());
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/image-2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(53, 50, 34, 0.96),
            Color.fromRGBO(34, 53, 53, 1)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: 200, bottom: 100, right: 70, left: 70),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset(
                  'images/Group.svg',
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 200, bottom: 100),
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset(
                  'images/logo.svg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
