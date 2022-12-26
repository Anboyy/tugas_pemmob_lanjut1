import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/services/list_user_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //username
              Container(
                child: TextField(
                  controller: username,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(fontSize: 25.0)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //password
              Container(
                child: TextField(
                  obscureText: true,
                  controller: password,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 25.0)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  postLogin(username.text, password.text);
                },
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }

  postLogin(String username, String password) async {
    ListUsersService _service = ListUsersService();
    await _service.postLogin(username, password);
  }
}
