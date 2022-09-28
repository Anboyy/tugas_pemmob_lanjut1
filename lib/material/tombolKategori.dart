import 'package:flutter/material.dart';

class TombolKategori extends StatelessWidget {
  const TombolKategori({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [Icon(Icons.payment), Text('Payment')],
        ),
      ),
    );
  }
}
