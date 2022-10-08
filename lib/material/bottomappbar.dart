import 'package:flutter/material.dart';

class BottomAppBarAn extends StatefulWidget {
  @override
  State<BottomAppBarAn> createState() => _BottomAppBarAnState();
}

class _BottomAppBarAnState extends State<BottomAppBarAn> {
  // const BottomAppBarAn({Key? key}) : super(key: key);
  var TombolActive = 0;

  // List _screens =[Dashboard(),ProfilePage()];

  void _updateIndex(int value) {
    setState(() {
      TombolActive = value;
    });
  }

  // BottomAppBarAn(this.TombolActive);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _updateIndex,
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
