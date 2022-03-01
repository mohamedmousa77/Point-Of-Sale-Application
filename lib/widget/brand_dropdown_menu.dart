import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../classes/app_localizations.dart';

import 'change_language_style.dart';

class BrandDropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<BrandDropDownMenu> {
  String option = '';
  bool isOpend = false;
  late OverlayEntry floating;
  String brand = '';

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
            top: 370,
            left: 195,
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
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Text(
                AppLocalizations.of(context)!
                    .getTranslatedValue('brand')
                    .toString(),
                style: getcustomertextStyle(context, 15, FontWeight.w300,
                    const Color.fromRGBO(34, 53, 53, 1))
                // GoogleFonts.montserrat(
                //   textStyle: TextStyle(fontSize: 15,color: Color.fromRGBO(34, 53, 53, 1)),
                // )
                ),
            Spacer(),
            SvgPicture.asset('images/arrow-down.svg',
                color: Color.fromRGBO(34, 53, 53, 1))
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
          shape: ArrowShap(),
          child: Container(
            // margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                    color: Color.fromRGBO(236, 238, 244, 1),
                  ),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.05,
                  // color: Color.fromRGBO(236, 238, 244, 1),
                  child: Text('hp',
                      style: getcustomertextStyle(
                          context, 15, FontWeight.normal, Colors.black)
                      // TextStyle(fontSize: 15 , color: Colors.black)
                      ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                    color: Color.fromRGBO(236, 238, 244, 1),
                  ),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Text('Lenovo',
                      style: getcustomertextStyle(
                          context, 15, FontWeight.normal, Colors.black)

                      // TextStyle(fontSize: 15 , color: Colors.black)
                      ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class ArrowShap extends ShapeBorder {
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getOuterPath
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    return path;
  }
}
