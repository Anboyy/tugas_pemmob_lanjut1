import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';
import 'package:tugas_pemmob_lanjut1/services/list_user_service.dart';

class MyGrid extends StatefulWidget {
  const MyGrid({super.key});

  @override
  State<MyGrid> createState() => _MyGridState();
}

class _MyGridState extends State<MyGrid> {
  List<ListUsersModel> _listUser = [];

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
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(builder: ((context, constraint) {
        if (constraint.maxWidth > 600) {
          return tampilanLebar();
        } else {
          return tampilanNormal();
        }
      })),
    );
  }

  Widget tampilanLebar() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.teal,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget tampilanNormal() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
