import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_pemmob_lanjut1/Pages/LoginPage.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';
import 'package:tugas_pemmob_lanjut1/services/list_user_service.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
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
  bool isLogin = false;

  Future<String?> getPrefs() async {
    final pref = await SharedPreferences.getInstance();
    final myLogin = pref.getString('username');
    return myLogin;
  }

  Future<ListUsersModel> LoginPref() async {
    final pref = await SharedPreferences.getInstance();
    final username = pref.getString('username');
    final password = pref.getString('password');
    ListUsersService _service = ListUsersService();
    ListUsersModel user = _service.postLogin(username!, password!);
    return user;
  }

  Future<bool?> getLoginPref() async {
    final pref = await SharedPreferences.getInstance();
    final myLogin = pref.getBool('isLogin');
    if (pref.containsKey('myLogin')) {
      isLogin = myLogin! ? true : false;
    }
    setState(() {});
  }

  // Future<void> getPreference() async {
  //   final pref = await SharedPreferences.getInstance();
  //   final myData = pref.getBool('isDark');
  //   if (pref.containsKey('myData')) {
  //     isDark = myData! ? true : false;
  //   }
  //   setState(() {});
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final data = message.data['test'];

        print(data);
      }
    });

    //foreground
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.title);
      print(message.notification!.title);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final data = message.data['test'];

      print(data);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getLoginPref(),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Koperasi Undiksha',
        home: LoginPage(),
      ),
    );
  }
}

