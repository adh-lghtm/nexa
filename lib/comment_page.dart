import 'package:flutter/material.dart';
import 'package:sosmed/interaction_page.dart';
import 'package:sosmed/main.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  final String username = 'Brand New Day';
  final String handle = '@spidermanmovie';
  final String content =
    "Doesn't get bigger than this.\n\n"
    "Thank you to the fans for helping #SpiderManBrandNewDay make "
    "cinematic history – it's now the highest-grossing domestic release "
    "of ALL TIME at the North American box office. Spider-Man: Brand New "
    "Day, exclusively in theatres.";
  final String waktu = '20:24 • Sep 16, 26';
  final int like = 336;
  final int komentar = 6;
  final int retweet = 48;
  final int like2 = 0;
  final int komentar2 = 0;
  final int retweet2 = 0;

  final List<Map<String, String>> daftarKomentar = const [
    {
      'nama': 'Azusa',
      'isi': 'That\'s because it\'s the best #SpiderMan movie ever.',
    },
    {
      'nama': 'Markshowspeed',
      'isi': 'I would really love to see you guys re-release this movie in theaters! I had a great experience watching it twice!',
    },
    {
      'nama': 'SpideyFANS',
      'isi': 'That\'s my favourite character of ALL TIME. You listen to fans and the fans give back',
    },
    {
      'nama': 'Julian Alpares',
      'isi': 'Peter Parker just webbed the all-time North American record. Force Awakens held it for 11 years. Spidey took it in under seven weeks. Ridiculous.',
    },
    {
      'nama': 'Anonymous69',
      'isi': 'Absolute Cinema!!',
    },
    {
      'nama': 'Jurgenholic',
      'isi': 'Congratulations 🎉 y\'all',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text('Post', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          // BAGIAN POSTINGAN 
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: avatar + nama + handle
                Row(
                  children: [
                    _avatarInisial(username),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(username,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(handle,
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Isi postingan
                Text(content, style: const TextStyle(color: Colors.black, fontSize: 16)),
                const SizedBox(height: 12),
                Text(waktu, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 12),
                const Divider(color: Colors.grey),
                // Baris ikon interaksi
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _statIcon(Icons.chat_bubble_outline, komentar),
                    _statIcon(Icons.repeat, retweet),
                    _statIcon(Icons.favorite_border, like),
                    const Icon(Icons.share_outlined, color: Colors.grey),
                  ],
                ),
                const Divider(color: Colors.grey),
              ],
            ),
          ),
          
          // BAGIAN DAFTAR KOMENTAR 
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Balasan',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 12),
          // Looping list komentar dummy
          for (final k in daftarKomentar)
            Column(
              children: [
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _avatarInisial(k['nama']!),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(k['nama']!,
                                style: const TextStyle(
                                    color: Colors.black, fontWeight: FontWeight.bold)),
                            Text(k['isi']!,
                                style: const TextStyle(color: Colors.black)),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _statIcon(Icons.chat_bubble_outline, komentar2),
                                _statIcon(Icons.repeat, retweet2),
                                _statIcon(Icons.favorite_border, like2),
                                const Icon(Icons.share_outlined, color: Colors.grey),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Colors.grey, height: 1),
              ]
            )    
        ],
      ),
      
      // BAGIAN TEXTBOX KOMENTAR
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          top: false,
          child: 
          Row(
            children: [
              _avatarInisial('Kamu'),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'Tulis balasan...',
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(color: Color(0xFF00BF6C), shape: BoxShape.circle),
                          child: const Icon(Icons.send, color: Colors.black, size: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Avatar 
  Widget _avatarInisial(String nama) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: Color(0xFF00BF6C),
      child: Text(
        nama[0].toUpperCase(),
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Ikon interaksi
  Widget _statIcon(IconData icon, int jumlah) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey, size: 18),
        const SizedBox(width: 4),
        Text('$jumlah', style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
