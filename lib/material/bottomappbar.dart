import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_pemmob_lanjut1/Pages/dashboard.dart';
import 'package:tugas_pemmob_lanjut1/Pages/profile.dart';
import 'package:tugas_pemmob_lanjut1/provider/bottomnavbarListener.dart';

class BottomAppBarAn extends StatefulWidget {
  const BottomAppBarAn({super.key});

  @override
  State<BottomAppBarAn> createState() => _BottomAppBarAnState();
}

class _BottomAppBarAnState extends State<BottomAppBarAn> {
  var TombolActive = 0;
  // const BottomAppBarAn({Key? key}) : super(key: key);

  void updateIndex(int value) {
    setState(() {
      TombolActive = value;
      context.read<BottomBarListener>().botIndex(value);
      print(context.read<BottomBarListener>().index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: updateIndex,
      currentIndex: TombolActive,
      backgroundColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue[700],
      selectedFontSize: 13,
      unselectedFontSize: 13,
      iconSize: 30,
      items: [
        BottomNavigationBarItem(
          label: "Setting",
          icon: Icon(Icons.settings),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
