import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../services/user_login_service.dart';
import '../widget/change_language_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page.dart';

class loginInterface extends StatefulWidget {
  const loginInterface({Key? key}) : super(key: key);

  @override
  _loginInterfaceState createState() => _loginInterfaceState();
}

class _loginInterfaceState extends State<loginInterface> {
  String username = "";
  String password = "";
  String _tokenid = '';
  bool unshow = false;

  //trying to login by using only the saved data without any extra information
  Future<bool> tryAutoLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey("tokenid")) {
      _tokenid = pref.getString("tokenid")!;
      username = pref.getString("email")!;
      password = pref.getString("email")!;
      await _getUserData();
      return true;
    }
    return false;
  }

  Future<void> _getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String firstName = pref.getString("first_name") ?? "";
    int id = pref.getInt("id") ?? 0;
    // _currentUser = UserInfo(firstName: firstName, id: id);
  }

  void _showToast() {
    Fluttertoast.showToast(msg: 'Invalid username or password ', fontSize: 18);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    color: Color.fromRGBO(92, 145, 246, 0.11),
                    offset: Offset(0, 23),
                    blurRadius: 56.0),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        AppLocalizations.of(context)!
                            .getTranslatedValue('login')
                            .toString(),
                        style: getcustomertextStyle(
                            context, 25, FontWeight.w700, Colors.black),
                      ),
                    ),
                  ],
                ),
                LanguageEnglish(context) == 'English'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.height * 0.09,
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 25, top: 25),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(14),
                                topLeft: Radius.circular(14),
                              ),
                              color: Color.fromRGBO(236, 238, 244, 1),
                            ),
                            child: SvgPicture.asset('images/add-user.svg',
                                color: const Color.fromRGBO(196, 198, 204, 1)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 0, top: 20),
                            padding: const EdgeInsets.only(
                                left: 5, top: 20, bottom: 20),
                            width: MediaQuery.of(context).size.width * 0.72,
                            height: MediaQuery.of(context).size.height * 0.09,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(13),
                                  bottomRight: Radius.circular(13),
                                ),
                                color: Color.fromRGBO(236, 238, 244, 1)),
                            child: TextField(
                              onChanged: (text) {
                                setState(() {
                                  username = text;
                                });
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)!
                                    .getTranslatedValue('username_textfield')
                                    .toString(),
                                hintStyle: getcustomertextStyle(
                                    context,
                                    15,
                                    FontWeight.normal,
                                    const Color.fromRGBO(196, 198, 204, 1)),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 0, top: 20),
                            padding: const EdgeInsets.only(
                                left: 50, top: 20, bottom: 20),
                            width: MediaQuery.of(context).size.width * 0.72,
                            height: MediaQuery.of(context).size.height * 0.09,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(13),
                                  bottomLeft: Radius.circular(13),
                                ),
                                color: Color.fromRGBO(236, 238, 244, 1)),
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              onChanged: (text) {
                                setState(() {
                                  username = text;
                                });
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)!
                                    .getTranslatedValue('username_textfield')
                                    .toString(),
                                hintStyle: getcustomertextStyle(
                                    context,
                                    15,
                                    FontWeight.normal,
                                    const Color.fromRGBO(196, 198, 204, 1)),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.height * 0.09,
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.only(
                                right: 10, bottom: 25, top: 25),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(14),
                                topRight: Radius.circular(14),
                              ),
                              color: Color.fromRGBO(236, 238, 244, 1),
                            ),
                            child: SvgPicture.asset('images/add-user.svg',
                                color: const Color.fromRGBO(196, 198, 204, 1)),
                          ),
                        ],
                      ),
                LanguageEnglish(context) == 'English'
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.height * 0.09,
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 25, top: 25),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(14),
                                topLeft: Radius.circular(14),
                              ),
                              color: Color.fromRGBO(236, 238, 244, 1),
                            ),
                            child: SvgPicture.asset(
                              'images/lock.svg',
                              color: const Color.fromRGBO(196, 198, 204, 1),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.only(
                                left: 20, top: 20, bottom: 20),
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.09,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(236, 238, 244, 1)),
                            child: TextField(
                              onChanged: (text) {
                                setState(() {
                                  password = text;
                                });
                              },
                              ///////////////////////////////////////////////
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !unshow ? true : false,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)!
                                    .getTranslatedValue('password_textfield')
                                    .toString(),
                                hintStyle: getcustomertextStyle(
                                    context,
                                    15,
                                    FontWeight.normal,
                                    const Color.fromRGBO(196, 198, 204, 1)),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                unshow = !unshow;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.12,
                              height: MediaQuery.of(context).size.height * 0.09,
                              margin: const EdgeInsets.only(top: 20),
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 25, top: 25),
                              decoration: const BoxDecoration(
                                  // color:Colors.red,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                    topRight: Radius.circular(14),
                                  ),
                                  color: Color.fromRGBO(236, 238, 244, 1)),
                              child: !unshow
                                  ? SvgPicture.asset('images/show.svg',
                                      color: const Color.fromRGBO(
                                          196, 198, 204, 1))
                                  : SvgPicture.asset('images/unshow.svg',
                                      color: const Color.fromRGBO(
                                          196, 198, 204, 1)),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                unshow = !unshow;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.12,
                              height: MediaQuery.of(context).size.height * 0.09,
                              margin: const EdgeInsets.only(top: 20),
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 25, top: 25),
                              decoration: const BoxDecoration(
                                  // color:Colors.red,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(14),
                                    topLeft: Radius.circular(14),
                                  ),
                                  color: Color.fromRGBO(236, 238, 244, 1)),
                              child: !unshow
                                  ? SvgPicture.asset('images/show.svg',
                                      color: const Color.fromRGBO(
                                          196, 198, 204, 1))
                                  : SvgPicture.asset('images/unshow.svg',
                                      color: const Color.fromRGBO(
                                          196, 198, 204, 1)),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.only(
                                left: 135, top: 20, bottom: 20),
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: MediaQuery.of(context).size.height * 0.09,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(236, 238, 244, 1)),
                            child: TextField(
                              textDirection: TextDirection.rtl,
                              onChanged: (text) {
                                setState(() {
                                  password = text;
                                });
                              },
                              ///////////////////////////////////////////////
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !unshow ? true : false,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppLocalizations.of(context)!
                                    .getTranslatedValue('password_textfield')
                                    .toString(),
                                hintStyle: getcustomertextStyle(
                                    context,
                                    15,
                                    FontWeight.normal,
                                    const Color.fromRGBO(196, 198, 204, 1)),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.09,
                            height: MediaQuery.of(context).size.height * 0.09,
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.only(
                                right: 10, bottom: 25, top: 25),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(14),
                                topRight: Radius.circular(14),
                              ),
                              color: Color.fromRGBO(236, 238, 244, 1),
                            ),
                            child: SvgPicture.asset(
                              'images/lock.svg',
                              color: const Color.fromRGBO(196, 198, 204, 1),
                            ),
                          )
                        ],
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.84,
                      height: MediaQuery.of(context).size.height * 0.08,
                      margin: const EdgeInsets.only(right: 0.0, top: 47),
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(92, 145, 246, 0.11),
                            offset: Offset(0, 8),
                            blurRadius: 28.0),
                      ]),
                      child: RaisedButton(
                        child: Text(
                          AppLocalizations.of(context)!
                              .getTranslatedValue('signIn')
                              .toString(),
                          style: getcustomertextStyle(
                              context, 20, FontWeight.w400, Colors.white),
                        ),
                        color: const Color.fromRGBO(210, 140, 84, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onPressed: () async {
                          bool validation =
                              await UserLoginApi().logIn(username, password);
                          if (validation) {
                            Get.off(const MyHomePage());
                          } else {
                            _showToast();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
