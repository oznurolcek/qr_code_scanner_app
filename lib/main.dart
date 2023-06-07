import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      )),
      home: Home(),
      title: 'QR Code Scanner',
      debugShowCheckedModeBanner: false,
    );
  }
}
