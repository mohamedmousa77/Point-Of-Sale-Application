import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application/theme/colors.dart';
import '../classes/app_localizations.dart';
import '../classes/localization_const.dart';
import '../controllers/recipt_controller.dart';
import '../models/transaction_model.dart';
import '../services/invoice_pdf/invoice_model.dart';
import '../services/transaction_selling_servivce.dart';
import '../services/transaction_service.dart';
import '../widget/bill_card.dart';
import '../widget/change_language_style.dart';
import '../widget/custom_appbar.dart';
import '../widget/custom_navigator_bar.dart';

class Receipt extends StatefulWidget {
  const Receipt({Key? key}) : super(key: key);

  @override
  _ReceiptState createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  @override
  void initState() {
    // TODO: implement initState

    Get.find<InvoiceController>().fetchInvoice();
    debugPrint('Invoice add done ' +Get.find<InvoiceController>().invoiceList.length.toString() );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customAppBar(context),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          // title page
          Center(
            child: Container(
              padding: EdgeInsets.only(
                  left: LanguageEnglish(context) == 'English' ? 150 : 120,
                  top: 25),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.09,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  color: Colors.white),
              child: Text(
                  AppLocalizations.of(context)!
                      .getTranslatedValue('bills_text')
                      .toString(),
                  style: getcustomertextStyle(
                      context, 20, FontWeight.bold, Colors.black)),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.61,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: FutureBuilder(
                // future: TransactionApi().getTransactionFromJson(),
                future: Get.find<InvoiceController>().fetchInvoice(),
                builder: (BuildContext ctx, AsyncSnapshot<List<Invoice>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, index) => Column(
                        children: [
                          billCard(
                            context,
                            snapshot.data![index]
                            // snapshot.data![index].id,
                            // snapshot.data![index].transactionDate,
                            // snapshot.data![index].type,
                            // int.tryParse(snapshot.data![index].contactId ?? "1") ?? 1,
                            // snapshot.data![index].totalBeforeTax,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator(color: textPrimaryColor));
                  }
                }),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(3),
    );
  }
}
