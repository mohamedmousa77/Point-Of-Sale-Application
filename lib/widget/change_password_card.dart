import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../screens/changepassword.dart';
import '../widget/change_language_style.dart';

Widget changePasswordCard(BuildContext context) {
  return FlatButton(
    onPressed: () => Get.to(() => ChangePassword()),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(248, 248, 248, 1),
      ),
      child: LanguageEnglish(context) == 'English'
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                      AppLocalizations.of(context)!
                          .getTranslatedValue('change_password')
                          .toString(),
                      style: getcustomertextStyle(
                          context, 18, FontWeight.bold, Colors.black)),
                ),
                Container(
                    padding: const EdgeInsets.only(left: 100),
                    child: const Icon(Icons.arrow_forward)),
              ],
            )
          : Row(
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: const Icon(Icons.arrow_back)),
                Container(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text(
                      AppLocalizations.of(context)!
                          .getTranslatedValue('change_password')
                          .toString(),
                      style: getcustomertextStyle(
                          context, 18, FontWeight.bold, Colors.black)),
                ),
              ],
            ),
    ),
  );
}
