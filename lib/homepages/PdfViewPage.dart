import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../constants/constants.dart';

class PdfViewPage extends StatefulWidget {
  final String pdfUrl;
  final String pdfName;
  const PdfViewPage({super.key, required this.pdfUrl, required this.pdfName});

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainDarkColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white, size: 23),
        title: Text(
          widget.pdfName,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
      body: SfPdfViewer.network(
        widget.pdfUrl,
        canShowScrollHead: false,
        canShowScrollStatus: false,
        scrollDirection: PdfScrollDirection.vertical,
        enableDoubleTapZooming: true,
        enableTextSelection: true,
      ),
    );
  }
}
