import 'package:flutter/material.dart';

import 'page/create_post_page.dart';
<<<<<<< HEAD
import 'feature/Profile/profile_page.dart';
=======
import 'comment_page.dart';
import 'interaction_page.dart';
>>>>>>> 9b1ee654b2f054ef2fec011e063ab2e732436d81

void main() {
  runApp(const NexaApp());
}

class NexaApp extends StatelessWidget {
  const NexaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nexa',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF8F9F4),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF245C4A)),
      ),
      home: const HomePage(),
    );
  }
}

// =====================================================
// HOME PAGE
// =====================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final Color primaryGreen = const Color(0xFF245C4A);
  final Color lightGreen = const Color(0xFFEAF0E5);
  final Color background = const Color(0xFFF8F9F4);
  final Color textDark = const Color(0xFF26332D);
  final Color secondaryText = const Color(0xFF7B817D);

  final List<Map<String, dynamic>> stories = [
    {
      'name': 'Anda',
      'initial': '+',
      'color': const Color(0xFFE8EDE3),
      'isAdd': true,
    },
    {'name': 'Naya', 'initial': 'NP', 'color': const Color(0xFFE9DDF3)},
    {'name': 'Raka', 'initial': 'RP', 'color': const Color(0xFFF4E1B8)},
    {'name': 'Alya', 'initial': 'AS', 'color': const Color(0xFFDCECEE)},
    {'name': 'Dimas', 'initial': 'DA', 'color': const Color(0xFFE2EBCF)},
  ];

  final List<Map<String, dynamic>> posts = [
    {
      'name': 'Naya Putri',
      'username': '@nayaputri',
      'initial': 'NP',
      'avatarColor': const Color(0xFFE9DDF3),
      'likes': '24',
      'comments': '8',
      'text': 'Hari ini belajar banyak hal baru. Ternyata proses kecil juga bisa menghasilkan sesuatu yang besar 🌱',
      'postColor': const Color(0xFFE8EFE7),
    },
    {
      'name': 'Raka Pratama',
      'username': '@rakapratama',
      'initial': 'RP',
      'avatarColor': const Color(0xFFF4E1B8),
      'likes': '36',
      'comments': '12',
      'text': 'Sore yang tenang sambil menyelesaikan beberapa tugas. Semangat untuk semuanya! ☕',
      'postColor': const Color(0xFFECE9DF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      // =========================
      // BODY
      // =========================
      body: currentIndex == 0
      ? SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: _buildHeader()),

                  SliverToBoxAdapter(child: _buildSearchBar()),

                  SliverToBoxAdapter(child: _buildStories()),

                  SliverToBoxAdapter(child: _buildSectionTitle()),

                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return _buildPost(posts[index]);
                    }, childCount: posts.length),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
                ],
              ),
            ),

            // =========================
            // BOTTOM NAVIGATION
            // =========================
            _buildBottomNavigation(),
          ],
        ),
      ) : const InteractionPage(),
    );
  }

  // ===================================================
  // HEADER
  // ===================================================

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 14),
      child: Row(
        children: [
          // Logo
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.chat_bubble_rounded,
              color: Color(0xFFE5F2C4),
              size: 24,
            ),
          ),

          const SizedBox(width: 12),

          // Nexa
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nexa',
                  style: TextStyle(
                    color: primaryGreen,
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Tetap dekat, tetap terhubung.',
                  style: TextStyle(color: secondaryText, fontSize: 12),
                ),
              ],
            ),
          ),

          // Notification
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE7EAE4)),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.notifications_none_rounded,
                    color: primaryGreen,
                    size: 23,
                  ),
                ),

                Positioned(
                  top: 9,
                  right: 9,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: const Color(0xFF76A66C),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Profile 
        ElevatedButton(
          onPressed: () {
            // Kode navigasi saat tombol ditekan
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()), // Pastikan ProfileScreen sudah di-import
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFDCEBC8), // Mengatur warna background
            fixedSize: const Size(42, 42), // Mengatur ukuran kotak (lebar, tinggi)
            padding: EdgeInsets.zero, // Menghilangkan jarak bawaan tombol
            elevation: 0, // Dibuat 0 agar tidak ada bayangan (seperti Container biasa)
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14), // Mengatur sudut melengkung
            ),
          ),
          child: Text(
            'IZ',
            style: TextStyle(
              color: primaryGreen, // Pastikan variabel primaryGreen sudah ada
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ],
    ),
  );
}

  // ===================================================
  // SEARCH
  // ===================================================

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFFF0F3EC),
          borderRadius: BorderRadius.circular(17),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),

            Icon(Icons.search_rounded, color: primaryGreen, size: 23),

            const SizedBox(width: 12),

            Text(
              'Cari di Nexa...',
              style: TextStyle(color: secondaryText, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  // ===================================================
  // STORIES
  // ===================================================

  Widget _buildStories() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cerita',
            style: TextStyle(
              color: textDark,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),

          const SizedBox(height: 14),

          SizedBox(
            height: 96,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                final story = stories[index];

                return Container(
                  width: 68,
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 58,
                            height: 58,
                            decoration: BoxDecoration(
                              color: story['color'],
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                story['initial'],
                                style: TextStyle(
                                  color: primaryGreen,
                                  fontSize: story['isAdd'] == true ? 25 : 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),

                          if (story['isAdd'] == true)
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 19,
                                height: 19,
                                decoration: BoxDecoration(
                                  color: primaryGreen,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: background,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  size: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Text(
                        story['name'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textDark,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ===================================================
  // SECTION TITLE
  // ===================================================

  Widget _buildSectionTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 12),
      child: Row(
        children: [
          Text(
            'Beranda',
            style: TextStyle(
              color: textDark,
              fontSize: 19,
              fontWeight: FontWeight.w800,
            ),
          ),

          const Spacer(),

          Text(
            'Terbaru',
            style: TextStyle(
              color: primaryGreen,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(width: 4),

          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: primaryGreen,
            size: 18,
          ),
        ],
      ),
    );
  }

  // ===================================================
  // POST
  // ===================================================

  Widget _buildPost(Map<String, dynamic> post) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 6, 20, 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE8EBE5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // =========================
          // POST HEADER
          // =========================

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 12, 12),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: post['avatarColor'],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      post['initial'],
                      style: TextStyle(
                        color: primaryGreen,
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 11),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['name'],
                        style: TextStyle(
                          color: textDark,
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        post['username'],
                        style: TextStyle(color: secondaryText, fontSize: 11),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_horiz_rounded, color: secondaryText),
                ),
              ],
            ),
          ),

          // =========================
          // POST IMAGE PLACEHOLDER
          // =========================
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: 210,
            decoration: BoxDecoration(
              color: post['postColor'],
              borderRadius: BorderRadius.circular(17),
            ),
            child: Center(
              child: Icon(
                Icons.image_outlined,
                color: primaryGreen.withOpacity(0.25),
                size: 50,
              ),
            ),
          ),

          // =========================
          // ACTION BUTTON
          // =========================
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Row(
              children: [
                _actionButton(Icons.favorite_border_rounded, post['likes']),

                const SizedBox(width: 18),

                IconButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommentPage(),
                    ),
                  );
                  },
                  icon: Icon(Icons.chat_bubble_outline_rounded, color: secondaryText),
                ),

                const SizedBox(width: 18),

                _actionButton(Icons.send_outlined, ''),

                const Spacer(),

                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.bookmark_border_rounded,
                    color: primaryGreen,
                  ),
                ),
              ],
            ),
          ),

          // =========================
          // DESCRIPTION
          // =========================
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 2, 16, 18),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: textDark, fontSize: 13, height: 1.4),
                children: [
                  TextSpan(
                    text: '${post['name']} ',
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(text: post['text']),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===================================================
  // ACTION BUTTON
  // ===================================================

  Widget _actionButton(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon, size: 21, color: primaryGreen),

        if (count.isNotEmpty) ...[
          const SizedBox(width: 5),

          Text(
            count,
            style: TextStyle(
              color: secondaryText,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }

  // ===================================================
  // BOTTOM NAVIGATION
  // ===================================================

  Widget _buildBottomNavigation() {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: const Color(0xFFE7EAE4))),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(icon: Icons.home_rounded, label: 'Beranda', index: 0),

            _navItem(icon: Icons.search_rounded, label: 'Cari', index: 1),

            // ADD BUTTON
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreatePostPage(),
                  ),
                );
              },
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: primaryGreen,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    BoxShadow(
                      color: primaryGreen.withOpacity(0.20),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),

            _navItem(
            icon: Icons.favorite_border_rounded,
            label: 'Aktivitas',
            index: 2,
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: SizedBox(
                width: 62,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person_outline_rounded,
                      size: 23,
                      color: currentIndex == 3 ? primaryGreen : secondaryText,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Profil',
                      style: TextStyle(
                        color: currentIndex == 3 ? primaryGreen : secondaryText,
                        fontSize: 9,
                        fontWeight: currentIndex == 3 ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===================================================
  // NAV ITEM
  // ===================================================

  Widget _navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool active = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: SizedBox(
        width: 62,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 23, color: active ? primaryGreen : secondaryText),

            const SizedBox(height: 3),

            Text(
              label,
              style: TextStyle(
                color: active ? primaryGreen : secondaryText,
                fontSize: 9,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
