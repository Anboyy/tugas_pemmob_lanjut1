import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/Pages/LoginPage.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';
import 'package:tugas_pemmob_lanjut1/services/list_user_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late String Username = '';
  late String Password = '';
  late String nama = '';
  late String nim = '';

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
                              onChanged: (value) {
                                Username = value;
                              },
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
                              onChanged: (value) {
                                Password = value;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(1),
                              ),
                            ),
                            Row(
                              children: const [
                                Text('Nim'),
                                Spacer(),
                              ],
                            ),
                            TextField(
                              onChanged: (value) {
                                nim = value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(1),
                              ),
                            ),
                            Row(
                              children: const [
                                Text('Nama'),
                                Spacer(),
                              ],
                            ),
                            TextField(
                              onChanged: (value) {
                                nama = value;
                              },
                              obscureText: false,
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
                                  await _service.postRegister(
                                      Username, Password, nama, nim);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
                                  );
                                  setState(() {});
                                },
                                child: Text("Daftar"),
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
                                          builder: (context) => LoginPage()),
                                    );
                                  },
                                  child: Text('Sudah Daftar?'),
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
}
