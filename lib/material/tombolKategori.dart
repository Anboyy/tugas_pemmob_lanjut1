import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_pemmob_lanjut1/material/bottomappbar.dart';

class TombolKategori extends StatefulWidget {
  // const TombolKategori({Key? key}) : super(key: key);
  var iconTombol;
  final String nama;

  TombolKategori(this.iconTombol, this.nama);

  @override
  State<TombolKategori> createState() => _TombolKategoriState();
}

class _TombolKategoriState extends State<TombolKategori> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size.height;
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Container(
        width: screen * 0.17,
        height: screen * 0.17,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {
            print(context.read<BottomAppBarAn>());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.iconTombol,
                size: 40,
                color: Colors.blue,
              ),
              Text(widget.nama)
            ],
          ),
        ),
      ),
    );
  }
}
