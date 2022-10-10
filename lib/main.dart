import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_pemmob_lanjut1/Pages/LoginPage.dart';
import 'package:tugas_pemmob_lanjut1/material/bottomappbar.dart';
import 'package:tugas_pemmob_lanjut1/provider/bottomnavbarListener.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => BottomBarListener()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Koperasi Undiksha',
      home: LoginPage(),
    );
  }
}
