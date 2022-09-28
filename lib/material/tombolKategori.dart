import 'package:flutter/material.dart';

class TombolKategori extends StatelessWidget {
  // const TombolKategori({Key? key}) : super(key: key);
  var iconTombol;
  final String nama;
  TombolKategori(this.iconTombol, this.nama);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconTombol,
                size: 40,
                color: Colors.blue,
              ),
              Text(nama)
            ],
          ),
        ),
      ),
    );
  }
}
