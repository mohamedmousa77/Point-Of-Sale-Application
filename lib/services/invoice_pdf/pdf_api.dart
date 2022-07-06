import 'dart:io';

import 'package:flutter/material.dart';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfApi{
    static Future<File> saveDocument({
        required String name,
        required Document pdf,
    }) async {
        final bytes = await pdf.save();

        final dir = await getApplicationDocumentsDirectory();
        final file = File('${dir.path}/$name');

        await file.writeAsBytes(bytes);

        return file;
    }

    static Future openFile(File file) async {
        debugPrint('openFile called!!');
        final url = file.path;
        debugPrint('url ' + url);
        await OpenFile.open(url);
    }

}