import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';
import 'package:tugas_pemmob_lanjut1/services/list_user_service.dart';

class Transfer extends StatefulWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  List<ListUsersModel> _listUser = [];
  bool tranferLoading = false;

  getUsers() async {
    ListUsersService _service = ListUsersService();
    await _service.getDataUsers().then((value) {
      setState(() {
        _listUser = value!;
        tranferLoading = false;
      });
    });
  }

  tranferSaldo(int user_id, String jumlah_setoran) async {
    ListUsersService _service = ListUsersService();
    await _service.transfer(user_id, double.parse(jumlah_setoran));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: getUsers, icon: Icon(Icons.refresh))],
        title: Text('Transfer'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<ListUsersModel>?>(
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: _listUser.length,
                    itemBuilder: (context, index) {
                      ListUsersModel data = _listUser[index];
                      return listTileUser(
                          data.user_id!.toString(),
                          data.saldo,
                          data.username!,
                          Colors.blue,
                          data.saldo!,
                          Colors.grey.shade100,
                          data.nama.toString());
                    });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listTileUser(String id, String? saldo, String subtitle, Color color,
      String nilai, Color bgColor, String nama) {
    return ListTile(
      isThreeLine: true,
      title: Text(nama,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(subtitle + '\n' + saldo.toString()),
      trailing: IconButton(
          onPressed: () {
            transferDialog(nama, int.parse(id));
            // succesDialog();
          },
          icon: Icon(Icons.money_outlined)),
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

  transferDialog(String nama, int id) {
    TextEditingController jumlahSetoranController = TextEditingController();
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Batal'),
          ),
          (tranferLoading)
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      tranferLoading = true;
                    });
                    // tranferSaldo(id, jumlahSetoranController.text);
                    await tranferSaldo(id, jumlahSetoranController.text);
                    getUsers();

                    Navigator.pop(context);
                  },
                  child: Text('Transfer'),
                ),
        ],
        title: Text('Transfer to $nama'),
        content: Column(
          children: [
            Container(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Jumlah Setoran",
                    ),
                    controller: jumlahSetoranController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
