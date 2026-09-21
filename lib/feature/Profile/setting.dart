import 'package:flutter/material.dart';

//SETTING
class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool notif = true;
  bool privat = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setelan')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Notifikasi'),
            value: notif,
            onChanged: (v) => setState(() => notif = v),
          ),
          SwitchListTile(
            title: const Text('Akun Privat'),
            value: privat,
            onChanged: (v) => setState(() => privat = v),
          ),
          ListTile(
            title: const Text('Keluar', style: TextStyle(color: Colors.red)),
            leading: const Icon(Icons.logout, color: Colors.red),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}