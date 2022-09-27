import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/Pages/dashboard.dart';
import 'package:tugas_pemmob_lanjut1/material/textfield.dart';

class Button extends StatelessWidget {
  final String NamaButton;

  Button(this.NamaButton);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (InputLogin('Username', true).NamaController.toString() == '123' &&
                InputLogin('Password', false).NamaController.toString() == '123'
            // NamaButton != null
            ) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
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
