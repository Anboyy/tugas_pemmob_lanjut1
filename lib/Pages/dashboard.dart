import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/material/tombolKategori.dart';
import 'package:tugas_pemmob_lanjut1/personal/nasabah.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Koperasi Undiksha'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
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
                          children: [
                            Container(
                              child: Image.asset(
                                'Assets/images/logo.png',
                                scale: 10,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DataNasabah(
                                    'Nasabah', 'I Kadek Yawan Divta Pramana'),
                                SizedBox(height: 5),
                                DataNasabah('Tabungan', '12.000.000'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
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
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TombolKategori(Icons.payment, 'payment'),
                              TombolKategori(
                                  Icons.monetization_on_sharp, 'Transfer'),
                              TombolKategori(
                                  Icons.payments_outlined, 'Deposito')
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TombolKategori(Icons.payment, 'payment'),
                              TombolKategori(
                                  Icons.monetization_on_sharp, 'Transfer'),
                              TombolKategori(
                                  Icons.payments_outlined, 'Deposito')
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
