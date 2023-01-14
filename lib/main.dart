import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_pemmob_lanjut1/Pages/LoginPage.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  Future<void> setPreference() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.containsKey('myData')) {
      pref.clear();
    }
    final myData = pref.setBool('isDark', isDark);
    setState(() {});
  }

  //
  Future<void> getPreference() async {
    final pref = await SharedPreferences.getInstance();
    final myData = pref.getBool('isDark');
    if (pref.containsKey('myData')) {
      isDark = myData! ? true : false;
    }
    setState(() {});
  }

  ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.amber,
      primarySwatch: Colors.amber);

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.amber,
    primarySwatch: Colors.amber,
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPreference(),
        builder: (context, _) => MaterialApp(
          // theme: isDark ? dark : light,
              // builder: (context, child) => ResponsiveWrapper.builder(
              //   child,
              //   breakpoints: [
              //     ResponsiveBreakpoint.autoScale(480, name: MOBILE),
              //     ResponsiveBreakpoint.resize(900, name: DESKTOP)
              //   ],
              // ),
              debugShowCheckedModeBanner: false,
              title: 'Koperasi Undiksha',
              home: LoginPage(),
            ));
  }
}
