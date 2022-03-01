import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../classes/app_localizations.dart';
import '../classes/color_theme.dart';
import '../widget/change_language_style.dart';
import '../widget/payment_method.dart';

class CustomerDataDropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<CustomerDataDropDownMenu> {
  String option = '';
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
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Positioned(
            top: 120,
            left: 10,
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
              'Brands',
              style: getcustomertextStyle(context, 15, FontWeight.normal,
                  Color.fromRGBO(34, 53, 53, 1)),
              // TextStyle(fontSize: 15,color: Color.fromRGBO(34, 53, 53, 1)),
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
    return Container(
      // height: double.infinity,
      // width: double.infinity,
      // color: Colors.black.withOpacity(0.2),
      child: Column(
        children: [
          SizedBox(height: 5),
          Material(
            color: Colors.black.withOpacity(0.001),
            // shape: ArrowShap(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(13),
                            bottomLeft: Radius.circular(13),
                          ),
                          color: Color.fromRGBO(236, 238, 244, 1)
                          // color:Colors.orange
                          ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .getTranslatedValue('customer_name')
                              .toString(),
                          hintStyle: getcustomertextStyle(
                              context,
                              15,
                              FontWeight.normal,
                              Color.fromRGBO(196, 198, 204, 1)),
                          // GoogleFonts.montserrat(
                          //   textStyle: TextStyle(
                          //     fontSize: 15,
                          //     color: Color.fromRGBO(196, 198, 204, 1),
                          //   ),
                          // ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.14,
                      height: MediaQuery.of(context).size.height * 0.09,
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.only(left: 10, right: 20, bottom: 25),
                      decoration: BoxDecoration(
                          // color:Colors.red,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(14),
                            topRight: Radius.circular(14),
                          ),
                          color: Color.fromRGBO(236, 238, 244, 1)
                          // color:Colors.orange
                          ),
                      child: SvgPicture.asset('images/search-1.svg',
                          color: Color.fromRGBO(196, 198, 204, 1)),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Color.fromRGBO(236, 238, 244, 1)
                          // color:Colors.orange
                          ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .getTranslatedValue('customer_phone')
                              .toString(),
                          hintStyle: getcustomertextStyle(
                              context,
                              15,
                              FontWeight.normal,
                              Color.fromRGBO(196, 198, 204, 1)),
                          // GoogleFonts.montserrat(
                          //   textStyle: TextStyle(
                          //     fontSize: 15,
                          //     color: Color.fromRGBO(196, 198, 204, 1),
                          //   ),
                          // ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Color.fromRGBO(236, 238, 244, 1)
                          // color:Colors.orange
                          ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .getTranslatedValue('customer_email')
                              .toString(),
                          hintStyle: getcustomertextStyle(
                              context,
                              15,
                              FontWeight.normal,
                              Color.fromRGBO(196, 198, 204, 1)),
                          // GoogleFonts.montserrat(
                          //   textStyle: TextStyle(
                          //     fontSize: 15,
                          //     color: Color.fromRGBO(196, 198, 204, 1),
                          //   ),
                          // ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width * 0.14,
                    //   height: MediaQuery.of(context).size.height * 0.09,
                    //   margin: EdgeInsets.only(right: 10),
                    //   padding: EdgeInsets.only(left: 10, right: 20, bottom: 25),
                    //   decoration: BoxDecoration(
                    //     // color:Colors.red,
                    //       borderRadius: BorderRadius.only(
                    //         bottomRight: Radius.circular(14),
                    //         topRight: Radius.circular(14),
                    //       ),
                    //       color: Color.fromRGBO(236, 238, 244, 1)
                    //     // color:Colors.orange
                    //   ),
                    //   child: SvgPicture.asset('images/search-1.svg',
                    //       color: Color.fromRGBO(196, 198, 204, 1)),
                    // ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Color.fromRGBO(236, 238, 244, 1)
                          // color:Colors.orange
                          ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .getTranslatedValue('customer_address')
                              .toString(),
                          hintStyle: getcustomertextStyle(
                              context,
                              15,
                              FontWeight.normal,
                              Color.fromRGBO(196, 198, 204, 1)),
                          // GoogleFonts.montserrat(
                          //   textStyle: TextStyle(
                          //     fontSize: 15,
                          //     color: Color.fromRGBO(196, 198, 204, 1),
                          //   ),
                          // ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Color.fromRGBO(236, 238, 244, 1)
                          // color:Colors.orange
                          ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!
                              .getTranslatedValue('customer_tax_number')
                              .toString(),
                          hintStyle: getcustomertextStyle(
                              context,
                              15,
                              FontWeight.normal,
                              Color.fromRGBO(196, 198, 204, 1)),
                          // GoogleFonts.montserrat(
                          //   textStyle: TextStyle(
                          //     fontSize: 15,
                          //     color: Color.fromRGBO(196, 198, 204, 1),
                          //   ),
                          // ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      padding: EdgeInsets.only(left: 10, right: 20),
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(236, 238, 244, 1),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: PaymentMethod(),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      // padding: EdgeInsets.only(left: 10, right: 20),
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(92, 145, 246, 0.11),
                            offset: Offset(0, 8),
                            blurRadius: 28.0),
                      ]),
                      child: RaisedButton(
                        child: Text(
                          AppLocalizations.of(context)!
                              .getTranslatedValue('print_invoice_text')
                              .toString(),
                          style: getcustomertextStyle(
                              context, 20, FontWeight.w400, Colors.white),
                          // GoogleFonts.montserrat(
                          //     textStyle:  TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400)
                          // )
                        ),
                        color: Color.fromRGBO(210, 140, 84, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onPressed: () {},
                        // onPressed: ()=>Get.to(() => printer()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class ArrowClipper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//     Path path  = Path();
//     path.moveTo(0, size.height);
//     path.lineTo(size.width/2, 0);
//     path.lineTo(size.width, size.height);
//     return path;
//   }
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true ;
//
// }
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
    ColorTheme.color1;
    // color : Colors.black;
    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    return path;
  }
}
