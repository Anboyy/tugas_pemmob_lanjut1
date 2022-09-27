import 'package:flutter/material.dart';

class InputLogin extends StatelessWidget {
  var NamaController;
  bool obsecure = false;

  InputLogin(this.NamaController, this.obsecure);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        NamaController = value;
      },
      obscureText: obsecure,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          contentPadding: EdgeInsets.all(1)),
    );
  }
}
