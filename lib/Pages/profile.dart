import 'package:flutter/material.dart';
import 'package:tugas_pemmob_lanjut1/material/bottomappbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ini profile'),
      ),
    );
  }
}
