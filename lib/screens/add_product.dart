import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_application/controllers/firebase_product_controller.dart';
import 'package:pos_application/home_page.dart';
import 'package:pos_application/models/pro.dart';

import '../models/firebase_product_model.dart';
import '../models/product_model.dart';
import '../theme/colors.dart';
import '../widget/custom_appbar.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String productName ='';
  String productDescription='';
  String barcodeType='';
  String brand='';
  String gategory='';
  String alertQuantity='';
  String image='';
  String price = '';
  Widget getBody(){
    return SingleChildScrollView(
      child: Column(
        children: [
          // Product Name text
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              children: [
                // SvgPicture.asset('assets/icons/person.svg',color: primaryGreenColor_1),
                SizedBox(width: MediaQuery.of(context).size.width*0.02),
                Text(
                    'Name'.toUpperCase(),
                    style:GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color:textPrimaryColor,
                        ))
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          //  Product Name data
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.9,
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, ),
            decoration: BoxDecoration(
              color: ofWhiteColor,
              borderRadius: BorderRadius.circular(25),

            ),
            child: TextField(
              onChanged: (newValue){
                setState(() {
                  productName = newValue;
                });
              },
              decoration:const InputDecoration(border: InputBorder.none),
              // controller: postController.descriptionController,
              // style:  primaryInputTextStyle,
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          // description text
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              children: [
                // SvgPicture.asset('assets/icons/lock.svg',color: primaryGreenColor_1),
                SizedBox(width: MediaQuery.of(context).size.width*0.02),
                Text(
                  'Description'.toUpperCase(),
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color:textPrimaryColor,
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          //description data
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.9,
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, ),
            decoration: BoxDecoration(
              color: ofWhiteColor,
              borderRadius: BorderRadius.circular(25),

            ),
            child: TextField(
              onChanged: (newValue){
                setState(() {
                  productDescription = newValue;
                });
              },
              decoration:const InputDecoration(border: InputBorder.none),
              // controller: postController.descriptionController,
              // style:  primaryInputTextStyle,
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          //gategory text
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              children: [
                // SvgPicture.asset('assets/icons/person.svg',color: primaryGreenColor_1),
                SizedBox(width: MediaQuery.of(context).size.width*0.02),
                Text(
                    'Category'.toUpperCase(),
                    style:GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color:textPrimaryColor,
                        ))
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          //  Gategory data
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.9,
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, ),
            decoration: BoxDecoration(
              color: ofWhiteColor,
              borderRadius: BorderRadius.circular(25),

            ),
            child: TextField(
              onChanged: (newValue){
                setState(() {
                  gategory = newValue;
                });
              },
              decoration:const InputDecoration(border: InputBorder.none),
              // controller: postController.descriptionController,
              // style:  primaryInputTextStyle,
              keyboardType: TextInputType.text,
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          //brand text
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              children: [
                // SvgPicture.asset('assets/icons/person.svg',color: primaryGreenColor_1),
                SizedBox(width: MediaQuery.of(context).size.width*0.02),
                Text(
                    'brand'.toUpperCase(),
                    style:GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color:textPrimaryColor,
                        ))
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          //  brand data
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.9,
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, ),
            decoration: BoxDecoration(
              color: ofWhiteColor,
              borderRadius: BorderRadius.circular(25),

            ),
            child: TextField(
              onChanged: (newValue){
                setState(() {
                  brand = newValue;
                });
              },
              decoration:const InputDecoration(border: InputBorder.none),
              // controller: postController.descriptionController,
              // style:  primaryInputTextStyle,
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          //barcode text
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              children: [
                // SvgPicture.asset('assets/icons/person.svg',color: primaryGreenColor_1),
                SizedBox(width: MediaQuery.of(context).size.width*0.02),
                Text(
                    'Barcode Type '.toUpperCase(),
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color:textPrimaryColor,
                        ))
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          // barcode data data
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.9,
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, ),
            decoration: BoxDecoration(
              color: ofWhiteColor,
              borderRadius: BorderRadius.circular(25),

            ),
            child: TextField(
              onChanged: (newValue){
                setState(() {
                  barcodeType = newValue;
                });
              },
              decoration:const InputDecoration(border: InputBorder.none),
              // controller: postController.descriptionController,
              // style:  primaryInputTextStyle,
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          // Quantity text
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.05,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Row(
              children: [
                // SvgPicture.asset('assets/icons/visit_icon.svg',width:25,color: primaryGreenColor_1),
                SizedBox(width: MediaQuery.of(context).size.width*0.02),
                Text(
                    'alert Quantity'.toUpperCase(),
                    style:GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color:textPrimaryColor
                        ))
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          // Quantity data
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: MediaQuery.of(context).size.width*0.9,
            padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.05, ),
            decoration: BoxDecoration(
              color: ofWhiteColor,
              borderRadius: BorderRadius.circular(25),

            ),
            child:  TextField(
              onChanged: (newValue){
                setState(() {
                  alertQuantity = newValue;
                });
              },
              decoration:const InputDecoration(border: InputBorder.none),
              // controller: postController.descriptionController,
              // style:  primaryInputTextStyle,
              keyboardType: TextInputType.text,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          // Submit Button
          GestureDetector(
            onTap: () {
              if(productName.isEmpty || productDescription.isEmpty
              ||gategory.isEmpty || brand.isEmpty){
                Get.snackbar('Invalid employee information', 'please make sure  ',snackPosition: SnackPosition.BOTTOM);
              }else{
                Get.find<FirebaseProductController>().addProduct(
                    product: FirebaseProduct(
                      price:price ,
                        id: '',
                        name: productName,
                        productDescription: productDescription,
                        brand: brand,
                        gategory: gategory,
                        alertQuantity: alertQuantity,
                        barcodeType: barcodeType,
                        image: image,
                    )
                );
                Get.off(const MyHomePage());
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,

              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SUBMIT', style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ))),
                  SizedBox(width: MediaQuery.of(context).size.width*0.1),
                  // SvgPicture.asset('assets/icons/true_sign.svg',width:25 ,color: whiteColor),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(context),
            getBody(),
          ],
        ),
      ),
    );
  }
}
