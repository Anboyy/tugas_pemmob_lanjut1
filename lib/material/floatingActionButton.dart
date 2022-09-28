import 'package:flutter/material.dart';

class FAButton extends StatelessWidget {
  const FAButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF1C2474),
      onPressed: () {},
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: Icon(Icons.qr_code_scanner),
      ),
      elevation: 4.0,
    );
  }
}
