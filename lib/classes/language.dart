import 'package:flutter/cupertino.dart';

import 'app_localizations.dart';
// import 'package:sellingpoint/classes/app_localizations.dart';

class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  Language(this.id, this.name, this.languageCode, this.flag);
  static List<Language> languageList(BuildContext context) {
    return <Language>[
      Language(
        1,
        AppLocalizations.of(context)!
            .getTranslatedValue('EnglishLanguage')
            .toString(),
        'en',
        'πΊπΈ',
      ),
      Language(
        2,
        AppLocalizations.of(context)!
            .getTranslatedValue('ArabicLanguage')
            .toString(),
        'ar',
        'πͺπ¬',
      ),
    ];
  }
}
