import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/Pages/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koperasi Undiksha',
      home: LoginPage(),
    );
  }
}
