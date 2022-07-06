import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../classes/color_theme.dart';
import '../classes/localization_const.dart';
import '../screens/carr.dart';

// import '../screens/car.dart';
import '../screens/receipt.dart';
import '../screens/setting.dart';
import '../screens/to_do_list.dart';
// import '../screens/todolist.dart';

import '../home_page.dart';

class CustomNavigationBar extends StatefulWidget {
  static int? value;

  CustomNavigationBar(value) {
    CustomNavigationBar.value = value;
  }

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    if (CustomNavigationBar.value == 1) {
      return LanguageEnglish(context) == 'English'
          ? Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color.fromRGBO(34, 53, 53, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const Color.fromRGBO(34, 53, 53, 1),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage())),

                        // Get.to(MyHomePage()),
                        child: SvgPicture.asset(('images/home.svg'),
                            color: ColorTheme.whiteColor)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(ShoppingCar()),
                        onPressed: (){
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ShoppingCar()));
                          Get.off(ShoppingCar());
                        },
                        child: SvgPicture.asset(('images/car.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(Receipt()),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Receipt()));

                        },
                        child: SvgPicture.asset(('images/document.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color: const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(Setting()),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Setting()));

                        },
                        child: SvgPicture.asset(('images/setting.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: FlatButton(
                        color: const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(ToDoList()),
                        onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ToDoList()));

                        },
                        child: SvgPicture.asset(('images/to_do_list1.svg'),
                            color: const Color.fromRGBO(112, 112, 112, 1))),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color.fromRGBO(34, 53, 53, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: FlatButton(
                        color: const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(ToDoList()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ToDoList())),
                        child: SvgPicture.asset(('images/to_do_list1.svg'),
                            color: const Color.fromRGBO(112, 112, 112, 1))),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color: const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(Setting()),

                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Setting())),

                        child: SvgPicture.asset(('images/setting.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(Receipt()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Receipt())),
                        child: SvgPicture.asset(('images/document.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(ShoppingCar()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ShoppingCar())),
                        child: SvgPicture.asset(('images/car.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color: const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(MyHomePage()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage())),
                        child: SvgPicture.asset(('images/home.svg'),
                            color: ColorTheme.whiteColor)),
                  ),
                ],
              ),
            );
    }
    else if (CustomNavigationBar.value == 2) {
      return LanguageEnglish(context) == 'English'
          ? Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color.fromRGBO(34, 53, 53, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(MyHomePage()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage())),
                        child: SvgPicture.asset(('images/home.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(ShoppingCar()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ShoppingCar())),
                        child: SvgPicture.asset(('images/car.svg'),
                            color: ColorTheme.whiteColor)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(Receipt()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Receipt())),
                        child: SvgPicture.asset(('images/document.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color: const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(Setting()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Setting())),
                        child: SvgPicture.asset(('images/setting.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(ToDoList()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ToDoList())),
                        child: SvgPicture.asset(('images/to_do_list1.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color.fromRGBO(34, 53, 53, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(ToDoList()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ToDoList())),
                        child: SvgPicture.asset(('images/to_do_list1.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color: const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(Setting()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Setting())),
                        child: SvgPicture.asset(('images/setting.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const
                        Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(Receipt()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Receipt())),
                        child: SvgPicture.asset(('images/document.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(ShoppingCar()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ShoppingCar())),
                        child: SvgPicture.asset(('images/car.svg'),
                            color: ColorTheme.whiteColor)),
                  ),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: FlatButton(
                        color:const Color.fromRGBO(34, 53, 53, 1),
                        // onPressed: () => Get.to(MyHomePage()),
                        onPressed: () =>
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage())),
                        child: SvgPicture.asset(('images/home.svg'),
                            color: ColorTheme.iconNotSelected)),
                  ),
                ],
              ),
            );
    }
    else if (CustomNavigationBar.value == 3) {
      // Doc =  color: ColorTheme.whiteColor
      return LanguageEnglish(context) == 'English'
          ? Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Color.fromRGBO(34, 53, 53, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(MyHomePage()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage())),
                  child: SvgPicture.asset(('images/home.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(ShoppingCar()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ShoppingCar())),
                  child: SvgPicture.asset(('images/car.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(Receipt()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Receipt())),
                  child: SvgPicture.asset(('images/document.svg'),
                      color: ColorTheme.whiteColor)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color: const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(Setting()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Setting())),
                  child: SvgPicture.asset(('images/setting.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(ToDoList()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ToDoList())),
                  child: SvgPicture.asset(('images/to_do_list1.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
          ],
        ),
      )
          : Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Color.fromRGBO(34, 53, 53, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(ToDoList()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ToDoList())),
                  child: SvgPicture.asset(('images/to_do_list1.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color: const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(Setting()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Setting())),
                  child: SvgPicture.asset(('images/setting.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(Receipt()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Receipt())),
                  child: SvgPicture.asset(('images/document.svg'),
                      color: ColorTheme.whiteColor)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(ShoppingCar()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ShoppingCar())),
                  child: SvgPicture.asset(('images/car.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(MyHomePage()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage())),
                  child: SvgPicture.asset(('images/home.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
          ],
        ),
      );
    }
    else if (CustomNavigationBar.value == 4) {
      return LanguageEnglish(context) == 'English'
          ? Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Color.fromRGBO(34, 53, 53, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(MyHomePage()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage())),
                  child: SvgPicture.asset(('images/home.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(ShoppingCar()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ShoppingCar())),
                  child: SvgPicture.asset(('images/car.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(Receipt()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Receipt())),
                  child: SvgPicture.asset(('images/document.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color: const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(Setting()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Setting())),
                  child: SvgPicture.asset(('images/setting.svg'),
                      color: ColorTheme.whiteColor)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(ToDoList()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ToDoList())),
                  child: SvgPicture.asset(('images/to_do_list1.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
          ],
        ),
      )
          : Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Color.fromRGBO(34, 53, 53, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(ToDoList()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ToDoList())),
                  child: SvgPicture.asset(('images/to_do_list1.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color: const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(Setting()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Setting())),
                  child: SvgPicture.asset(('images/setting.svg'),
                      color: ColorTheme.whiteColor)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(Receipt()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Receipt())),
                  child: SvgPicture.asset(('images/document.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(ShoppingCar()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ShoppingCar())),
                  child: SvgPicture.asset(('images/car.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(MyHomePage()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage())),
                  child: SvgPicture.asset(('images/home.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
          ],
        ),
      );
    }
    else {
      return LanguageEnglish(context) == 'English'
          ? Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Color.fromRGBO(34, 53, 53, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(MyHomePage()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage())),
                  child: SvgPicture.asset(('images/home.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(ShoppingCar()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ShoppingCar())),
                  child: SvgPicture.asset(('images/car.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(Receipt()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Receipt())),
                  child: SvgPicture.asset(('images/document.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color: const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(Setting()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Setting())),
                  child: SvgPicture.asset(('images/setting.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(ToDoList()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ToDoList())),
                  child: SvgPicture.asset(('images/to_do_list1.svg'),
                      color: ColorTheme.whiteColor)),
            ),
          ],
        ),
      )
          : Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: Color.fromRGBO(34, 53, 53, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(ToDoList()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ToDoList())),
                  child: SvgPicture.asset(('images/to_do_list1.svg'),
                      color: ColorTheme.whiteColor)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color: const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(Setting()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Setting())),
                  child: SvgPicture.asset(('images/setting.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(Receipt()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Receipt())),
                  child: SvgPicture.asset(('images/document.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(ShoppingCar()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>ShoppingCar())),
                  child: SvgPicture.asset(('images/car.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                  color:const Color.fromRGBO(34, 53, 53, 1),
                  // onPressed: () => Get.to(MyHomePage()),
                  onPressed: () =>
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage())),
                  child: SvgPicture.asset(('images/home.svg'),
                      color: ColorTheme.iconNotSelected)),
            ),
          ],
        ),
      );
    }
  }
}
