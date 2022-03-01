import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import '../classes/language.dart';
import '../classes/localization_const.dart';
import '../functions/change_language.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.68,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.white),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    changeLanguage(context, Language.languageList(context)[0]);
                    Phoenix.rebirth(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 50, right: 15, left: 15),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(248, 248, 248, 1),
                      // color: Colors.red
                    ),
                    child: Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.only(left: 30, right: 10),
                            child: const Text('🇺🇸',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            padding: const EdgeInsets.only(right: 200),
                            child: const Text('EN',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            child: LanguageEnglish(context) == 'English'
                                ? const Icon(Icons.check_circle_rounded)
                                : null)
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    changeLanguage(context, Language.languageList(context)[1]);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 25, right: 15, left: 15),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(248, 248, 248, 1),
                      // color: Colors.red
                    ),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 30, right: 10),
                            child: Text('🇪🇬',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)
                                // GoogleFonts.montserrat(textStyle:  TextStyle(fontSize: 13 , fontWeight: FontWeight.bold))
                                )),
                        Container(
                            padding: EdgeInsets.only(right: 200),
                            child: Text('AR',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold)
                                // GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 13 , fontWeight: FontWeight.bold))
                                )),
                        Container(
                            child: LanguageEnglish(context) != 'English'
                                ? Icon(Icons.check_circle_rounded)
                                : null)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(4),
    );
  }
}
