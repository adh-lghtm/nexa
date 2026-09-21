import 'package:flutter/material.dart';

const String namaAplikasi = 'Nexa';

void main() {
  runApp(const NexaDmApp());
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

class NexaDmApp extends StatelessWidget {
  const NexaDmApp({super.key});

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
              body: SafeArea(child: DmPage()),
            ),
          ),
        ),
      ),
    );
  }
}

class DmPage extends StatelessWidget {
  const DmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final online = daftarAkun.where((akun) => akun.online).toList();
    final belumDibaca = daftarPesan.where((pesan) => pesan.belumDibaca > 0).length;

    return ListView(
      key: const PageStorageKey<String>('dm'),
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 28),
      children: [
        const _HeaderMerek(),
        const SizedBox(height: 28),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: _JudulHalaman(
                label: 'DIRECT MESSAGE',
                judul: 'Ruang obrolan.',
                deskripsi: 'Tetap dekat, lewat satu pesan.',
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Warna.aksen,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Icon(
                Icons.edit_square,
                color: Warna.teksAksen,
                size: 23,
                semanticLabel: 'Pesan baru',
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        const _KolomPencarian(teks: 'Cari percakapan'),
        const SizedBox(height: 24),
        _JudulBagian(
          judul: 'Sedang aktif',
          keterangan: '${online.length} teman',
        ),
        const SizedBox(height: 14),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: online.map((akun) {
              return SizedBox(
                width: 80,
                child: Column(
                  children: [
                    _Avatar(akun: akun, ukuran: 58, tampilkanOnline: true),
                    const SizedBox(height: 8),
                    Text(
                      akun.nama.split(' ').first,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 26),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _ChipFilter(teks: 'Semua pesan', terpilih: true),
            _ChipFilter(teks: 'Belum dibaca ($belumDibaca)'),
          ],
        ),
        const SizedBox(height: 24),
        _JudulBagian(
          judul: 'Pesan',
          keterangan: '$belumDibaca percakapan baru',
        ),
        const SizedBox(height: 10),
        ...daftarPesan.map((pesan) => _BarisPesan(pesan: pesan)),
      ],
    );
  }
}

class _BarisPesan extends StatelessWidget {
  const _BarisPesan({required this.pesan});
  final Pesan pesan;

  @override
  Widget build(BuildContext context) {
    final baru = pesan.belumDibaca > 0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Warna.garis)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _Avatar(akun: pesan.akun, ukuran: 54, tampilkanOnline: true),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pesan.akun.nama,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: baru ? FontWeight.w800 : FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  pesan.isi,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: baru ? Warna.teks : Warna.abu,
                    fontWeight: baru ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                pesan.waktu,
                style: TextStyle(
                  color: baru ? Warna.aksen : Warna.abu,
                  fontSize: 10,
                  fontWeight: baru ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
              const SizedBox(height: 9),
              if (baru)
                Container(
                  constraints: const BoxConstraints(minWidth: 22, minHeight: 22),
                  padding: const EdgeInsets.all(4),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Warna.aksen,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '${pesan.belumDibaca}',
                    style: const TextStyle(
                      color: Warna.teksAksen,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              else
                const Icon(Icons.done_all_rounded, size: 18, color: Warna.abu),
            ],
          ),
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
  const _KolomPencarian({required this.teks});
  final String teks;

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
    this.tampilkanOnline = false,
  });
  final Akun akun;
  final double ukuran;
  final bool tampilkanOnline;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${akun.nama}${tampilkanOnline && akun.online ? ', online' : ''}',
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
            if (tampilkanOnline && akun.online)
              Positioned(
                right: 0,
                bottom: 1,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Warna.online,
                    shape: BoxShape.circle,
                    border: Border.all(color: Warna.latar, width: 2.5),
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

class Pesan {
  const Pesan({
    required this.akun,
    required this.isi,
    required this.waktu,
    this.belumDibaca = 0,
  });
  final Akun akun;
  final String isi;
  final String waktu;
  final int belumDibaca;
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

final daftarPesan = <Pesan>[
  Pesan(
    akun: daftarAkun[0],
    isi: 'Konsep desainmu bagus! Boleh sharing?',
    waktu: '10.42',
    belumDibaca: 2,
  ),
  Pesan(
    akun: daftarAkun[1],
    isi: 'Besok ngopi sambil nugas, yuk!',
    waktu: '10.30',
    belumDibaca: 1,
  ),
  Pesan(
    akun: daftarAkun[2],
    isi: 'Alya mengirim sebuah foto.',
    waktu: '09.18',
    belumDibaca: 1,
  ),
  Pesan(
    akun: daftarAkun[3],
    isi: 'Kamu: Siap, sampai ketemu nanti.',
    waktu: '08.54',
  ),
  Pesan(
    akun: daftarAkun[4],
    isi: 'Kamu: Terima kasih rekomendasinya!',
    waktu: 'Kemarin',
  ),
  Pesan(
    akun: daftarAkun[5],
    isi: 'Kamu: Oke, aku cek dulu ya.',
    waktu: 'Kemarin',
  ),
];
