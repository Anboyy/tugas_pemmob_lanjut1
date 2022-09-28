import 'package:flutter/material.dart';

class footer extends StatelessWidget {
  const footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Copyright@2022 by Yawdiv',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      width: double.infinity,
      height: 50,
      color: Colors.amber,
    );
  }
}
