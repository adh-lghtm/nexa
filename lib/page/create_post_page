import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  // =====================================================
  // COLORS
  // =====================================================

  final Color primaryGreen = const Color(0xFF245C4A);
  final Color lightGreen = const Color(0xFFEAF0E5);
  final Color background = const Color(0xFFF8F9F4);
  final Color textDark = const Color(0xFF26332D);
  final Color secondaryText = const Color(0xFF7B817D);

  // =====================================================
  // CONTROLLER
  // =====================================================

  final TextEditingController postController = TextEditingController();

  // =====================================================
  // AUDIENCE
  // =====================================================

  String selectedAudience = 'Semua orang';

  final List<String> audiences = [
    'Semua orang',
    'Teman',
    'Pengikut',
    'Hanya saya',
  ];

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  // =====================================================
  // BUILD
  // =====================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: SafeArea(
        child: Column(
          children: [
            // ============================================
            // TOP BAR
            // ============================================

            _buildTopBar(),

            // ============================================
            // POST CONTENT
            // ============================================
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [_buildPostEditor()]),
              ),
            ),

            // ============================================
            // REPLY SETTING
            // ============================================
            _buildReplySetting(),

            // ============================================
            // MEDIA TOOLBAR
            // ============================================
            _buildMediaToolbar(),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // TOP BAR
  // =====================================================

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 12),
      child: Row(
        children: [
          // CLOSE BUTTON
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFE5E9E2)),
              ),
              child: Icon(Icons.close_rounded, color: primaryGreen, size: 25),
            ),
          ),

          const SizedBox(width: 14),

          // TITLE
          Expanded(
            child: Text(
              'Buat postingan',
              style: TextStyle(
                color: textDark,
                fontSize: 19,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          // POST BUTTON
          GestureDetector(
            onTap: _createPost,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
              decoration: BoxDecoration(
                color: primaryGreen,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'Post',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // POST EDITOR
  // =====================================================

  Widget _buildPostEditor() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==============================================
          // PROFILE PHOTO
          // ==============================================

          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFDCEBC8),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Center(
              child: Text(
                'IZ',
                style: TextStyle(
                  color: primaryGreen,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),

          const SizedBox(width: 13),

          // ==============================================
          // CONTENT
          // ==============================================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AUDIENCE BUTTON
                _buildAudienceButton(),

                const SizedBox(height: 18),

                // TEXT FIELD
                TextField(
                  controller: postController,
                  maxLines: null,
                  minLines: 8,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(color: textDark, fontSize: 18, height: 1.45),
                  decoration: InputDecoration(
                    hintText: 'Apa yang sedang terjadi?',
                    hintStyle: TextStyle(
                      color: secondaryText.withOpacity(0.75),
                      fontSize: 18,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // AUDIENCE BUTTON
  // =====================================================

  Widget _buildAudienceButton() {
    return GestureDetector(
      onTap: _showAudienceDialog,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: lightGreen,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFD6E2D1)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.public_rounded, color: primaryGreen, size: 17),

            const SizedBox(width: 7),

            Text(
              selectedAudience,
              style: TextStyle(
                color: primaryGreen,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(width: 3),

            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: primaryGreen,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // REPLY SETTING
  // =====================================================

  Widget _buildReplySetting() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: const Color(0xFFE5E9E2)),
          bottom: BorderSide(color: const Color(0xFFE5E9E2)),
        ),
      ),
      child: Row(
        children: [
          // ICON
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              Icons.chat_bubble_outline_rounded,
              color: primaryGreen,
              size: 18,
            ),
          ),

          const SizedBox(width: 11),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Semua orang dapat membalas',
                  style: TextStyle(
                    color: textDark,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Postinganmu dapat dilihat oleh publik',
                  style: TextStyle(color: secondaryText, fontSize: 10),
                ),
              ],
            ),
          ),

          Icon(Icons.chevron_right_rounded, color: secondaryText, size: 21),
        ],
      ),
    );
  }

  // =====================================================
  // MEDIA TOOLBAR
  // =====================================================

  Widget _buildMediaToolbar() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 13, 20, 17),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          _mediaButton(Icons.image_outlined, 'Foto'),

          _mediaButton(Icons.camera_alt_outlined, 'Kamera'),

          _mediaButton(Icons.gif_box_outlined, 'GIF'),

          _mediaButton(Icons.poll_outlined, 'Polling'),

          _mediaButton(Icons.location_on_outlined, 'Lokasi'),

          const Spacer(),

          // CHARACTER COUNTER
          ValueListenableBuilder(
            valueListenable: postController,
            builder: (context, value, child) {
              return Text(
                '${postController.text.length}/280',
                style: TextStyle(
                  color: postController.text.length > 280
                      ? Colors.red
                      : secondaryText,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // =====================================================
  // MEDIA BUTTON
  // =====================================================

  Widget _mediaButton(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        _showComingSoon(label);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: lightGreen,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Icon(icon, color: primaryGreen, size: 20),
      ),
    );
  }

  // =====================================================
  // AUDIENCE DIALOG
  // =====================================================

  void _showAudienceDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // HANDLE
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFD9DDD8),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Siapa yang dapat melihat postingan?',
                style: TextStyle(
                  color: textDark,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 15),

              ...audiences.map((audience) {
                final bool selected = selectedAudience == audience;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedAudience = audience;
                    });

                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 13,
                    ),
                    decoration: BoxDecoration(
                      color: selected ? lightGreen : const Color(0xFFF8F9F4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          _audienceIcon(audience),
                          color: primaryGreen,
                          size: 21,
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            audience,
                            style: TextStyle(
                              color: textDark,
                              fontSize: 14,
                              fontWeight: selected
                                  ? FontWeight.w800
                                  : FontWeight.w600,
                            ),
                          ),
                        ),

                        if (selected)
                          Icon(
                            Icons.check_circle_rounded,
                            color: primaryGreen,
                            size: 20,
                          ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  // =====================================================
  // AUDIENCE ICON
  // =====================================================

  IconData _audienceIcon(String audience) {
    switch (audience) {
      case 'Teman':
        return Icons.people_alt_outlined;

      case 'Pengikut':
        return Icons.person_add_alt_1_outlined;

      case 'Hanya saya':
        return Icons.lock_outline_rounded;

      default:
        return Icons.public_rounded;
    }
  }

  // =====================================================
  // CREATE POST
  // =====================================================

  void _createPost() {
    if (postController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Tulis sesuatu terlebih dahulu.'),
          backgroundColor: primaryGreen,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

      return;
    }

    if (postController.text.length > 280) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Postingan maksimal 280 karakter.')),
      );

      return;
    }

    // SIMULASI POSTING BERHASIL
    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Postingan berhasil dibuat! 🎉'),
        backgroundColor: primaryGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // =====================================================
  // COMING SOON
  // =====================================================

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature akan segera tersedia.'),
        backgroundColor: primaryGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

