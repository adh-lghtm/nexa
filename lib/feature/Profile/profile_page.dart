import 'package:flutter/material.dart';

import './setting.dart';

//PROFILE
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingPage()),
            ),
          ),
        ],
      ),
      //avatar
      body: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
              _Stat('24', 'Postingan'),
              _Stat('1.2K', 'Pengikut'),
              _Stat('340', 'Mengikuti'),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Rafi\nMahasiswa'),
            ),
          ),
          
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (_, i) =>
                  Image.network('https://picsum.photos/seed/$i/300', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value, label;
  const _Stat(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label),
      ],
    );
  }
}