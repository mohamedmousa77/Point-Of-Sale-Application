import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../classes/language.dart';
import '../classes/localization_const.dart';
import '../functions/change_language.dart';
import '../widget/change_language_style.dart';

class LanguageDropDownMenu extends StatefulWidget {
  @override
  _LanguageDropDownMenuState createState() => _LanguageDropDownMenuState();
}

class _LanguageDropDownMenuState extends State<LanguageDropDownMenu> {
  bool isOpend = false;
  late OverlayEntry floating;

  OverlayEntry _create() {
    return OverlayEntry(builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () {
              floating.remove();
            },
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Positioned(
            //580
            top: MediaQuery.of(context).size.height * 0.76,
            left: MediaQuery.of(context).size.width * 0.35,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              child: DropDown(),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        floating = _create();
        Overlay.of(context)!.insert(floating);
        isOpend = !isOpend;
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Text(
              LanguageEnglish(context) == 'English' ? 'EN' : 'AR',
              style: getcustomertextStyle(context, 15, FontWeight.normal,
                  const Color.fromRGBO(34, 53, 53, 1)),
            ),
            Text(
              LanguageEnglish(context) == 'English' ? '🇺🇸' : '🇪🇬',
              style: getcustomertextStyle(context, 15, FontWeight.normal,
                  const Color.fromRGBO(34, 53, 53, 1)),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_up,
                color: Color.fromRGBO(34, 53, 53, 1)),
            // SvgPicture.asset('images/arrow-down.svg',)
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.black.withOpacity(0.001),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  changeLanguage(context, Language.languageList(context)[0]);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14),
                      topLeft: Radius.circular(14),
                    ),
                    color: Color.fromRGBO(236, 238, 244, 1),
                  ),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Row(
                    children: [
                      Text(
                        'EN',
                        style: getcustomertextStyle(
                            context,
                            15,
                            FontWeight.normal,
                            const Color.fromRGBO(34, 53, 53, 1)),
                      ),
                      const Spacer(),
                      Text(
                        '🇺🇸',
                        style: getcustomertextStyle(
                            context,
                            15,
                            FontWeight.normal,
                            const Color.fromRGBO(34, 53, 53, 1)),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  changeLanguage(context, Language.languageList(context)[1]);
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(14),
                      bottomLeft: Radius.circular(14),
                    ),
                    color: Color.fromRGBO(236, 238, 244, 1),
                  ),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.05,
                  // color: Color.fromRGBO(236, 238, 244, 1),

                  child: Row(
                    children: [
                      Text(
                        'AR',
                        style: getcustomertextStyle(
                            context,
                            15,
                            FontWeight.normal,
                            const Color.fromRGBO(34, 53, 53, 1)),
                      ),
                      const Spacer(),
                      Text(
                        '🇪🇬',
                        style: getcustomertextStyle(
                            context,
                            15,
                            FontWeight.normal,
                            const Color.fromRGBO(34, 53, 53, 1)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
