import 'package:flutter/material.dart';
import '../classes/language.dart';
import '../classes/localization_const.dart';
import '../main.dart';
// import 'package:sellingpoint/classes/language.dart';
// import 'package:sellingpoint/classes/localization_const.dart';
// import 'package:sellingpoint/main.dart';

void changeLanguage(BuildContext context, Language localString) {
  Locale _temp = locale1(localString.languageCode);

  MyApp.setLocale(context, _temp);
}
