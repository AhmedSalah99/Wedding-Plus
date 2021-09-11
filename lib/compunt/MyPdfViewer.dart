import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class MyPDFViewer extends StatefulWidget {
  final String invID;
  MyPDFViewer({this.invID});
  @override
  _MyPDFViewerState createState() => _MyPDFViewerState();
}

class _MyPDFViewerState extends State<MyPDFViewer> {
  bool _isLoading = true;
  PDFDocument document;

  loadDocument() async {
    document = await PDFDocument.fromURL(
        "http://192.168.145.252/wedding/pdf/invoice-" + widget.invID + ".pdf");

    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    loadDocument();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pdfviewer'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(document: document, zoomSteps: 1),
      ),
    );
  }
}
