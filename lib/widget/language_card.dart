import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../screens/changelanguage.dart';
import '../widget/change_language_style.dart';

Widget languageCard(BuildContext context) {
  return LanguageEnglish(context) == 'English'
      ? FlatButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => ChangeLanguage())),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(248, 248, 248, 1),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    AppLocalizations.of(context)!
                        .getTranslatedValue('SelectlanguageText')
                        .toString(),
                    style: getcustomertextStyle(context, 18, FontWeight.bold,
                        const Color.fromRGBO(34, 53, 53, 1)),
                  ),
                ),
                Container(
                    //'EG','🇪🇬'
                    padding: const EdgeInsets.only(left: 110),
                    child: Text(
                      LanguageEnglish(context) == 'English' ? '🇺🇸' : '🇪🇬',
                      style: getcustomertextStyle(context, 13, FontWeight.bold,
                          const Color.fromRGBO(34, 53, 53, 1)),
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      LanguageEnglish(context) == 'English' ? 'EN' : 'AR',
                      style: getcustomertextStyle(context, 13, FontWeight.bold,
                          const Color.fromRGBO(34, 53, 53, 1)),
                    )),
              ],
            ),
          ),
        )
      : FlatButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => ChangeLanguage())),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromRGBO(248, 248, 248, 1),
            ),
            child: Row(
              children: [
                Container(
                    //'EG','🇪🇬'
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      LanguageEnglish(context) == 'English' ? '🇺🇸' : '🇪🇬',
                      style: getcustomertextStyle(context, 13, FontWeight.bold,
                          const Color.fromRGBO(34, 53, 53, 1)),
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      LanguageEnglish(context) == 'English' ? 'EN' : 'AR',
                      style: getcustomertextStyle(context, 13, FontWeight.bold,
                          const Color.fromRGBO(34, 53, 53, 1)),
                    )),
                Container(
                  padding: const EdgeInsets.only(left: 150),
                  child: Text(
                    AppLocalizations.of(context)!
                        .getTranslatedValue('SelectlanguageText')
                        .toString(),
                    style: getcustomertextStyle(context, 18, FontWeight.bold,
                        const Color.fromRGBO(34, 53, 53, 1)),
                  ),
                ),
              ],
            ),
          ),
        );
}
