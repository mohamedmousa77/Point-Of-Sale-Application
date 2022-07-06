import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_application/services/invoice_pdf/customer_model.dart';
import 'package:pos_application/services/invoice_pdf/supplier_model.dart';

import '../services/invoice_pdf/invoice_model.dart';

class InvoiceController extends GetxController {
  List<Invoice> invoiceList = [];

  Future<void> addInvoice(Invoice invoice) async {
    await FirebaseFirestore.instance.collection('invoice').add({
      // Invoice information
      'invoice_number' : invoice.info.number,
      'invoice_description' : invoice.info.description,
      'invoice_date' :  invoice.info.date,
      'invoice_dueDate' : invoice.info.dueDate,
      // customer data
      'customer_name' : invoice.customer.name,
      'customer_address' : invoice.customer.address,
      // supplier data
      'supplier_name' : invoice.supplier.name,
      'supplier_address' : invoice.supplier.address,
      'supplier_paymentInfo' :  invoice.supplier.paymentInfo,

    });
  }

  Future<List<Invoice>> fetchInvoice() async {
    debugPrint('fetchInvoice called!!!!!!!!! ');
    QuerySnapshot<Map<String, dynamic>> querySnapshotInvoice =
        await FirebaseFirestore.instance.collection('invoice').get();
    for (var invoice in querySnapshotInvoice.docs) {
      debugPrint('Invoice 1  id  ' +invoice.id );
      final invoiceData = await FirebaseFirestore.instance
          .collection('invoice')
          .doc(invoice.id)
          .get();
      invoiceList.add(Invoice(
          info: InvoiceInfo(
              description: invoiceData['invoice_description'],
              number: invoiceData['invoice_number'],
              date: invoiceData['invoice_date'],
              dueDate: invoiceData['invoice_dueDate']),
          supplier: Supplier(name: invoiceData['supplier_name'],
              address: invoiceData['supplier_address'],
              paymentInfo: invoiceData['supplier_paymentInfo']),
          customer: Customer(name: invoiceData['customer_name'],
              address: invoiceData['customer_address']),
          items: []
      ));
      debugPrint('Invoice add done ' +invoiceList.length.toString() );
    }
    debugPrint('Invoice add done ' +invoiceList.length.toString() );

    return invoiceList;
  }
}
