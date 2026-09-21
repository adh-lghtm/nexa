import 'package:flutter/material.dart';

const String namaAplikasi = 'Nexa';

void main() {
  runApp(const NexaSearchApp());
}

class Warna {
  static const latar = Color(0xFF171D2B);
  static const latarLuar = Color(0xFF111724);
  static const permukaan = Color(0xFF202839);
  static const aksen = Color(0xFFABA4FF);
  static const aksenLembut = Color(0xFF34344F);
  static const teksAksen = Color(0xFF171D2B);
  static const teks = Color(0xFFF1F3FA);
  static const abu = Color(0xFFAAB4C7);
  static const garis = Color(0xFF354056);
  static const kolom = Color(0xFF242F42);
  static const unggulan = Color(0xFF2E3655);
  static const online = Color(0xFF75D3BE);
  static const ungu = Color(0xFF3B3454);
  static const emas = Color(0xFF443D36);
  static const hijau = Color(0xFF294342);
  static const biru = Color(0xFF2D3D57);
  static const merah = Color(0xFF493744);
  static const indigo = Color(0xFF353B5B);
}

class NexaSearchApp extends StatelessWidget {
  const NexaSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: namaAplikasi,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Warna.aksen,
          brightness: Brightness.dark,
        ).copyWith(
          primary: Warna.aksen,
          onPrimary: Warna.teksAksen,
          secondary: Warna.online,
          onSecondary: Warna.teksAksen,
          surface: Warna.permukaan,
          onSurface: Warna.teks,
          outline: Warna.garis,
        ),
        scaffoldBackgroundColor: Warna.latar,
        dividerColor: Warna.garis,
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Warna.teks,
          displayColor: Warna.teks,
        ),
      ),
      home: ColoredBox(
        color: Warna.latarLuar,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: const Scaffold(
              body: SafeArea(child: SearchPage()),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey<String>('search'),
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 28),
      children: [
        const _HeaderMerek(),
        const SizedBox(height: 28),
        const _JudulHalaman(
          label: 'RUANG EKSPLORASI',
          judul: 'Temukan ceritamu.',
          deskripsi: 'Orang baru, ide baru, dan hal yang kamu suka.',
        ),
        const SizedBox(height: 22),
        const _KolomPencarian(
          teks: 'Cari teman, topik, atau cerita',
          filter: true,
        ),
        const SizedBox(height: 14),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _ChipFilter(teks: 'Semua', terpilih: true),
            _ChipFilter(teks: 'Akun'),
            _ChipFilter(teks: 'Topik'),
            _ChipFilter(teks: 'Postingan'),
          ],
        ),
        const SizedBox(height: 28),
        const _JudulBagian(judul: 'Lagi ramai', keterangan: 'Hari ini'),
        const SizedBox(height: 12),
        const _TopikUnggulan(),
        const SizedBox(height: 12),
        const Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _ChipFilter(teks: '#KehidupanKampus'),
            _ChipFilter(teks: '#UIUXDesign'),
            _ChipFilter(teks: '#TemanNgopi'),
          ],
        ),
        const SizedBox(height: 28),
        const _JudulBagian(judul: 'Kenalan, yuk', keterangan: 'Untuk kamu'),
        const SizedBox(height: 10),
        ...daftarAkun.take(3).map((akun) => _BarisAkun(akun: akun)),
        const SizedBox(height: 22),
        const _JudulBagian(judul: 'Jelajahi minatmu'),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            final lebar = (constraints.maxWidth - 12) / 2;
            return Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _KartuMinat(
                  lebar: lebar,
                  judul: 'Seni & desain',
                  jumlah: '2,4 rb cerita',
                  ikon: Icons.palette_outlined,
                  warna: Warna.ungu,
                ),
                _KartuMinat(
                  lebar: lebar,
                  judul: 'Musik',
                  jumlah: '1,8 rb cerita',
                  ikon: Icons.headphones_rounded,
                  warna: Warna.emas,
                ),
                _KartuMinat(
                  lebar: lebar,
                  judul: 'Jalan-jalan',
                  jumlah: '3,1 rb cerita',
                  ikon: Icons.landscape_outlined,
                  warna: Warna.hijau,
                ),
                _KartuMinat(
                  lebar: lebar,
                  judul: 'Fotografi',
                  jumlah: '980 cerita',
                  ikon: Icons.camera_alt_outlined,
                  warna: Warna.biru,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _TopikUnggulan extends StatelessWidget {
  const _TopikUnggulan();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Warna.unggulan,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TOPIK PILIHAN',
                  style: TextStyle(
                    color: Warna.aksen,
                    fontSize: 10,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '#CeritaNexa',
                  style: TextStyle(
                    color: Warna.teks,
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Satu tempat, banyak cerita.\n1,2 rb orang ikut berbagi',
                  style: TextStyle(
                    color: Warna.abu,
                    fontSize: 12,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 54,
            height: 66,
            decoration: BoxDecoration(
              color: Warna.aksen,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(
              Icons.waving_hand_outlined,
              size: 31,
              color: Warna.teksAksen,
            ),
          ),
        ],
      ),
    );
  }
}

