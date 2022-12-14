import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';
import 'package:tugas_pemmob_lanjut1/services/list_user_service.dart';

class Deposito extends StatefulWidget {
  final ListUsersModel user;

  const Deposito({Key? key, required this.user}) : super(key: key);

  @override
  State<Deposito> createState() => _DepositoState();
}

class _DepositoState extends State<Deposito> {
  TextEditingController jumlahSetoranController = TextEditingController();
  bool setorLoading = false;
  int counter = 0;

  confirmDialog(String? user_id, String jumlah_setoran) {
    showDialog(
      context: (context),
      builder: (_) => AlertDialog(
        title: Text('Are You Sure?'),
        actions: [
          (setorLoading)
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      setorLoading = true;
                    });
                    await setorSaldo(user_id, jumlah_setoran);
                    Navigator.pop(context);
                  },
                  child: Text('Yes'),
                ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setor'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: jumlahSetoranController,
                    decoration: InputDecoration(labelText: "Jumlah Penyetoran"),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  confirmDialog(
                      widget.user.user_id, jumlahSetoranController.text);
                },
                child: Text('Setor'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  setorSaldo(String? user_id, String jumlah_setoran) async {
    ListUsersService _service = ListUsersService();
    await _service.setorSaldo(
        int.parse(user_id!), double.parse(jumlah_setoran));
    setState(() {
      setorLoading == false;
    });
  }
}
