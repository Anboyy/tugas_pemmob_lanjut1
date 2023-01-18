import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class qrcode extends StatefulWidget {
  const qrcode({Key? key}) : super(key: key);

  @override
  State<qrcode> createState() => _qrcodeState();
}

class _qrcodeState extends State<qrcode> {
  void parseUri() {
    url = Uri.parse(_data);
  }

  static String _data = '';
  Uri url = Uri.parse(_data);

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            '#000000', 'Cancel', true, ScanMode.BARCODE)
        .then(
      (value) => setState(
        () {
          _data = value;
          parseUri();
        },
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset('Assets/images/bc.jpg'),
              TextButton(
                child: const Text('Scan QR'),
                onPressed: () => _scan(),
              ),
              TextButton(
                  onPressed: () {
                    _launchUrl();
                  },
                  child: Text(_data))
            ],
          ),
        ),
      ),
    );
  }
}
