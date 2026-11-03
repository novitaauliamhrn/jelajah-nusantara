import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ===============================================================
// DATA: model destinasi, daftar destinasi, dan rencana
// ===============================================================
class Destination {
  final String name;
  final String location;
  final String category;
  final String image; // path asset
  final String description;
  final int priceValue; // 0 = gratis
  final double rating;

  const Destination({
    required this.name,
    required this.location,
    required this.category,
    required this.image,
    required this.description,
    required this.priceValue,
    required this.rating,
  });
}

const List<String> categories = [
  'Semua',
  'Budaya',
  'Gunung',
  'Pantai',
  'Danau',
];

const List<Destination> destinations = [
  Destination(
    name: 'Candi Borobudur',
    location: 'Magelang, Jawa Tengah',
    category: 'Budaya',
    image: 'assets/images/borobudur.jpg',
    description:
        'Candi Buddha terbesar di dunia yang dibangun pada abad ke-9. '
        'Nikmati matahari terbit dari pelataran candi dan jelajahi relief '
        'yang menceritakan ajaran Buddha.',
    priceValue: 50000,
    rating: 4.8,
  ),
  Destination(
    name: 'Gunung Bromo',
    location: 'Probolinggo, Jawa Timur',
    category: 'Gunung',
    image: 'assets/images/bromo.jpg',
    description:
        'Gunung berapi aktif dengan lautan pasir dan pemandangan sunrise '
        'dari Penanjakan yang terkenal di seluruh dunia.',
    priceValue: 35000,
    rating: 4.9,
  ),
  Destination(
    name: 'Raja Ampat',
    location: 'Papua Barat Daya',
    category: 'Pantai',
    image: 'assets/images/rajaampat.jpg',
    description:
        'Surga bawah laut dengan ratusan pulau karst, terumbu karang, '
        'dan keanekaragaman hayati laut terkaya di dunia.',
    priceValue: 500000,
    rating: 4.9,
  ),
  Destination(
    name: 'Pantai Kuta',
    location: 'Badung, Bali',
    category: 'Pantai',
    image: 'assets/images/kuta.jpg',
    description:
        'Pantai berpasir putih yang populer untuk berselancar dan '
        'menikmati matahari terbenam yang indah.',
    priceValue: 0,
    rating: 4.5,
  ),
  Destination(
    name: 'Danau Toba',
    location: 'Sumatera Utara',
    category: 'Danau',
    image: 'assets/images/toba.jpg',
    description:
        'Danau vulkanik terbesar di Asia Tenggara dengan Pulau Samosir '
        'di tengahnya dan budaya Batak yang kental.',
    priceValue: 20000,
    rating: 4.7,
  ),
  Destination(
    name: 'Candi Prambanan',
    location: 'Sleman, DI Yogyakarta',
    category: 'Budaya',
    image: 'assets/images/prambanan.jpg',
    description:
        'Kompleks candi Hindu terbesar di Indonesia dengan menara-menara '
        'menjulang. Pertunjukan Sendratari Ramayana digelar di sini pada '
        'malam tertentu.',
    priceValue: 50000,
    rating: 4.7,
  ),
  Destination(
    name: 'Keraton Yogyakarta',
    location: 'Kota Yogyakarta, DIY',
    category: 'Budaya',
    image: 'assets/images/keraton.jpg',
    description:
        'Istana Kesultanan Yogyakarta yang masih berfungsi. Pengunjung '
        'dapat melihat arsitektur Jawa, koleksi pusaka, dan pertunjukan '
        'seni tradisional.',
    priceValue: 15000,
    rating: 4.6,
  ),
  Destination(
    name: 'Tana Toraja',
    location: 'Sulawesi Selatan',
    category: 'Budaya',
    image: 'assets/images/toraja.jpg',
    description:
        'Negeri dengan rumah adat Tongkonan, upacara adat Rambu Solo, '
        'dan lanskap pegunungan hijau yang memukau.',
    priceValue: 30000,
    rating: 4.6,
  ),
  Destination(
    name: 'Tegalalang Ubud',
    location: 'Gianyar, Bali',
    category: 'Budaya',
    image: 'assets/images/ubud.jpg',
    description:
        'Sawah terasering ikonik dengan sistem irigasi subak. Cocok untuk '
        'berfoto, berjalan santai, dan menikmati suasana pedesaan Bali.',
    priceValue: 15000,
    rating: 4.7,
  ),
  Destination(
    name: 'Kawah Ijen',
    location: 'Banyuwangi, Jawa Timur',
    category: 'Gunung',
    image: 'assets/images/ijen.jpg',
    description:
        'Kawah dengan danau asam berwarna tosca dan fenomena api biru '
        '(blue fire) yang hanya ada di beberapa tempat di dunia.',
    priceValue: 15000,
    rating: 4.8,
  ),
  Destination(
    name: 'Gunung Rinjani',
    location: 'Lombok, NTB',
    category: 'Gunung',
    image: 'assets/images/rinjani.jpg',
    description:
        'Gunung berapi tertinggi kedua di Indonesia dengan Danau Segara '
        'Anak di kalderanya. Favorit para pendaki.',
    priceValue: 25000,
    rating: 4.9,
  ),
  Destination(
    name: 'Pulau Komodo',
    location: 'Labuan Bajo, NTT',
    category: 'Pantai',
    image: 'assets/images/komodo.jpg',
    description:
        'Rumah bagi komodo, kadal terbesar di dunia, dengan pantai pink '
        'dan spot snorkeling yang indah di sekitarnya.',
    priceValue: 150000,
    rating: 4.8,
  ),
  Destination(
    name: 'Gili Trawangan',
    location: 'Lombok Utara, NTB',
    category: 'Pantai',
    image: 'assets/images/gili.jpg',
    description:
        'Pulau kecil tanpa kendaraan bermotor dengan pantai jernih, '
        'berenang bersama penyu, dan sunset yang menawan.',
    priceValue: 0,
    rating: 4.7,
  ),
  Destination(
    name: 'Pantai Belitung',
    location: 'Belitung, Bangka Belitung',
    category: 'Pantai',
    image: 'assets/images/belitung.jpg',
    description:
        'Pantai dengan batu-batu granit raksasa dan air laut jernih. '
        'Cocok untuk island hopping dan berfoto.',
    priceValue: 10000,
    rating: 4.7,
  ),
  Destination(
    name: 'Danau Kelimutu',
    location: 'Ende, Nusa Tenggara Timur',
    category: 'Danau',
    image: 'assets/images/kelimutu.jpg',
    description:
        'Tiga danau kawah di puncak gunung yang warna airnya bisa '
        'berubah-ubah: tosca, biru, hingga merah.',
    priceValue: 10000,
    rating: 4.6,
  ),
];

