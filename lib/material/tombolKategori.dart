import 'package:flutter/material.dart';

class TombolKategori extends StatelessWidget {
  // const TombolKategori({Key? key}) : super(key: key);
  var iconTombol;
  final String nama;
  TombolKategori(this.iconTombol, this.nama);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(iconTombol), Text(nama)],
        ),
      ),
    );
  }
}
