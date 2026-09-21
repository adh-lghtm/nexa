import 'package:flutter/material.dart';
import 'package:sosmed/comment_page.dart';
import 'main.dart';

class InteractionPage extends StatelessWidget {
  const InteractionPage({super.key});

  final List<Map<String, String>> daftarNotifikasi = const [
    {
      'nama': 'Belva Dzakwan',
      'jenis': 'retweet',
      'keterangan': 'Reposted your post',
      'waktu': '2d',
      'post': 'Review ini paling jujur soal ending film barunya, gak asal spoiler',
    },
    {
      'nama': 'Inde Navarrette',
      'jenis': 'komentar',
      'reply': 'Commented on your post',
      'keterangan': 'Totally agree, the plot twist was never expected.',
      'waktu': '6d',
      'post': 'This movie has one of the best plot twists ever, still can\'t believe I didn\'t see it coming',
    },
    {
      'nama': 'Florian Wirtz',
      'jenis': 'mention',
      'keterangan': 'Mentioned you in a post',
      'waktu': '1w',
      'post': 'You have to watch this, it\'s easily the best movie of the year',
    },
    {
      'nama': 'Qonita Rahma',
      'jenis': 'like',
      'keterangan': 'Liked your post',
      'waktu': '1w',
      'post': 'Baru nonton the odyssey, worth the wait banget!',
    },
    {
      'nama': 'Jason Susanto',
      'jenis': 'follow',
      'keterangan': 'Followed you',
      'waktu': '1w',
      'post': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter khusus notifikasi yang jenisnya 'mention' aja, buat tab kedua.
    final daftarMentions =
        daftarNotifikasi.where((n) => n['jenis'] == 'mention').toList();

    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        backgroundColor: Color(0xFFF8F9F4),
        appBar: AppBar(
          backgroundColor: Color(0xFFF8F9F4),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NexaApp(),
                ),
              );
            }, 
          ),
          title: const Text('Notifications', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Mentions'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _DaftarNotifikasi(daftar: daftarNotifikasi),
            _DaftarNotifikasi(daftar: daftarMentions),
          ],
        ),
      ),
    );
  }
}

class _DaftarNotifikasi extends StatelessWidget {
  final List<Map<String, String>> daftar;
  const _DaftarNotifikasi({required this.daftar});

  @override
  Widget build(BuildContext context) {
    if (daftar.isEmpty) {
      return const Center(
        child: Text('Belum ada notifikasi', style: TextStyle(color: Colors.grey)),
      );
    }

    return ListView(
      children: [
        for (final n in daftar)
          Column(
            children: [
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ikonJenis(n['jenis']!),
                    const SizedBox(width: 10),
                    _avatarInisial(n['nama']!),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: n['nama'],
                                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                                if (n['reply'] != null)
                                  TextSpan(
                                    text: ' ${n['reply']}',
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                TextSpan(
                                  text: ' • ${n['waktu']}',
                                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(n['keterangan']!,
                              style: const TextStyle(color: Colors.black)),
                          if (n['post'] != null && n['post']!.isNotEmpty) ...[
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                n['post']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.grey, fontSize: 13),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 5),
            const Divider(color: Colors.grey, height: 1),
            ],
          )
      ],
    );
  }

  // Avatar 
  Widget _avatarInisial(String nama) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: Color(0xFF00BF6C),
      child: Text(
        nama[0].toUpperCase(),
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Ikon kecil sesuai jenis notifikasi
  Widget _ikonJenis(String jenis) {
    IconData icon;
    Color warna;
    switch (jenis) {
      case 'like':
        icon = Icons.favorite;
        warna = Colors.pink;
        break;
      case 'komentar':
        icon = Icons.chat_bubble;
        warna = Colors.blue;
        break;
      case 'retweet':
        icon = Icons.repeat;
        warna = Colors.green;
        break;
      case 'mention':
        icon = Icons.alternate_email;
        warna = Colors.blue;
        break;
      case 'follow':
      default:
        icon = Icons.person_add;
        warna = Colors.blue;
    }
    return Icon(icon, color: warna, size: 20);
  }
}
