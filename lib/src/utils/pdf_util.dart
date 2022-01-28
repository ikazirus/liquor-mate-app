import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfUtils {
  final pw.Document pdf;

  PdfUtils() : pdf = pw.Document();

  addPage({required pw.Widget body}) {
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return body; // Center
        })); // Pa
  }

// final Uint8List fontData = File('open-sans.ttf').readAsBytesSync();
// final ttf = pw.Font.ttf(fontData.buffer.asByteData());

// pdf.addPage(pw.Page(
//     pageFormat: PdfPageFormat.a4,
//     build: (pw.Context context) {
//       return pw.Center(
//         child: pw.Text('Hello World', style: pw.TextStyle(font: ttf, fontSize: 40)),
//       );
//     }));

  save(String fileName) async {
    
    final file = File(FileUt "example.pdf");
    await file.writeAsBytes(await pdf.save());
  }
}
