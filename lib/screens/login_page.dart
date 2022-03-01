import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../widget/change_language_style.dart';
import '../widget/dropdown_menu.dart';
import '../widget/language_dropdown_menu.dart';
import '../widget/login_interface.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/image-1.jpg',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Color.fromRGBO(34, 53, 53, 0.9),
                      BlendMode.darken,
                    ),
                  ),
                  // color: Color.fromRGBO(34, 53, 53, 1),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(80),
                    bottomLeft: Radius.circular(80),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: SvgPicture.asset('images/Group.svg'),
                  ),
                  const loginInterface(),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(236, 238, 244, 1),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: LanguageDropDownMenu(),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: LanguageEnglish(context) == 'English'
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    AppLocalizations.of(context)!
                                        .getTranslatedValue('powered_by')
                                        .toString(),
                                    style: getcustomertextStyle(context, 16,
                                        FontWeight.w500, Colors.black)),
                                Text(
                                    AppLocalizations.of(context)!
                                        .getTranslatedValue('arab_badia')
                                        .toString(),
                                    style: getcustomertextStyle(context, 16,
                                        FontWeight.w700, Colors.black)),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    AppLocalizations.of(context)!
                                        .getTranslatedValue('arab_badia')
                                        .toString(),
                                    style: getcustomertextStyle(context, 16,
                                        FontWeight.w700, Colors.black)),
                                Text(
                                    AppLocalizations.of(context)!
                                        .getTranslatedValue('powered_by')
                                        .toString(),
                                    style: getcustomertextStyle(context, 16,
                                        FontWeight.w500, Colors.black)),
                              ],
                            ))
                ],
              ),
            ],
          )),
    );
  }
}
