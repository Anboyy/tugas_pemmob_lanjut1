import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';
import 'package:tugas_pemmob_lanjut1/services/list_user_service.dart';

class TranferRekening extends StatefulWidget {
  const TranferRekening({Key? key, required this.user}) : super(key: key);

  final ListUsersModel user;

  @override
  State<TranferRekening> createState() => _TranferRekeningState();
}

class _TranferRekeningState extends State<TranferRekening> {
  late String biayaTf = '1093';
  bool penarikanLoading = false;
  final TextEditingController jumlahTransfer = TextEditingController();
  final TextEditingController nomorRekening = TextEditingController();

  confirmDialog(
      String? user_id, String jumlah_transfer, String nomor_rekening) {
    showDialog(
      context: (context),
      builder: (_) => AlertDialog(
        title: Text('Are You Sure Transfer to $nomor_rekening'),
        actions: [
              (penarikanLoading)
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () async {
                  setState(() {
                      penarikanLoading = true;
                    });
                    await tranferSaldo(
                        int.parse(widget.user.user_id.toString()),
                        jumlah_transfer,
                        nomor_rekening);
                    // tarikSaldo(widget.user.user_id, biayaTf);
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
        title: Text('Transfer to Rekening'),
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
                    controller: jumlahTransfer,
                    decoration: InputDecoration(labelText: "Jumlah Transfer"),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: nomorRekening,
                    decoration: InputDecoration(labelText: "Nomor Rekening"),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: () {
                  confirmDialog(widget.user.user_id, jumlahTransfer.text,
                      nomorRekening.text);
                },
                child: Text('Transfer'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  tranferSaldo(
      int user_id, String jumlah_setoran, String nomor_rekening) async {
    ListUsersService _service = ListUsersService();
    await _service.transfer(
        user_id, double.parse(jumlah_setoran), nomor_rekening);
    setState(() {
      penarikanLoading = false;
    });
  }

  tarikSaldo(String? user_id, String biayaTf) async {
    ListUsersService _service = ListUsersService();
    await _service.tarikSaldo(int.parse(user_id!), double.parse(biayaTf));
    setState(() {
      // penarikanLoading = false;
    });
  }
}
