import 'package:flutter/material.dart';
import 'package:qr_code/qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black54,primarySwatch: Colors.green,
      
      ),
      home: const QRCode(),
    );
  }
}

