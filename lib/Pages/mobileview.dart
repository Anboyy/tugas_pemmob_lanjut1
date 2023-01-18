import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tugas_pemmob_lanjut1/Pages/fitur_bank_indonesia/setoran.dart';
import 'package:tugas_pemmob_lanjut1/Pages/fitur_bank_indonesia/penarikan.dart';
import 'package:tugas_pemmob_lanjut1/Pages/fitur_bank_indonesia/transfer.dart';
import 'package:tugas_pemmob_lanjut1/material/kMaterial.dart';
import 'package:tugas_pemmob_lanjut1/material/tombolDalam.dart';
import 'package:tugas_pemmob_lanjut1/material/tombolKategori.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';
import 'package:tugas_pemmob_lanjut1/services/list_user_service.dart';

class MobileView extends StatefulWidget {
  final ListUsersModel user;

  MobileView({Key? key, required this.user}) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  late int saldo = int.parse(widget.user.saldo.toString());
  late String namaUser = widget.user.username.toString();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    child: Image.asset(
                      'Assets/images/vg.png',
                      fit: BoxFit.cover,
                    )),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hai $namaUser,', style: kBoldFont),
                                Text(
                                  'Apa yang akan kamu lakukan?',
                                  style: kNormalFont,
                                ),
                              ],
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.logout)),
                            Container(
                              height: 50,
                              width: 50,
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                // radius: 115,
                                child: CircleAvatar(
                                  backgroundColor: Colors.greenAccent[100],
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(19.0),
                        child: Material(
                          elevation: 3,
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
                              // border: Border.all(color: Color(0xFF1C2474)),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          ListUsersService _service =
                                              ListUsersService();
                                          saldo = await _service.getSaldo(
                                              int.parse(widget.user.user_id
                                                  .toString()));
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.refresh))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                          child: TombolDalam(
                                              'Nama Nasabah',
                                              Icons.account_circle,
                                              widget.user.nama.toString(),
                                              () {})),
                                      Flexible(
                                          child: TombolDalam(
                                              'Nomor Rekening',
                                              Icons.contact_mail,
                                              widget.user.nomor_rekening
                                                  .toString(),
                                              () {})),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 30,
              runSpacing: 30,
              children: [
                TombolKategori(
                  Icons.monetization_on_sharp,
                  'Transfer',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Transfer(user: widget.user),
                      ),
                    );
                  },
                ),
                TombolKategori(
                  Icons.payments_outlined,
                  'Setoran',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Deposito(
                                user: widget.user,
                              )),
                    );
                  },
                ),
                TombolKategori(
                  Icons.payments_outlined,
                  'Penarikan',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Penarikan(user: widget.user)),
                    );
                  },
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Material(
            //     ,
            //     borderRadius: BorderRadius.all(
            //       Radius.circular(10),
            //     ),
            //     child: Container(
            //       padding: EdgeInsets.all(10),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       // child:
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Butuh Bantuan?',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '0819-9361-6947',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
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
    );
  }
}
