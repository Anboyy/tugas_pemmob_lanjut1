import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tugas_pemmob_lanjut1/material/kMaterial.dart';
import 'package:tugas_pemmob_lanjut1/material/tombolDalam.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';
import 'package:tugas_pemmob_lanjut1/services/list_user_service.dart';

class TabletView extends StatefulWidget {
  TabletView({Key? key, required this.user}) : super(key: key);

  final ListUsersModel user;

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  late int saldo = int.parse(widget.user.saldo.toString());
  int currentSelectedState = 0;
  String TextTitle = '';
  bool tranferLoading = false;
  bool penarikanLoading = false;
  bool setorLoading = false;
  TextEditingController jumlahTarikanController = TextEditingController();
  TextEditingController jumlahSetoranController = TextEditingController();
  TextEditingController jumlahTransferController = TextEditingController();
  TextEditingController nomorRekeningController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late String? namaUser = widget.user.nama;
    return SingleChildScrollView(
      child: Container(
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  child: SafeArea(
                    child: InkWell(
                      onTap: (() {
                        setState(() {
                          currentSelectedState = 0;
                        });
                      }),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('Assets/images/logo.png'),
                      ),
                    ),
                  ),
                  padding: EdgeInsets.all(6),
                  color: kWarnaBackgroundApp,
                  // color: Colors.amber,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.3,
                  // flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Material(
                        color: Color.fromARGB(255, 66, 164, 244),
                        elevation: 10.0,
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              TextTitle = 'Tarik Saldo';
                              currentSelectedState = 1;
                            });
                          },
                          leading: Icon(
                            Icons.wallet,
                            size: 35,
                          ),
                          title: Text(
                            'Tarik',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Color.fromARGB(255, 66, 164, 244),
                        elevation: 10.0,
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              TextTitle = 'Transfer';
                              currentSelectedState = 2;
                            });
                          },
                          leading: Icon(
                            Icons.wallet,
                            size: 35,
                          ),
                          title: Text(
                            'Transfer',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Color.fromARGB(255, 66, 164, 244),
                        elevation: 10.0,
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              TextTitle = 'Deposito';
                              currentSelectedState = 3;
                            });
                          },
                          leading: Icon(
                            Icons.wallet,
                            size: 35,
                          ),
                          title: Text(
                            'Deposito',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  color: kWarnaBackgroundApp,
                ),
              ],
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    currentSelectedState == 0
                        ? Stack(
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  width: double.infinity,
                                  child: Image.asset(
                                    'Assets/images/vg.png',
                                    fit: BoxFit.fill,
                                  )),
                              SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Hai $namaUser,',
                                                  style: kBoldFont),
                                              Text(
                                                'Apa yang akan kamu lakukan?',
                                                style: kNormalFont,
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.logout)),
                                          Container(
                                            height: 50,
                                            width: 50,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.green,
                                              // radius: 115,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.greenAccent[100],
                                                radius: 110,
                                                child: CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'Assets/images/logo.png'), //NetworkImage
                                                  // radius: 100,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'My Total Balance',
                                                    style: kTextDalam,
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    'Rp. ' + saldo.toString(),
                                                    style: kTextDalam,
                                                  ),
                                                  IconButton(
                                                      onPressed: () async {
                                                        ListUsersService
                                                            _service =
                                                            ListUsersService();
                                                        saldo = await _service
                                                            .getSaldo(int.parse(
                                                                widget.user
                                                                    .user_id
                                                                    .toString()));
                                                        setState(() {});
                                                      },
                                                      icon: Icon(Icons.refresh))
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  TombolDalam(
                                                      'Nama Nasabah',
                                                      Icons.account_circle,
                                                      widget.user.nama
                                                          .toString(),
                                                      () {}),
                                                  TombolDalam(
                                                      'Nomor Rekening',
                                                      Icons.contact_mail,
                                                      widget.user.nomor_rekening
                                                          .toString(),
                                                      () {})
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Colors.white),
                                        padding: EdgeInsets.all(10),
                                        // color: Colors.blue,
                                        width: double.infinity,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Butuh Bantuan?',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '0819-9361-6947',
                                                    style: TextStyle(
                                                        fontSize: 30,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Icon(
                                                Icons.call,
                                                size: 80,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : currentSelectedState == 2
                            ? SafeArea(
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Nomor Rekening',
                                      ),
                                      controller: nomorRekeningController,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Jumlah Transfer',
                                      ),
                                      controller: jumlahTransferController,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        confirmDialogTransfer(
                                            widget.user.user_id,
                                            jumlahTransferController.text,
                                            nomorRekeningController.text);
                                      },
                                      child: Text("Transfer"),
                                    ),
                                  ],
                                ),
                              )
                            : currentSelectedState == 1
                                ? SafeArea(
                                    child: Column(
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Jumlah Tarikan',
                                          ),
                                          controller: jumlahTarikanController,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            confirmDialogTarikan(
                                                widget.user.user_id,
                                                jumlahTarikanController.text);
                                          },
                                          child: Text("Tarik"),
                                        ),
                                      ],
                                    ),
                                  )
                                : currentSelectedState == 3
                                    ? SafeArea(
                                        child: Column(
                                          children: [
                                            TextField(
                                              decoration: InputDecoration(
                                                labelText: 'Jumlah Setoran',
                                              ),
                                              controller:
                                                  jumlahSetoranController,
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                confirmDialogSetoran(
                                                    widget.user.user_id,
                                                    jumlahSetoranController
                                                        .text);
                                              },
                                              child: Text("Setor"),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Text('data')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  confirmDialogSetoran(String? user_id, String jumlah_setoran) {
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

  confirmDialogTransfer(
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
                    // await tarikSaldo(user_id, jumlah_setoran);
                    await tranferSaldo(
                        int.parse(widget.user.user_id.toString()),
                        jumlah_transfer,
                        nomor_rekening);
                    showNotification();
                    Navigator.pop(context);
                  },
                  child: Text('Yes'),
                ),
        ],
      ),
    );
  }

  confirmDialogTarikan(String? user_id, String jumlah_tarikan) {
    showDialog(
      context: (context),
      builder: (_) => AlertDialog(
        title: Text('Are You Sure?'),
        actions: [
          (penarikanLoading)
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      penarikanLoading = true;
                    });
                    await tarikSaldo(user_id, jumlah_tarikan);
                    Navigator.pop(context);
                  },
                  child: Text('Yes'),
                ),
        ],
      ),
    );
  }

  setorSaldo(String? user_id, String jumlah_setoran) async {
    ListUsersService _service = ListUsersService();
    await _service.setorSaldo(
        int.parse(user_id!), double.parse(jumlah_setoran));
    setState(() {
      setorLoading = false;
    });
  }

  tranferSaldo(
      int user_id, String jumlah_setoran, String nomor_rekening) async {
    ListUsersService _service = ListUsersService();
    await _service.transfer(
        user_id, double.parse(jumlah_setoran), nomor_rekening);
  }

  tarikSaldo(String? user_id, String jumlah_tarikan) async {
    ListUsersService _service = ListUsersService();
    await _service.tarikSaldo(
        int.parse(user_id!), double.parse(jumlah_tarikan));
    setState(() {
      penarikanLoading = false;
    });
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
