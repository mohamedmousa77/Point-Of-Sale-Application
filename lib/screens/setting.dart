import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application/classes/app_localizations.dart';
import 'package:pos_application/classes/localization_const.dart';
import 'package:pos_application/controllers/user_controller.dart';
import 'package:pos_application/screens/branches_screen.dart';
import 'package:pos_application/screens/login_page.dart';
import '../widget/change_password_card.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';
import '../widget/language_card.dart';

import '../services/user_login_service.dart';
import 'add_product.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(context), //the custom app bar
            SizedBox(height: MediaQuery.of(context).size.height * 0.035),
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: languageCard(context)),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: changePasswordCard(context)),
                  _buildCustomCard(context: context),

                  _buildLogOutCard(context: context),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(4),
    );
  }

  Widget _buildCustomCard({
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const AddProduct());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.92,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(248, 248, 248, 1),
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.only(top: 20),
        child: LanguageEnglish(context) == "English"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    // AppLocalizations.of(context)!
                    //     .getTranslatedValue("branch")
                    //     .toString(),
                    'Add Product',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.arrow_forward)),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: const Icon(Icons.arrow_back)),
                  Container(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      AppLocalizations.of(context)!
                          .getTranslatedValue("branch")
                          .toString(),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildLogOutCard({
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () async {
        UserLoginApi userLoginApi = UserLoginApi();
        showDialog(
            context: context,
            builder: (_) => const Center(child: CircularProgressIndicator()),
            barrierDismissible: false);
        bool loggedOut = await userLoginApi.logout();
        Navigator.pop(context);
        if (loggedOut) {
          Get.off(() => AuthPage());
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.92,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(248, 248, 248, 1),
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.only(top: 20),
        child: LanguageEnglish(context) == "English"
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .getTranslatedValue("log_out")
                        .toString(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.logout_outlined)),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: const Icon(Icons.logout_outlined)),
                  Container(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      AppLocalizations.of(context)!
                          .getTranslatedValue("log_out")
                          .toString(),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
