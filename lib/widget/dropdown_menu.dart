import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widget/change_language_style.dart';
class DropDownMenu extends StatefulWidget {

final String optionR ;
final String CountryR;
DropDownMenu(this.optionR, this.CountryR);
  @override
  _DropDownMenuState createState() => _DropDownMenuState(optionR,CountryR);
}

class _DropDownMenuState extends State<DropDownMenu> {
  final String optionS ;
  final String CountryS;
  _DropDownMenuState(this.optionS , this.CountryS);

  String option ='';
  bool isOpend = false;


  // GlobalKey actionKey;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // actionKey = LabeledGlobalKey(widget.optionR);
  //   super.initState();
  // }

  // void findDropDownMenuData(){
  //   RenderBox rendderbox = actionKey.currentContext.findRenderObject();
  // }

  OverlayEntry _createFloatingDropDown(){
    return OverlayEntry(builder: (context){
      return Positioned(
            left: 50,
            top: 150,
            width: 80,
            height: 50,
            child: Container(
              color : Colors.red,
              height:200,
            ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       setState(() {
         OverlayEntry floatingDropDown = _createFloatingDropDown();
         Overlay.of(context)!.insert(floatingDropDown);

         isOpend=!isOpend;
       });
      },
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Text(optionS == null ? 'Brands' : optionS,
              style:
              getcustomertextStyle( context,15,FontWeight.normal,Color.fromRGBO(34, 53, 53, 1)),
              // TextStyle(fontSize: 15,color: Color.fromRGBO(34, 53, 53, 1)),
            ),
            Text(CountryS == null ? 'Brands' : CountryS,
              style:
              getcustomertextStyle( context,15,FontWeight.normal,Color.fromRGBO(34, 53, 53, 1)),
              // TextStyle(fontSize: 15,color: Color.fromRGBO(34, 53, 53, 1)),
            ),
            Spacer(),
            SvgPicture.asset('images/arrow-down.svg',color: Color.fromRGBO(34, 53, 53, 1))
          ],
        ),
      ),
    );
  }
}