/// Satu rencana kunjungan yang disimpan pengguna.
class Plan {
  final Destination destination;
  final int people;

  const Plan({required this.destination, required this.people});

  int get total => destination.priceValue * people;
}

/// Daftar rencana (disimpan di memori selama aplikasi berjalan).
final ValueNotifier<List<Plan>> savedPlans = ValueNotifier<List<Plan>>([]);

/// Tambah rencana; jika destinasi sama sudah ada, jumlah orangnya diperbarui.
void addPlan(Destination destination, int people) {
  final list = List<Plan>.of(savedPlans.value)
    ..removeWhere((p) => p.destination.name == destination.name)
    ..add(Plan(destination: destination, people: people));
  savedPlans.value = list;
}

// ===============================================================
// KOMPONEN BERSAMA: warna, format rupiah, gambar, app bar
// ===============================================================
// ---------------- Warna tema gelap ----------------
const Color kBg = Color(0xFF0E1014);
const Color kCard = Color(0xFF1A1D24);
const Color kAccent = Color(0xFFFFB300);
const Color kMuted = Color(0xFF9AA0AB);

String rupiah(int v) {
  if (v == 0) return 'Gratis';
  final s = v.toString();
  final buf = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return 'Rp $buf';
}

/// Gambar dari asset dengan ukuran + BoxFit.cover.
/// Jika file belum ada, tampil placeholder gradasi (aplikasi tidak error).
class AppImage extends StatelessWidget {
  final String path;
  final double? width;
  final double height;
  final double radius;

  const AppImage({
    super.key,
    required this.path,
    required this.height,
    this.width,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        path,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stack) => Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2B3A55), Color(0xFF111620)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(Icons.landscape, color: kMuted, size: 42),
        ),
      ),
    );
  }
}

Widget ratingChip(double rating) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, size: 16, color: kAccent),
        const SizedBox(width: 4),
        Text('$rating',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

PreferredSizeWidget darkAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: kBg,
    foregroundColor: Colors.white,
    elevation: 0,
    title: Text(title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    ),
  );
}