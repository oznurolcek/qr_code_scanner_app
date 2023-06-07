import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LinkPage extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const LinkPage({
    super.key,
    required this.code,
    required this.closeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              closeScreen();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black54,
            ),
          ),
          centerTitle: true,
          title: const Text(
            "QR Scanner",
            style: TextStyle(
                color: Color(0xFF9BB8D0),
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                //QR CODE
                buildQrImage(context),
                buildResultText(),
                SizedBox(height: 10),
                buildCodeText(),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: buildCopyButton(),
                )
              ],
            ),
          ),
        ));
  }

  QrImageView buildQrImage(BuildContext context) {
    return QrImageView(
      data: code,
      size: MediaQuery.of(context).size.width * 0.8,
      version: QrVersions.auto,
    );
  }

  Text buildResultText() {
    return const Text(
      "Scanned result",
      style: TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          letterSpacing: 1),
    );
  }

  Text buildCodeText() {
    return Text(
      code,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          letterSpacing: 1),
    );
  }

  ElevatedButton buildCopyButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[100],
      ),
      onPressed: () {
        Clipboard.setData(ClipboardData(text: code));
        Fluttertoast.showToast(
            msg: "QR Code Link Copied!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blue[100],
            textColor: Colors.blue[300]);
      },
      child: const Text(
        "Copy",
        style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1),
      ),
    );
  }
}
