import 'package:flutter/material.dart';
import 'package:qr_code/qr_image.dart';
import 'package:qr_code/qr_scaner.dart';

class QRCode extends StatefulWidget {
  const QRCode({super.key});

  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter+QrCode"),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                    labelText: "Enter your URL", border: OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRImage(controller: controller),
                    ),
                  );
                },
                child: const Text("GENERETE QR CODE")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QRScaner(),
                    ),
                  );
              },
              child: const Text("SCAN QR CODE"),
            ),
          ],
        ));
  }
}
