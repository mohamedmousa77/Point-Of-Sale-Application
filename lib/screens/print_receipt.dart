// ignore_for_file: prefer_adjacent_string_concatenation, prefer_final_fields

import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application/controllers/car_controller.dart';
import 'package:pos_application/database/note.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:intl/intl.dart';

import '../models/company_model.dart';
import '../services/company_data_service.dart';

class Printer {
  List<Car> carProducts = [];
  String transactionId = "";
  String customerName = "";
  String phoneNumber = "";
  String address = "";
  // ignore: non_constant_identifier_names
  String VatNumber = "";
  String tax = '';
  BuildContext context;
  bool _secondType = false;
  Printer.firstType(this.carProducts, this.transactionId,this.context) {
    _printReceipt(context);
  }
  Printer.secondType(
    this.address,
    this.customerName,
      this.context,
  ) {
    _secondType = true;
    _printReceipt(context);
  }

  double totalNet = 1;
  double disc = 1;

  void _receipt(NetworkPrinter printer,
      // CompanyInfo companyData
      ) {
    double netValue = Get.find<CarController>().totalAmount.value * totalNet + Get.find<CarController>().totalAmount.value;
    if (transactionId.length < 7) {
      String temp = "";
      for (int i = 0; i < 7 - transactionId.length; i++) {
        temp += "0";
      }
      transactionId = temp + transactionId;
    }

    String _companyName =' companyData.name';
    String _companyAddress = 'companyData.address';
    String _phoneNumber = 'companyData.phoneNumber';
    String _VATNo = 'companyData.taxNumber';

    printer.text(_companyName, styles: const PosStyles(align: PosAlign.center));
    printer.text(_companyAddress, styles: const PosStyles(align: PosAlign.center));
    printer.text(_phoneNumber, styles: const PosStyles(align: PosAlign.center));
    printer.emptyLines(1);
    printer.text('Vat Num' + _VATNo);
    printer.emptyLines(1);
    printer.row(
      [
        PosColumn(text: 'Client Name : ' ),
        PosColumn(text: customerName),
      ]
    );
    printer.row(
        [
          PosColumn(text: 'Customer address : ' ),
          PosColumn(text: address),
        ]
    );
    printer.emptyLines(1);
    printer.text('transactionId' +
        "    " +
        "01" +
        "    " +
        "Cash" +
        "    " +
        DateTime.now().toString());
    printer.row([
      PosColumn(
          text: 'transactionId', styles: const PosStyles(align: PosAlign.center)),
      PosColumn(text: "01", styles: const PosStyles(align: PosAlign.center)),
      PosColumn(text: "cash", styles: const PosStyles(align: PosAlign.center)),
      PosColumn(
        text: DateTime.now().toString(),
        styles: const PosStyles(align: PosAlign.center),
      ),
    ]);
    printer.hr();
    printer.row([
      PosColumn(text: "Total", styles: const PosStyles(align: PosAlign.center)),
      PosColumn(text: "|", styles: const PosStyles(align: PosAlign.center)),
      PosColumn(text: "tax", styles: const PosStyles(align: PosAlign.center)),
      PosColumn(text: "|", styles: const PosStyles(align: PosAlign.center)),
      PosColumn(text: "price", styles: const PosStyles(align: PosAlign.center)),
      PosColumn(text: "|", styles: const PosStyles(align: PosAlign.center)),
      PosColumn(
        text: "quantity",
        styles: const PosStyles(align: PosAlign.center),
      ),
      PosColumn(text: "|", styles: const PosStyles(align: PosAlign.center)),
      PosColumn(text: "data", styles: const PosStyles(align: PosAlign.center)),
    ]);

    printer.hr();
    for (int c = 0; c < carProducts.length; c++) {
      printer.row([
        PosColumn(
          text: (carProducts[c].price * carProducts[c].count).toString(),
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(text: "|", styles: const PosStyles(align: PosAlign.center)),
        PosColumn(text: tax, styles: const PosStyles(align: PosAlign.center)),
        PosColumn(text: "|", styles: const PosStyles(align: PosAlign.center)),
        PosColumn(
          text: carProducts[c].price.toString(),
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(text: "|", styles: const PosStyles(align: PosAlign.center)),
        PosColumn(
          text: carProducts[c].count.toString(),
          styles: const PosStyles(align: PosAlign.center),
        ),
        PosColumn(text: "|", styles: const PosStyles(align: PosAlign.center)),
        PosColumn(
          text: carProducts[c].title,
          styles: const PosStyles(align: PosAlign.center),
        ),
      ]);
      printer.hr();
    }
    printer.text("Product value" +
        " | " +
        Get.find<CarController>().totalAmount.value.toString());
    printer.hr();
    printer.text('Disc' + " | " + disc.toString());
    printer.hr();
    printer.text('VAT ($tax)' +
        " | " +
        (Get.find<CarController>().totalAmount.value * totalNet).toString());
    printer.hr();
    printer.text('Net Total' + " | " + (netValue).toString());
    printer.hr();
    printer.text('Paid Amount' +
        " | " +
        Get.find<CarController>().totalAmount.value.toString());
    printer.hr();
    printer.text(
      'Balance' + '.00',
    );
    printer.hr();
    printer.text(
      "Total " +
          carProducts.length.toString() +
          "Item" +
          (carProducts.length == 1 ? "" : "s"),
    );
    printer.hr();
    printer.text("THANK YOU & VISIT AGAIN");
    printer.qrcode(
        "$_companyName \nVAT NO: $_VATNo ${DateFormat('yyyy/MM/dd hh:mm')}, BILL TOTAL: $netValue, VAT($tax%): ${Get.find<CarController>().totalAmount.value * totalNet}");
    printer.feed(2);
    printer.cut();
  }

  Future<void> _printReceipt(BuildContext context) async {
    print('in print receipt');
    // CompanyInfo companyData = await CompanyDataService().getCompanyData();
    const PaperSize paper = PaperSize.mm58;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);
    try{
      final PosPrintResult res =
      await printer.connect((Ipify.ipv4()).toString(), port: 9100);
      debugPrint(printer.port.toString());
      if (res == PosPrintResult.success) {
        print('success');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Success")));
        _receipt(printer,
          // companyData
        );
        printer.disconnect();
      } if (res==PosPrintResult.scanInProgress){
        print('Scan in progress');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Scan in Progress")));
      } if(res==PosPrintResult.printerNotSelected){
        print("Printer is not selected");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Printer is not selected")));
      }

      print('Print result: ${res.msg}');

    }catch(e){
      print(e.toString());
    }
   }
}
