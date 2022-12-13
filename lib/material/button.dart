import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String NamaButton;

  Button(this.NamaButton);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (
            // InputLogin('Username', true).NamaController.toString() == '123' &&
            //         InputLogin('Password', false).NamaController.toString() == '123'
            NamaButton != null) {
        } else {
          // print();
        }
      },
      child: Text(NamaButton),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1C2474),
        shape: StadiumBorder(),
      ),
    );
  }
}
