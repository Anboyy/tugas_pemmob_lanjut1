import 'package:flutter/material.dart';

class DataNasabah extends StatelessWidget {
  final String Data;
  final String NamaNasabah;

  DataNasabah(this.Data, this.NamaNasabah);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text(Data),
          Text(NamaNasabah),
        ],
      ),
    );
  }
}
