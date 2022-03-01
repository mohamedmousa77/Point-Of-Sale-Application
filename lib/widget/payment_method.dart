import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widget/change_language_style.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool isPaymentDropDownOpend = false;
  late OverlayEntry floating;

  OverlayEntry _create() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.2,
        top: 460,
        left: 30,
        child: Container(
          decoration: BoxDecoration(
            // color: Color.fromRGBO(236, 238, 244, 1),
            borderRadius: BorderRadius.circular(14),
            // color: Colors.red
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
          if (isPaymentDropDownOpend) {
            floating.remove();
          } else {
            floating = _create();
            Overlay.of(context)!.insert(floating);
          }
          isPaymentDropDownOpend = !isPaymentDropDownOpend;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Text(
              'Payment Method',
              style: getcustomertextStyle(context, 15, FontWeight.normal,
                  Color.fromRGBO(34, 53, 53, 1)),
            ),

            // TextStyle(fontSize: 15,color: Color.fromRGBO(34, 53, 53, 1)),),
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
        SizedBox(height: 5),
        Align(
          alignment: Alignment(-0.85, 0),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              height: 20,
              width: 30,
              decoration: const BoxDecoration(color: Colors.black),
            ),
          ),
        ),
        Material(
          shape: ArrowShap(),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            // margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.05,
                  // color: Color.fromRGBO(236, 238, 244, 1),
                  child: Text(
                    'Cash',

                    style: getcustomertextStyle(
                        context, 15, FontWeight.normal, Colors.black),
                    // TextStyle(fontSize: 15 , color: Colors.black)
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(14),
                      bottomLeft: Radius.circular(14),
                    ),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Text(
                    'Credit',
                    style: getcustomertextStyle(
                        context, 15, FontWeight.normal, Colors.black),
                    // style: TextStyle(fontSize: 15 , color: Colors.black)
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
