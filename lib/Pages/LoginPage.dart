import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/Pages/dashboard.dart';
import 'package:tugas_pemmob_lanjut1/material/footer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String Username = '';
  late String Password = '';

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
                    scale: 5,
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
                            TextField(
                              onChanged: (value) {
                                Username = value;
                              },
                              obscureText: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
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
                              onChanged: (value) {
                                Password = value;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  contentPadding: EdgeInsets.all(1)),
                            ),
                            // InputLogin(Password, true),
                            Container(
                              width: 300,
                              // child: Button('Login'),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (Username == '123' && Password == '123') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Dashboard()),
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alert;
                                      },
                                    );
                                    print(Username);
                                    print(Password);
                                  }
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
                                    onPressed: () {},
                                    child: Text('Daftar Sekarang')),
                                // Spacer(),
                                TextButton(
                                    onPressed: () {},
                                    child: Text('Lupa Password?'))
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
                  footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
