import 'package:flutter/material.dart';
import '../widget/change_language_style.dart';

class showDevice extends StatefulWidget {

  @override
  _ShowDeviceState createState() => _ShowDeviceState();
}

class _ShowDeviceState extends State<showDevice> {
  bool isPaymentDropDownOpend = false;
  late OverlayEntry floating ;
  OverlayEntry _create (){
    return OverlayEntry(builder: (context){
      return Positioned(
        width: MediaQuery.of(context).size.width *0.7,
        height: MediaQuery.of(context).size.height *0.2,
        top:460 ,
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
      onTap: (){
        setState(() {
          if(isPaymentDropDownOpend){
            floating.remove();
          }else{
            floating = _create();
            Overlay.of(context)!.insert(floating);
          }
          isPaymentDropDownOpend =!isPaymentDropDownOpend;

        });
      },
      child: Container(
        padding:const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Text('Device ',
              style:
              getcustomertextStyle( context,15,FontWeight.normal,const Color.fromRGBO(34, 53, 53, 1)),
            ),
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
        const SizedBox(height: 5),
        Align(
          alignment:const Alignment(-0.85,0),
          child: ClipPath(
            // clipper:ArrowClipper() ,
            child: Container(
              height: 20,
              width: 30,
              decoration:const BoxDecoration(
                  color: Colors.black
              ),
            ),
          ),
        ),
        Material(
          // shape: ArrowShap(),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            // margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding:const EdgeInsets.only(top: 10 , left: 20),
                  decoration:const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width *0.7,
                  height: MediaQuery.of(context).size.height *0.05,
                  // color: Color.fromRGBO(236, 238, 244, 1),
                  child: Text('Cash',
                    style:
                    getcustomertextStyle( context,15,FontWeight.normal,Colors.black),
                    // TextStyle(fontSize: 15 , color: Colors.black)

                  ),
                ),
                Container(
                  padding:const EdgeInsets.only(top: 10 , left: 20),
                  decoration:const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(14),
                      bottomLeft: Radius.circular(14),

                    ),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width *0.7,
                  height: MediaQuery.of(context).size.height *0.05,
                  child: Text('Credit',
                    style:  getcustomertextStyle( context,15,FontWeight.normal,Colors.black),
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
