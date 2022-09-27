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
          borderRadius: BorderRadius.circular(10), color: Colors.amber),
      child: Container(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Data),
            Text(NamaNasabah),
          ],
        ),
      ),
    );
  }
}
