import 'package:flutter/material.dart';
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
  List<ListUsersModel> _listUser = [];
  bool tranferLoading = false;
  bool penarikanLoading = false;
  TextEditingController jumlahTarikanController = TextEditingController();

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
                            ? FutureBuilder<List<ListUsersModel>?>(
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
                                : Text(TextTitle)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Material customerTile(String title, int selectedIndex, Icon icon) {
    return Material(
      color: Color.fromARGB(255, 66, 164, 244),
      elevation: 10.0,
      child: ListTile(
        onTap: () {
          setState(() {
            TextTitle = title;
            currentSelectedState = selectedIndex;
          });
        },
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
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
            // userPopUp(int.parse(id));
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

  confirmDialogTarikan(String? user_id, String jumlah_setoran) {
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
                    await tarikSaldo(user_id, jumlah_setoran);
                    Navigator.pop(context);
                  },
                  child: Text('Yes'),
                ),
        ],
      ),
    );
  }

  tarikSaldo(String? user_id, String jumlah_tarikan) async {
    ListUsersService _service = ListUsersService();
    await _service.tarikSaldo(
        int.parse(user_id!), double.parse(jumlah_tarikan));
    setState(() {
      penarikanLoading = false;
    });
  }
}
//
// TextButton(onPressed: (){}, child: Text('refresh')),
// Expanded(
//   child: FutureBuilder<List<ListUsersModel>?>(
//     builder: (context, snapshot) {
//       return ListView.builder(
//           itemCount: _listUser.length,
//           itemBuilder: (context, index) {
//             ListUsersModel data = _listUser[index];
//             return listTileUser(
//                 data.user_id!.toString(),
//                 data.saldo,
//                 data.username!,
//                 Colors.blue,
//                 data.saldo!,
//                 Colors.grey.shade100,
//                 data.nama.toString());
//           });
//     },
//   ),
// ),
