import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';
import 'package:tugas_pemmob_lanjut1/services/list_user_service.dart';

class MyGrid2 extends StatefulWidget {
  const MyGrid2({super.key});

  @override
  State<MyGrid2> createState() => _MyGrid2State();
}

class _MyGrid2State extends State<MyGrid2> {
  //1. buat variabel list user model
  List<ListUsersModel> _listUser = [];

  //2. buat fungsi get data user
  getUsers() async {
    ListUsersService _service = ListUsersService();
    await _service.getDataUsers().then((value) {
      setState(() {
        _listUser = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                getUsers();
              },
              child: Text(
                'Mygrid2',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _listUser.length,
                  itemBuilder: (context, index) {
                    ListUsersModel data = _listUser[index];
                    return cardlist(data.id!.toString(), data.firstName!,
                        Colors.red, data.avatar!, Colors.grey.shade100);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardlist(
      String title, String subtitle, Color color, String nilai, Color bgColor) {
    return Card(
      color: bgColor,
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(subtitle),
        trailing: Container(
          height: 50,
          width: 50,
          color: color,
          child: Center(
            child: Text(nilai,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  Widget gridText(String nilai) {
    return Center(
      child: Text(
        nilai,
        style: const TextStyle(
          fontSize: 60,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
