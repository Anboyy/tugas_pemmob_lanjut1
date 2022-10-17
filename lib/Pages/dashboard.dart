import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/Pages/mobileview.dart';
import 'package:tugas_pemmob_lanjut1/Pages/tabletview.dart';
import 'package:tugas_pemmob_lanjut1/material/bottomappbar.dart';
import 'package:tugas_pemmob_lanjut1/material/floatingActionButton.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Koperasi Undiksha'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: LayoutBuilder(builder: ((context, constraints) {
        if (constraints.maxWidth > 480) {
          return TabletView();
        } else {
          return MobileView();
        }
      })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FAButton(),
      bottomNavigationBar: BottomAppBarAn(),
    );
  }
}
