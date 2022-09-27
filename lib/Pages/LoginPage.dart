import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/material/button.dart';
import 'package:tugas_pemmob_lanjut1/material/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final String Username = 'null';
  final String Password = 'null';
  final _loginKey = GlobalKey<LoginPageState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Koperasi Undiksha'),
        centerTitle: true,
        backgroundColor: Color(0xFF1C2474),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    'Assets/images/logo.png',
                    scale: 5,
                  ),
                  SizedBox(height: 10),
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      width: double.infinity,
                      // height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFF1C2474)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: const [
                              Text('Username'),
                              Spacer(),
                            ],
                          ),
                          InputLogin(Username, false),
                          Row(
                            children: const [
                              Text('Password'),
                              Spacer(),
                            ],
                          ),
                          InputLogin(Password, true),
                          Container(
                            width: 300,
                            child: Button('Login'),
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Daftar Sekarang')),
                              Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('Lupa Password?'))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
