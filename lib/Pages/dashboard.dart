import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/Pages/mobileview.dart';
import 'package:tugas_pemmob_lanjut1/Pages/tabletview.dart';
import 'package:tugas_pemmob_lanjut1/material/bottomappbar.dart';
import 'package:tugas_pemmob_lanjut1/material/floatingActionButton.dart';
import 'package:tugas_pemmob_lanjut1/material/kMaterial.dart';
import 'package:tugas_pemmob_lanjut1/model/list_users_model.dart';

class Dashboard extends StatefulWidget {
  final ListUsersModel user;

  const Dashboard({Key? key, required this.user}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, _) => Scaffold(
              appBar: AppBar(
                backgroundColor: kWarnaBackgroundApp,
                title: Text('Koperasi Undiksha'),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.logout),
                  ),
                ],
              ),
              body: LayoutBuilder(
                builder: ((context, constraints) {
                  if (constraints.maxWidth > 480) {
                    return TabletView();
                  } else {
                    return MobileView(user: widget.user);
                  }
                }),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FAButton(),
              bottomNavigationBar: BottomAppBarAn(),
            ));
  }
}
