import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/Pages/qr_code.dart';

class FAButton extends StatefulWidget {
  @override
  State<FAButton> createState() => _FAButtonState();
}

class _FAButtonState extends State<FAButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF1C2474),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => qrcode()),
      ),
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Icon(Icons.qr_code_scanner),
      ),
      elevation: 4.0,
    );
  }
}
