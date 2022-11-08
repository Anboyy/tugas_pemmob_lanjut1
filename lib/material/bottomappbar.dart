import 'package:flutter/material.dart';

class BottomAppBarAn extends StatefulWidget {
  const BottomAppBarAn({super.key});

  @override
  State<BottomAppBarAn> createState() => _BottomAppBarAnState();
}

class _BottomAppBarAnState extends State<BottomAppBarAn> {
  var TombolActive = 0;

  void updateIndex(int value) {
    setState(() {
      TombolActive = value;
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
