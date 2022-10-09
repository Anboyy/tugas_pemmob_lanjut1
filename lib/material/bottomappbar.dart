import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_pemmob_lanjut1/material/tombolKategori.dart';
import 'package:tugas_pemmob_lanjut1/provider/bottomnavbarListener.dart';

class BottomAppBarAn extends StatefulWidget {
  BottomAppBarAn({super.key});

  @override
  State<BottomAppBarAn> createState() => BottomAppBarAnState();
}

class BottomAppBarAnState extends State<BottomAppBarAn> with ChangeNotifier {
  // const BottomAppBarAn({Key? key}) : super(key: key);
  late var _TombolActive;
  int get TombolActive => _TombolActive;

  set TombolActive(int value) {
    _TombolActive = value;
    notifyListeners();
  }

  void updateIndex(int value) {
    setState(() {
      _TombolActive = value;
      notifyListeners();
      context.read<BottomBarListener>().IncIndex();
      print(TombolActive);
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
