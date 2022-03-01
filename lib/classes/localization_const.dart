import 'package:flutter/material.dart';
// import 'package:sellingpoint/classes/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_localizations.dart';

// const language code

const String ENGLISH = 'en';
const String ARABIC = 'ar';

const String LANGUAGE_CODE = 'languageCode';

//this function check if the language of the app is English o no...
String LanguageEnglish(BuildContext context) {
  var s = AppLocalizations.of(context)!
      .getTranslatedValue('EnglishLanguage')
      .toString();

  return s;
}

Future<Locale> setLocale(String languageCode) async {
  try {
    SharedPreferences _preference = await SharedPreferences.getInstance();
    await _preference.setString(LANGUAGE_CODE, languageCode);
    return locale1(languageCode);
  } on Exception catch (e) {
    return locale1(languageCode);
  }
}

Locale locale1(String languageCode) {
  Locale _temp;

  switch (languageCode) {
    case ENGLISH:
      _temp = Locale(ENGLISH, '');
      break;
    case ARABIC:
      _temp = Locale(ARABIC, '');
      break;
    default:
      _temp = Locale(ENGLISH, '');
  }

  return _temp;
}

Future<Locale> getLocale() async {
  try {
    SharedPreferences _preference = await SharedPreferences.getInstance();
    String languageCode = _preference.getString(LANGUAGE_CODE) ?? ENGLISH;

    return locale1(languageCode);
  } on Exception catch (e) {
    String languageCode = ENGLISH;
    return setLocale(languageCode);
  }
}
