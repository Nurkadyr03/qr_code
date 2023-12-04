import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScaner extends StatefulWidget {
  const QRScaner({super.key});

  @override
  State<QRScaner> createState() => _QRScanerState();
}

final GlobalKey qrkey = GlobalKey(debugLabel: "QR");
Barcode? result;
QRViewController? controller;

@override
void reassemble() {
  reassemble();
  if (Platform.isAndroid) {
    controller!.pauseCamera();
  } else if (Platform.isIOS) {
    controller!.resumeCamera();
  }
}

class _QRScanerState extends State<QRScaner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 5,
              child: QRView(key: qrkey, onQRViewCreated: onQRViewCamera)),
          Expanded(
            child: Center(
              child: (result != null)
                  ? Text("$controller")
                  : const Text("Scan a cod"),
            ),
          ),
        ],
      ),
    );
  }

  void onQRViewCamera(QRViewController controller) {
    //this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
    });
  }
  @override
  void dispose(){
    controller?.dispose();
    super.dispose();

  }
}
