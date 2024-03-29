import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/Pages/dashboard.dart';
import 'package:tugas_pemmob_lanjut1/Pages/register.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';
import 'package:tugas_pemmob_lanjut1/services/list_user_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // String Username = '';
  // String Password = '';

  TextEditingController Username = TextEditingController();
  TextEditingController Password = TextEditingController();

  AlertDialog alert = AlertDialog(
    title: Text("Login Failed"),
    content: Text("Try to Check your Username or Password"),
  );

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
            padding: const EdgeInsets.all(0.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image.asset(
                    'Assets/images/logo.png',
                    scale: 6,
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                            TextField(
                              controller: Username,
                              obscureText: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.all(1)),
                            ),
                            // InputLogin(Username, false),
                            Row(
                              children: const [
                                Text('Password'),
                                Spacer(),
                              ],
                            ),
                            TextField(
                              controller: Password,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(1),
                              ),
                            ),
                            // InputLogin(Password, true),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              // child: Button('Login'),
                              child: ElevatedButton(
                                onPressed: () async {
                                  ListUsersService _service =
                                      ListUsersService();
                                  ListUsersModel user = await _service
                                      .postLogin(Username.text, Password.text);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Dashboard(user: user)),
                                  );
                                },
                                child: Text("Login"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF1C2474),
                                  shape: StadiumBorder(),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterPage()),
                                    );
                                  },
                                  child: Text('Daftar Sekarang'),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Lupa Password?'),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  // footer(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.amber,
          height: 20,
          child: Text(
            'Copyright@2022 by Yawdiv',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  postLogin(String username, String password) async {
    ListUsersService _service = ListUsersService();
    await _service.postLogin(username, password);
    // print(user.username);
  }
}
