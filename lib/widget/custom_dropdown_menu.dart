import 'package:flutter/material.dart';
import '../classes/language.dart';
import '../functions/change_language.dart';
// import 'package:sellingpoint/classes/language.dart';
// import 'package:sellingpoint/functions/change_language.dart';

Widget customDropdownMenu(BuildContext context) {
  return DropdownButton<Language>(
    onChanged: (Language? language) {
      changeLanguage(context, language!);
    },
    underline: SizedBox(),
    icon: Icon(Icons.language),
    items: Language.languageList(context)
        .map<DropdownMenuItem<Language>>((valueOfLanguage) => DropdownMenuItem(
              child: Row(
                children: [
                  Text(valueOfLanguage.name),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(valueOfLanguage.flag)
                ],
              ),
              value: valueOfLanguage,
            ))
        .toList(),
  );
}
