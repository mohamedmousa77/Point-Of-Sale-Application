import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pos_application/controllers/firebase_product_controller.dart';
import 'package:pos_application/controllers/recipt_controller.dart';
import '../classes/localization_const.dart';
import '../controllers/user_controller.dart';
import '../screens/carr.dart';
import '../screens/clientdetails.dart';
import '../screens/details_screen.dart';
import '../screens/login_page.dart';
import '../screens/receipt.dart';
import '../screens/receipt_details.dart';
import '../screens/sections.dart';
import '../screens/setting.dart';
import '../screens/splashscreen2.dart';
import '../screens/to_do_list.dart';
import 'classes/app_localizations.dart';
import 'controllers/busniss_controller.dart';
import 'controllers/car_controller.dart';   
import 'controllers/category_brand_controller.dart';
import 'database/notes_database.dart';
import 'screens/print_receipt.dart';

void main() async {
  Get.put<CarController>(CarController());
  Get.put<UserController>(UserController());
  Get.put<FirebaseProductController>(FirebaseProductController());
  Get.put<CarController>(CarController());
  Get.put<InvoiceController>(InvoiceController());
  // NotesDataBase;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // QuerySnapshot<Map<String, dynamic>>data=await
  // FirebaseFirestore.instance.collection('active').get();
  // bool active = data.docs.first.data()['true'];
  // runApp(active ? MyApp() :const MaterialApp());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });

    //the inizialization of the category controller
    Get.put<CategoryController>(CategoryController());
    
    Get.put<BusnissController>(BusnissController());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // trying();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: CustomRo,
      home: Screen(),
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],

      //the local used
      locale: _locale,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],

      // Returns a locale which will be used by the app
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == deviceLocale!.languageCode &&
              supportedLocale.countryCode == deviceLocale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },

      // routes: {
      //   '/authPage': (context) => AuthPage(),
      //   '/carPage': (context) => ShoppingCar(),
      //   // '/details': (context) => const DetailsScreen(),
      //   // '/receipt': (context) => const Receipt(),
      //   '/sections': (context) =>  Section(),
      //   '/setting': (context) => Setting(),
      //   '/receiptDetails': (context) => const ReceiptDetails(),
      //   '/splachscreen': (context) => Screen(),
      //   '/clientdetails': (context) => const ClientDetails(),
      //   '/todolist': (context) => ToDoList(),
      // },
      //splash screen
    );
  }
}
