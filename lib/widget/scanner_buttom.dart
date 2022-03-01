import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../screens/barcode_result.dart';

class customScannerButtom extends StatefulWidget {
  @override
  _customScannerButtomState createState() => _customScannerButtomState();
}

class _customScannerButtomState extends State<customScannerButtom> {
  String QrScan = 'Unknow';
  bool _qrCodeSuccess = false;
  Future<String> scanQr() async {
    try {
      final qrScan = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.DEFAULT,
      );

      if (!mounted) return "";
      setState(() {
        QrScan = qrScan;
        _qrCodeSuccess = true;
      });
      return qrScan;
    } on PlatformException {
      QrScan = 'Failed to get platform version';
      throw ("Failed to get platform version");
    } catch (error) {
      throw ("Class (Scanner_Buttom) ------ Function (scanQr()) ---Exeption ($error)");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.13,
      height: MediaQuery.of(context).size.height * 0.1,
      margin: const EdgeInsets.only(top: 47),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30, top: 30),
      decoration: const BoxDecoration(color: Color.fromRGBO(236, 238, 244, 1)),
      child: InkWell(
        onTap: () async {
          String _barCode = await scanQr();
          List<dynamic> _list = [_barCode, _qrCodeSuccess];
          Get.to(() => const BarCodeResult(), arguments: _list);
        },
        child: SvgPicture.asset('images/scan.svg'),
      ),
    );
  }
}
