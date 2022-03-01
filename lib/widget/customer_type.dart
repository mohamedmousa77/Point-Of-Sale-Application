import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../classes/app_localizations.dart';
import '../controllers/customer_type_controller.dart';
import '../widget/change_language_style.dart';

class customerType extends StatefulWidget {
  @override
  _customerTypeState createState() => _customerTypeState();
}

CustomerTypeController customertype = CustomerTypeController();

class _customerTypeState extends State<customerType> {
  String option = '';
  bool isOpend = false;
  late OverlayEntry floating;

  OverlayEntry _create() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        top: 300,
        left: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),
          child: DropDown(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isOpend) {
            floating.remove();
          } else {
            floating = _create();
            Overlay.of(context)!.insert(floating);
          }
          isOpend = !isOpend;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Text(
              AppLocalizations.of(context)!
                  .getTranslatedValue('customer_type')
                  .toString(),
              // customertype.CustomerType,
              style: getcustomertextStyle(context, 15, FontWeight.w500,
                  Color.fromRGBO(196, 198, 204, 1)),
              // GoogleFonts.montserrat(
              //   textStyle: TextStyle(fontSize: 15,color: Color.fromRGBO(196, 198, 204, 1) ,
              //       fontWeight: FontWeight.w500),
              // )
            ),
            // Container(
            //   child: Obx(
            //       ()=>Text(
            //           // AppLocalizations.of(context)!.getTranslatedValue('customer_type').toString(),
            //           customertype.CustomerType,
            //              style: GoogleFonts.montserrat(
            //             textStyle: TextStyle(fontSize: 15,color: Color.fromRGBO(196, 198, 204, 1) ,
            //                 fontWeight: FontWeight.w500),
            //           )
            //       ),
            //   ),
            // ),
            Spacer(),
            SvgPicture.asset('images/arrow-down.svg',
                color: Color.fromRGBO(196, 198, 204, 1))
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  // CustomerTypeController customertype = CustomerTypeController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Material(
          shape: ArrowShap(),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    customertype.firstTypeSelected();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.only(top: 10, left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(14),
                        topRight: Radius.circular(14),
                      ),
                      color: Color.fromRGBO(236, 238, 244, 1),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Text(
                      AppLocalizations.of(context)!
                          .getTranslatedValue('first_type')
                          .toString(),
                      style: getcustomertextStyle(context, 15,
                          FontWeight.normal, Color.fromRGBO(196, 198, 204, 1)),
                      // GoogleFonts.montserrat(
                      //   textStyle: TextStyle(fontSize: 15, color: Color.fromRGBO(34, 53, 53, 1)
                      //       ,fontWeight: FontWeight.w500)
                      // )
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    customertype.secondTypeSelected();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.only(top: 10, left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(14),
                        bottomRight: Radius.circular(14),
                      ),
                      color: Color.fromRGBO(236, 238, 244, 1),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: Text(
                      // 'Second Type'
                      AppLocalizations.of(context)!
                          .getTranslatedValue('second_type')
                          .toString(),
                      style: getcustomertextStyle(context, 15,
                          FontWeight.normal, Color.fromRGBO(196, 198, 204, 1)),
                      // GoogleFonts.montserrat(
                      //     textStyle: TextStyle(fontSize: 15 , color: Color.fromRGBO(34, 53, 53, 1)
                      //         ,fontWeight: FontWeight.w500))
                    ),
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
