import 'dart:io';

// import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfInvoiceApi{
  static Future<File> generate(Invoice invoice)async{
final pdf = Document();
return PdfApi.saveDocument(name:'',pdf:pdf);
  }
}