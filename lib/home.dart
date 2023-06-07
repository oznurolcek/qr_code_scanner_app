import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner_app/history_page.dart';
import 'package:qr_code_scanner_app/link_page.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HistoryPage()));
          },
          icon: Icon(
            Icons.history,
            color: Colors.blue[200],
          ),
        ),
        centerTitle: true,
        title: Text(
          "QR Scanner",
          style: TextStyle(
              color: Colors.blue[300],
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      backgroundColor: Color(0xFFDEE4E7),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildRoutingText(),
            buildScannerArea(),
            buildScanningText(),
          ],
        ),
      ),
    );
  }

  Expanded buildRoutingText() {
    return const Expanded(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Please the QR code in the area",
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 1),
        ),
        SizedBox(height: 10),
        Text(
          "Scanning will be automatical",
          style: TextStyle(
            color: Colors.black45,
            fontSize: 14,
            letterSpacing: 1,
          ),
        )
      ]),
    );
  }

  Expanded buildScannerArea() {
    return Expanded(
      flex: 3,
      child: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) {
              foundBarcode(capture);
            },
          ),
          QRScannerOverlay(
            color: Color(0xFFDEE4E7),
          )
        ],
      ),
    );
  }

  Expanded buildScanningText() {
    return const Expanded(
      child: Column(
        children: [
          Text(
            "Scanning...",
            style: TextStyle(
                color: Colors.black45, fontSize: 14, letterSpacing: 3),
          )
        ],
      ),
    );
  }

  void foundBarcode(barcode) {
    if (!isScanCompleted) {
      print("okundu");
      String code = barcode.rawValue ?? "---";
      isScanCompleted = true;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LinkPage(
                    closeScreen: closeScreen,
                    code: code,
                  )));
    }
  }
}
