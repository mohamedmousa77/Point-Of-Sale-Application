import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../services/user_login_service.dart';
import '../widget/change_language_style.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String _oldPassword = "";
  String _newPassword = "";
  String _confirmationOfPassword = "";
  String massageOfError = "";
  bool unshow_1 = false;
  bool unshow_2 = false;
  bool unshow_3 = false;

  void _showToast(String massage) {
    Fluttertoast.showToast(msg: massage, fontSize: 18);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //appbar
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(248, 248, 248, 1),
              ),
            ),
            customAppBar(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.035),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.725,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LanguageEnglish(context) == 'English'
                        ? Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(14),
                                    topLeft: Radius.circular(14),
                                  ),
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                margin:
                                    const EdgeInsets.only(top: 100, left: 30),
                                padding: const EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width * 0.07,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: SvgPicture.asset('images/lock.svg'),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                margin: const EdgeInsets.only(top: 100),
                                width:
                                    MediaQuery.of(context).size.width * 0.675,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                child: TextField(
                                  onChanged: (text) {
                                    setState(() {
                                      _oldPassword = text;
                                    });
                                  },
                                  obscureText: !unshow_1 ? true : false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: AppLocalizations.of(context)!
                                          .getTranslatedValue('old_password')
                                          .toString(),
                                      labelStyle: getcustomertextStyle(
                                          context,
                                          14,
                                          FontWeight.normal,
                                          const Color.fromRGBO(
                                              196, 198, 204, 1))),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unshow_1 = !unshow_1;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  margin: const EdgeInsets.only(top: 100),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 25, top: 25),
                                  decoration: const BoxDecoration(
                                    // color:Colors.red,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(14),
                                      topRight: Radius.circular(14),
                                    ),
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                  ),
                                  child: !unshow_1
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
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unshow_1 = !unshow_1;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  margin:
                                      const EdgeInsets.only(top: 100, left: 30),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 25, top: 25),
                                  decoration: const BoxDecoration(
                                    // color:Colors.red,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(14),
                                      topLeft: Radius.circular(14),
                                    ),
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                  ),
                                  child: !unshow_1
                                      ? SvgPicture.asset('images/show.svg',
                                          color: const Color.fromRGBO(
                                              196, 198, 204, 1))
                                      : SvgPicture.asset('images/unshow.svg',
                                          color: const Color.fromRGBO(
                                              196, 198, 204, 1)),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 130, top: 10),
                                margin: const EdgeInsets.only(top: 100),
                                width:
                                    MediaQuery.of(context).size.width * 0.675,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                child: TextField(
                                  textDirection: TextDirection.rtl,
                                  onChanged: (text) {
                                    setState(() {
                                      _oldPassword = text;
                                    });
                                  },
                                  obscureText: !unshow_1 ? true : false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: AppLocalizations.of(context)!
                                          .getTranslatedValue('old_password')
                                          .toString(),
                                      labelStyle: getcustomertextStyle(
                                          context,
                                          14,
                                          FontWeight.normal,
                                          const Color.fromRGBO(
                                              196, 198, 204, 1))),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                    topRight: Radius.circular(14),
                                  ),
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                margin: const EdgeInsets.only(top: 100),
                                padding: const EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.07,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: SvgPicture.asset('images/lock.svg'),
                              ),
                            ],
                          ),
                    LanguageEnglish(context) == 'English'
                        ? Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(14),
                                    topLeft: Radius.circular(14),
                                  ),
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                margin:
                                    const EdgeInsets.only(top: 20, left: 30),
                                padding: const EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width * 0.07,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: SvgPicture.asset('images/lock.svg'),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                margin: const EdgeInsets.only(top: 20),
                                width:
                                    MediaQuery.of(context).size.width * 0.675,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                child: TextField(
                                  onChanged: (text) {
                                    setState(() {
                                      _newPassword = text;
                                    });
                                  },
                                  obscureText: !unshow_2 ? true : false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: AppLocalizations.of(context)!
                                          .getTranslatedValue('new_password')
                                          .toString(),
                                      labelStyle: getcustomertextStyle(
                                          context,
                                          14,
                                          FontWeight.normal,
                                          const Color.fromRGBO(
                                              196, 198, 204, 1))),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unshow_2 = !unshow_2;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  margin: const EdgeInsets.only(top: 20),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 25, top: 25),
                                  decoration: const BoxDecoration(
                                    // color:Colors.red,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(14),
                                      topRight: Radius.circular(14),
                                    ),
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                  ),
                                  child: !unshow_2
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
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unshow_2 = !unshow_2;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  margin:
                                      const EdgeInsets.only(top: 20, left: 30),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 25, top: 25),
                                  decoration: const BoxDecoration(
                                    // color:Colors.red,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(14),
                                      topLeft: Radius.circular(14),
                                    ),
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                  ),
                                  child: !unshow_2
                                      ? SvgPicture.asset('images/show.svg',
                                          color: const Color.fromRGBO(
                                              196, 198, 204, 1))
                                      : SvgPicture.asset('images/unshow.svg',
                                          color: const Color.fromRGBO(
                                              196, 198, 204, 1)),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 130, top: 10),
                                margin: const EdgeInsets.only(top: 20),
                                width:
                                    MediaQuery.of(context).size.width * 0.675,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                child: TextField(
                                  textDirection: TextDirection.rtl,
                                  onChanged: (text) {
                                    setState(() {
                                      _newPassword = text;
                                    });
                                  },
                                  obscureText: !unshow_2 ? true : false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: AppLocalizations.of(context)!
                                          .getTranslatedValue('new_password')
                                          .toString(),
                                      labelStyle: getcustomertextStyle(
                                          context,
                                          14,
                                          FontWeight.normal,
                                          const Color.fromRGBO(
                                              196, 198, 204, 1))),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                    topRight: Radius.circular(14),
                                  ),
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                margin: const EdgeInsets.only(top: 20),
                                padding: const EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.07,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: SvgPicture.asset('images/lock.svg'),
                              ),
                            ],
                          ),
                    LanguageEnglish(context) == 'English'
                        ? Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(14),
                                    topLeft: Radius.circular(14),
                                  ),
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                margin:
                                    const EdgeInsets.only(top: 20, left: 30),
                                // padding:EdgeInsets.only(left: 20 ,top: 10),
                                padding: const EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width * 0.07,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: SvgPicture.asset('images/lock.svg'),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                margin: const EdgeInsets.only(top: 20),
                                width:
                                    MediaQuery.of(context).size.width * 0.675,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                child: TextField(
                                  onChanged: (text) {
                                    setState(() {
                                      _confirmationOfPassword = text;
                                    });
                                  },
                                  obscureText: !unshow_3 ? true : false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: AppLocalizations.of(context)!
                                          .getTranslatedValue(
                                              'confirm_new_password')
                                          .toString(),
                                      labelStyle: getcustomertextStyle(
                                          context,
                                          14,
                                          FontWeight.normal,
                                          const Color.fromRGBO(
                                              196, 198, 204, 1))),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unshow_3 = !unshow_3;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  margin: const EdgeInsets.only(top: 20),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 25, top: 25),
                                  decoration: const BoxDecoration(
                                    // color:Colors.red,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(14),
                                      topRight: Radius.circular(14),
                                    ),
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                  ),
                                  child: !unshow_3
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
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    unshow_3 = !unshow_3;
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.12,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  margin:
                                      const EdgeInsets.only(top: 20, left: 30),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, bottom: 25, top: 25),
                                  decoration: const BoxDecoration(
                                    // color:Colors.red,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(14),
                                      topLeft: Radius.circular(14),
                                    ),
                                    color: Color.fromRGBO(248, 248, 248, 1),
                                  ),
                                  child: !unshow_3
                                      ? SvgPicture.asset('images/show.svg',
                                          color: const Color.fromRGBO(
                                              196, 198, 204, 1))
                                      : SvgPicture.asset('images/unshow.svg',
                                          color: const Color.fromRGBO(
                                              196, 198, 204, 1)),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 50, top: 10),
                                margin: const EdgeInsets.only(top: 20),
                                width:
                                    MediaQuery.of(context).size.width * 0.675,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                child: TextField(
                                  textDirection: TextDirection.rtl,
                                  onChanged: (text) {
                                    setState(() {
                                      _confirmationOfPassword = text;
                                    });
                                  },
                                  obscureText: !unshow_3 ? true : false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: AppLocalizations.of(context)!
                                          .getTranslatedValue(
                                              'confirm_new_password')
                                          .toString(),
                                      labelStyle: getcustomertextStyle(
                                          context,
                                          14,
                                          FontWeight.normal,
                                          const Color.fromRGBO(
                                              196, 198, 204, 1))),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(14),
                                    topRight: Radius.circular(14),
                                  ),
                                  color: Color.fromRGBO(248, 248, 248, 1),
                                ),
                                margin: const EdgeInsets.only(top: 20),
                                // padding:EdgeInsets.only(left: 20 ,top: 10),
                                padding: const EdgeInsets.only(right: 10),
                                width: MediaQuery.of(context).size.width * 0.07,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: SvgPicture.asset('images/lock.svg'),
                              ),
                            ],
                          ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      margin: const EdgeInsets.only(top: 20, right: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.08,
                        child: RaisedButton(
                          color: const Color.fromRGBO(210, 140, 84, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onPressed: () async {
                            bool checkTheOldPassword = await UserLoginApi()
                                .logIn("admin@arabbadia.com", _oldPassword);
                            bool checkTheNewPassword = await UserLoginApi()
                                .resetPassword(
                                    _newPassword, _confirmationOfPassword);
                            if (checkTheOldPassword == true &&
                                checkTheNewPassword == true) {
                              _showToast("Password updated");
                              setState(() {
                                massageOfError = "Password updated";
                                _oldPassword = "";
                                _newPassword = "";
                                _confirmationOfPassword = "";
                              });
                            } else if (checkTheOldPassword == true &&
                                checkTheNewPassword == false) {
                              _showToast("Try correcting the new password");
                              setState(() {
                                massageOfError =
                                    "Try correcting the new password";
                              });
                            } else if (checkTheOldPassword == false &&
                                checkTheNewPassword == true) {
                              _showToast("Try correcting the old password");
                              setState(() {
                                massageOfError =
                                    "Try correcting the old password";
                              });
                            } else {
                              _showToast("Try again");
                              setState(() {
                                massageOfError = "Try again";
                              });
                            }
                          },
                          child: Text(
                              AppLocalizations.of(context)!
                                  .getTranslatedValue('change_password')
                                  .toString(),
                              style: getcustomertextStyle(
                                  context, 20, FontWeight.w400, Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(4),
    );
  }
}
