import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tugas_pemmob_lanjut1/Pages/fitur_bank_indonesia/transfer_from_rekening.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';
import 'package:tugas_pemmob_lanjut1/services/list_user_service.dart';
import 'package:tugas_pemmob_lanjut1/services/local_notification_service.dart';

class Transfer extends StatefulWidget {
  final ListUsersModel user;

  const Transfer({Key? key, required this.user}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  List<ListUsersModel> _listUser = [];
  bool tranferLoading = false;
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    super.initState();
  }

  getUsers() async {
    ListUsersService _service = ListUsersService();
    await _service.getDataUsers().then(
      (value) {
        setState(
          () {
            _listUser = value!;
            tranferLoading = false;
          },
        );
      },
    );
  }

  tarikSaldo(String? user_id, String biayaTf) async {
    ListUsersService _service = ListUsersService();
    await _service.tarikSaldo(int.parse(user_id!), double.parse(biayaTf));
    setState(() {
      // penarikanLoading = false;
    });
  }

  tranferSaldo(
      int user_id, String jumlah_setoran, String nomor_rekening) async {
    ListUsersService _service = ListUsersService();
    await _service.transfer(
        user_id, double.parse(jumlah_setoran), nomor_rekening);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: getUsers, icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TranferRekening(
                            user: widget.user,
                          )),
                );
              },
              icon: Icon(Icons.add)),
        ],
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
      // isThreeLine: true,
      title: Text(nama,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      // subtitle: Text(subtitle + '\n' + saldo.toString()),
      trailing: IconButton(
          onPressed: () {
            // transferDialog(nama, int.parse(id));
            userPopUp(int.parse(id));
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

  userPopUp(int id) async {
    ListUsersService _service = ListUsersService();
    ListUsersModel user = await _service.getSingleUser(id);
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.nama.toString()),
                  Text("Nomor rekening: " + user.nomor_rekening.toString()),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Batal")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      transferDialog(
                          user.nama.toString(),
                          int.parse(widget.user.user_id.toString()),
                          user.nomor_rekening.toString());
                    },
                    child: Text("Transfer"))
              ],
            ));
  }

  transferDialog(String nama, int id, String nomor_rekening) {
    TextEditingController jumlahSetoranController = TextEditingController();
    // TextEditingController nomor_rekening = TextEditingController();
    late String biayaTf = '1093';
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
                    await tranferSaldo(
                        id, jumlahSetoranController.text, nomor_rekening);
                    await tarikSaldo(id.toString(), biayaTf);
                    showNotification();
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
                  // TextField(
                  //   decoration: InputDecoration(
                  //     labelText: "No rekening",
                  //   ),
                  //   controller: noRekeningController,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high channel',
      'Very important notification!!',
      description: 'the first notification',
      importance: Importance.max,
    );

    await flutterLocalNotificationsPlugin.show(
      1,
      'Bank Undiksha',
      'Berhasil Transfer',
      NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description),
      ),
    );
  }
}
