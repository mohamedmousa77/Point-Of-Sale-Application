import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/localization_const.dart';

TextStyle getcustomertextStyle(
    BuildContext context, double Size, FontWeight fontWeight, Color color) {
  return LanguageEnglish(context) == 'English'
      ? GoogleFonts.montserrat(
          textStyle:
              TextStyle(fontSize: Size, fontWeight: fontWeight, color: color))
      : GoogleFonts.tajawal(
          textStyle:
              TextStyle(fontSize: Size, fontWeight: fontWeight, color: color));
}
