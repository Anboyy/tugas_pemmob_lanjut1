import 'package:flutter/material.dart';

class DataNasabah extends StatelessWidget {
  final String Data;
  final String NamaNasabah;

  DataNasabah(this.Data, this.NamaNasabah);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.lightBlueAccent),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Data,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(NamaNasabah),
          ],
        ),
      ),
    );
  }
}
