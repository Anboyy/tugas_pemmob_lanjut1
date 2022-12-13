import 'package:flutter/material.dart';

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
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: Container(
        width: heighscreen * 0.13,
        height: heighscreen * 0.13,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: widget.onPressed,
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
