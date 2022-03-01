import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application/classes/app_localizations.dart';
import 'package:pos_application/classes/localization_const.dart';
import 'package:pos_application/controllers/user_controller.dart';
import 'package:pos_application/widget/custom_appbar.dart';
import '../models/busniss_model.dart';
import '../services/busniss_service.dart';

class BranchesScreen extends StatefulWidget {
  const BranchesScreen({Key? key}) : super(key: key);

  @override
  _BranchesScreenState createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  List<Business> businesses = [];

  bool loading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    init();
  }

  Future<void> init() async {
    BusnissApi api = BusnissApi();
    businesses = await api.getBusnissFromJson();
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            customAppBar(context),
            const Spacer(),
            Container(
              height: 675,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(children: [
                      const SizedBox(height: 40),
                      ...businesses
                          .map<Widget>(
                            (business) => _buildCustomCard(
                              context: context,
                              id: business.id,
                              title: business.name,
                            ),
                          )
                          .toList(),
                    ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomCard({
    required String title,
    required int id,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        Get.find<UserController>().setBusinessIs(id);
        navigator!.pop();
      },
      child: Container(
        width: 398,
        height: 119,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(248, 248, 248, 1),
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        margin: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            LanguageEnglish(context) != 'English'
                ? const Icon(Icons.arrow_back)
                : const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
