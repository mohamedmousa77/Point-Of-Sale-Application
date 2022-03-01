import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../classes/app_localizations.dart';
import '../classes/language.dart';
import '../classes/localization_const.dart';
import '../functions/change_language.dart';
import '../widget/change_language_style.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String option = '';
  bool isOpend = false;
  late OverlayEntry floating;
  String paymentType = 'Payment Method';

  OverlayEntry _createPaymentMethodDropDown() {
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
            top: 465,
            left: 25,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              child: buildPaymentMethodDropDown(context),
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
        floating = _createPaymentMethodDropDown();
        Overlay.of(context)!.insert(floating);
        isOpend = !isOpend;
      },
      child: Container(
        padding: const EdgeInsets.only(right: 20),
        child: LanguageEnglish(context) == 'English'
            ? Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .getTranslatedValue('payment_method')
                        .toString(),
                    style: getcustomertextStyle(context, 15, FontWeight.normal,
                        const Color.fromRGBO(196, 198, 204, 1)),
                  ),
                  const Spacer(),
                  SvgPicture.asset('images/arrow-down.svg',
                      color: const Color.fromRGBO(196, 198, 204, 1))
                ],
              )
            : Row(
                children: [
                  const Icon(Icons.keyboard_arrow_up,
                      color: Color.fromRGBO(196, 198, 204, 1)),
                  // SvgPicture.asset('images/arrow-down.svg',color:const Color.fromRGBO(196, 198, 204, 1)),
                  const Spacer(),
                  Text(
                    AppLocalizations.of(context)!
                        .getTranslatedValue('payment_method')
                        .toString(),
                    style: getcustomertextStyle(context, 15, FontWeight.normal,
                        const Color.fromRGBO(196, 198, 204, 1)),
                  ),
                ],
              ),
      ),
    );
  }

  Widget buildPaymentMethodDropDown(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.white.withOpacity(0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    paymentType = 'Cash';
                  });
                  floating.remove();
                  isOpend = !isOpend;
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color.fromRGBO(236, 238, 244, 1),
                  ),
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Text(
                    'Cash',
                    style: getcustomertextStyle(context, 15, FontWeight.normal,
                        const Color.fromRGBO(34, 53, 53, 1)),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              InkWell(
                onTap: () {
                  setState(() {
                    paymentType = 'Credit';
                  });
                  floating.remove();
                  isOpend = !isOpend;
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color.fromRGBO(236, 238, 244, 1),
                  ),
                  width: MediaQuery.of(context).size.width * 0.88,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: Text(
                    'Credit',
                    style: getcustomertextStyle(context, 15, FontWeight.normal,
                        const Color.fromRGBO(34, 53, 53, 1)),
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
// class PaymentMethodDropDown extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Material(
//           child: Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 InkWell(
//                   onTap: (){
//                     paymentType = 'Cash';
//                   },
//                   child: Container(
//                     padding:const EdgeInsets.only(top: 10, left: 20, right: 20),
//                     decoration:const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(14),
//                         topLeft: Radius.circular(14),
//                       ),
//                       color: Color.fromRGBO(236, 238, 244, 1),
//                     ),
//                     width: MediaQuery.of(context).size.width * 0.3,
//                     height: MediaQuery.of(context).size.height * 0.05,
//                     child: Text('Cash',
//                       style:
//                       getcustomertextStyle( context,15,FontWeight.normal,const Color.fromRGBO(34, 53, 53, 1)),
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: (){
//                     changeLanguage(context, Language.languageList(context)[1]);
//                   },
//                   child: Container(
//                     padding:const EdgeInsets.only(top: 10, left: 20, right: 20),
//                     decoration:const BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         bottomRight: Radius.circular(14),
//                         bottomLeft: Radius.circular(14),
//                       ),
//                       color: Color.fromRGBO(236, 238, 244, 1),
//                     ),
//                     width: MediaQuery.of(context).size.width * 0.3,
//                     height: MediaQuery.of(context).size.height * 0.05,
//                     child: Row(
//                       children: [
//                         Text('AR',
//                           style:
//                           getcustomertextStyle( context,15,FontWeight.normal,const Color.fromRGBO(34, 53, 53, 1)),
//                         ),
//                         const Spacer(),
//                         Text('🇪🇬',
//                           style:
//                           getcustomertextStyle( context,15,FontWeight.normal,const Color.fromRGBO(34, 53, 53, 1)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
