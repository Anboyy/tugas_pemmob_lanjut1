import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/material/kMaterial.dart';

class TombolKategori extends StatefulWidget {
  final iconTombol;
  final String nama;
  final VoidCallback? onPressed;

  const TombolKategori(this.iconTombol, this.nama, this.onPressed);

  @override
  State<TombolKategori> createState() => _TombolKategoriState();
}

class _TombolKategoriState extends State<TombolKategori> {
  @override
  Widget build(BuildContext context) {
    final heighscreen = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(50),
          elevation: 4,
          child: Container(
            width: heighscreen * 0.13,
            height: heighscreen * 0.13,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: InkWell(
              onTap: widget.onPressed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.iconTombol,
                    size: 40,
                    color: Colors.lightBlueAccent,
                  ),
                  //
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          widget.nama,
          style: kTextDalam,
        )
      ],
    );
  }
}