class _BarisAkun extends StatelessWidget {
  const _BarisAkun({required this.akun});
  final Akun akun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          _Avatar(akun: akun),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  akun.nama,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                Text(
                  akun.username,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Warna.abu, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
            decoration: BoxDecoration(
              color: Warna.kolom,
              border: Border.all(color: Warna.garis),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Ikuti',
              style: TextStyle(
                color: Warna.aksen,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _KartuMinat extends StatelessWidget {
  const _KartuMinat({
    required this.lebar,
    required this.judul,
    required this.jumlah,
    required this.ikon,
    required this.warna,
  });
  final double lebar;
  final String judul;
  final String jumlah;
  final IconData ikon;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: lebar,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(ikon, color: Warna.aksen, size: 29),
          const SizedBox(height: 20),
          Text(
            judul,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(jumlah, style: const TextStyle(color: Warna.abu, fontSize: 11)),
        ],
      ),
    );
  }
}

class _HeaderMerek extends StatelessWidget {
  const _HeaderMerek();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: Warna.aksenLembut,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.forum_rounded,
            size: 21,
            color: Warna.aksen,
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Text(
            namaAplikasi,
            style: TextStyle(
              color: Warna.aksen,
              fontSize: 26,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ),
        ),
        const _Avatar(akun: akunSaya, ukuran: 40),
      ],
    );
  }
}

class _JudulHalaman extends StatelessWidget {
  const _JudulHalaman({
    required this.label,
    required this.judul,
    required this.deskripsi,
  });
  final String label;
  final String judul;
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Warna.aksen,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.6,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          judul,
          style: const TextStyle(
            fontSize: 29,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.1,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          deskripsi,
          style: const TextStyle(color: Warna.abu, fontSize: 12, height: 1.6),
        ),
      ],
    );
  }
}

class _KolomPencarian extends StatelessWidget {
  const _KolomPencarian({required this.teks, this.filter = false});
  final String teks;
  final bool filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Warna.kolom,
        border: Border.all(color: Warna.garis),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: Warna.aksen, size: 23),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              teks,
              style: const TextStyle(color: Warna.abu, fontSize: 12),
            ),
          ),
          if (filter) ...[
            const SizedBox(width: 10),
            const Icon(Icons.tune_rounded, color: Warna.aksen, size: 20),
          ],
        ],
      ),
    );
  }
}

class _ChipFilter extends StatelessWidget {
  const _ChipFilter({required this.teks, this.terpilih = false});
  final String teks;
  final bool terpilih;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: terpilih ? Warna.aksen : Warna.permukaan,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: terpilih ? Warna.aksen : Warna.garis),
      ),
      child: Text(
        teks,
        style: TextStyle(
          color: terpilih ? Warna.teksAksen : Warna.abu,
          fontSize: 11,
          fontWeight: terpilih ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
    );
  }
}

class _JudulBagian extends StatelessWidget {
  const _JudulBagian({required this.judul, this.keterangan});
  final String judul;
  final String? keterangan;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            judul,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
          ),
        ),
        if (keterangan != null) ...[
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              keterangan!,
              textAlign: TextAlign.end,
              style: const TextStyle(color: Warna.abu, fontSize: 11),
            ),
          ),
        ],
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.akun,
    this.ukuran = 48,
  });
  final Akun akun;
  final double ukuran;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: akun.nama,
      child: SizedBox(
        width: ukuran,
        height: ukuran,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: akun.warna,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  akun.inisial,
                  style: TextStyle(
                    color: Warna.teks,
                    fontSize: ukuran * 0.29,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Akun {
  const Akun({
    required this.nama,
    required this.username,
    required this.inisial,
    required this.warna,
    this.online = false,
  });
  final String nama;
  final String username;
  final String inisial;
  final Color warna;
  final bool online;
}

const akunSaya = Akun(
  nama: 'Iza',
  username: '@iza',
  inisial: 'IZ',
  warna: Warna.indigo,
);

const daftarAkun = <Akun>[
  Akun(
    nama: 'Naya Putri',
    username: '@nayaputri · Design enthusiast',
    inisial: 'NP',
    warna: Warna.ungu,
    online: true,
  ),
  Akun(
    nama: 'Raka Pratama',
    username: '@rakaprt · Coffee & stories',
    inisial: 'RP',
    warna: Warna.emas,
    online: true,
  ),
  Akun(
    nama: 'Alya Safira',
    username: '@alyasfr · Capture the moment',
    inisial: 'AS',
    warna: Warna.biru,
    online: true,
  ),
  Akun(
    nama: 'Dimas Aditya',
    username: '@dimasaditya',
    inisial: 'DA',
    warna: Warna.hijau,
    online: true,
  ),
  Akun(
    nama: 'Salsa Kirana',
    username: '@salsakirana',
    inisial: 'SK',
    warna: Warna.merah,
    online: true,
  ),
  Akun(
    nama: 'Fajar Ramadhan',
    username: '@fajarr',
    inisial: 'FR',
    warna: Warna.indigo,
  ),
];
