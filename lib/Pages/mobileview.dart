import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/Pages/fitur_bank_indonesia/cek_saldo.dart';
import 'package:tugas_pemmob_lanjut1/Pages/fitur_bank_indonesia/setoran.dart';
import 'package:tugas_pemmob_lanjut1/Pages/fitur_bank_indonesia/mutasi.dart';
import 'package:tugas_pemmob_lanjut1/Pages/fitur_bank_indonesia/penarikan.dart';
import 'package:tugas_pemmob_lanjut1/Pages/fitur_bank_indonesia/peminjaman.dart';
import 'package:tugas_pemmob_lanjut1/Pages/fitur_bank_indonesia/transfer.dart';
import 'package:tugas_pemmob_lanjut1/material/tombolKategori.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';
import 'package:tugas_pemmob_lanjut1/personal/nasabah.dart';

class MobileView extends StatelessWidget {
  final ListUsersModel user;

  MobileView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 10,
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
                      border: Border.all(color: Color(0xFF1C2474)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Image.asset(
                                'Assets/images/logo.png',
                                scale: 8,
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DataNasabah('Nasabah', user.nama.toString()),
                                  SizedBox(height: 5),
                                  DataNasabah(
                                      'Tabungan', user.saldo.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFF1C2474),
                      ),
                    ),
                    child: Wrap(
                      spacing: 30,
                      runSpacing: 30,
                      children: [
                        TombolKategori(
                          Icons.payment,
                          'Cek Saldo',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CekSaldo()),
                            );
                          },
                        ),
                        TombolKategori(
                          Icons.monetization_on_sharp,
                          'Transfer',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Transfer(),
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
                                        user: user,
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
                                  builder: (context) => Penarikan(user: user)),
                            );
                          },
                        ),
                        TombolKategori(
                          Icons.money_outlined,
                          'Peminjaman',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Peminjaman()),
                            );
                          },
                        ),
                        TombolKategori(
                          Icons.comment_bank,
                          'Mutasi',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Mutasi()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
      ),
    );
  }
}
