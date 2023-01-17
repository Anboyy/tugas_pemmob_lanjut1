import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/material/kMaterial.dart';

class TombolDalam extends StatefulWidget {
  const TombolDalam(this.title, this.iconTombol, this.nama, this.onPressed);

  final iconTombol;
  final String title;
  final String nama;
  final VoidCallback? onPressed;

  @override
  State<TombolDalam> createState() => _TombolDalamState();
}

class _TombolDalamState extends State<TombolDalam> {
  @override
  Widget build(BuildContext context) {
    final heighscreen = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(50),
          // elevation: 4,
          child: Container(
            width: heighscreen * 0.1,
            height: heighscreen * 0.1,
            decoration: BoxDecoration(
                color: Color(0xFFDBE0EA),
                borderRadius: BorderRadius.circular(25)),
            child: InkWell(
              onTap: widget.onPressed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.iconTombol,
                    size: 30,
                    color: Colors.white,
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
          widget.title,
          style: kTextDalamBold,
        ),
        Text(
          widget.nama,
          style: kTextDalam,
        )
      ],
    );
  }
}
