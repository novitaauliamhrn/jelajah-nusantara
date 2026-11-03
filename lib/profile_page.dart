import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data.dart';
import 'detail_page.dart';

// ===============================================================
// HALAMAN 4: Rencana Saya
// ===============================================================
class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  Widget _summaryItem(IconData icon, String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: kAccent, size: 22),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: kMuted, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _emptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: kAccent.withAlpha(35),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.event_note, color: kAccent, size: 48),
            ),
            const SizedBox(height: 18),
            const Text('Belum ada rencana',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            const Text(
              'Pilih destinasi lalu tekan "Rencanakan" untuk menyimpannya di sini.',
              textAlign: TextAlign.center,
              style: TextStyle(color: kMuted, height: 1.4),
            ),
            const SizedBox(height: 22),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: kAccent,
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              ),
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.landscape),
              label: const Text('Cari Destinasi'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _planCard(BuildContext context, Plan plan) {
    final d = plan.destination;
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailPage(destination: d)),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            AppImage(path: d.image, width: 90, height: 90, radius: 14),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(d.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 13, color: kAccent),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(d.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: kMuted, fontSize: 12)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.people, size: 15, color: kMuted),
                      const SizedBox(width: 4),
                      Text('${plan.people} orang',
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 12)),
                      const Spacer(),
                      Text(rupiah(plan.total),
                          style: const TextStyle(
                              color: kAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: 'Hapus rencana',
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              onPressed: () {
                final list = List<Plan>.of(savedPlans.value)..remove(plan);
                savedPlans.value = list;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Rencana ${d.name} dihapus')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: darkAppBar(context, 'Rencana Saya'),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kAccent,
        foregroundColor: Colors.black,
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: savedPlans,
        builder: (context, plans, _) {
          if (plans.isEmpty) return _emptyState(context);

          final totalCost = plans.fold<int>(0, (sum, p) => sum + p.total);
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 90),
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      color: kCard,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        _summaryItem(
                            Icons.place, '${plans.length}', 'Destinasi'),
                        _summaryItem(Icons.account_balance_wallet,
                            rupiah(totalCost), 'Estimasi tiket'),
                      ],
                    ),
                  ),
                  ...plans.map((p) => _planCard(context, p)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ===============================================================
// HALAMAN 5: Profil
// ===============================================================
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String name = 'Novita Aulia';
  static const String email = 'auliagj@gmail.com';
  static const String phone = '08726151793746';

  Widget _stat(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  color: kAccent, fontSize: 24, fontWeight: FontWeight.w800)),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: kMuted, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _infoTile(
      BuildContext context, IconData icon, String label, String value) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Clipboard.setData(ClipboardData(text: value));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$label disalin ke clipboard')),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: kCard,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kAccent.withAlpha(35),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: kAccent, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: const TextStyle(color: kMuted, fontSize: 12)),
                  const SizedBox(height: 2),
                  Text(value,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            const Icon(Icons.copy, color: kMuted, size: 18),
          ],
        ),
      ),
    );
  }

  IconData _categoryIcon(String c) {
    switch (c) {
      case 'Budaya':
        return Icons.account_balance;
      case 'Gunung':
        return Icons.terrain;
      case 'Pantai':
        return Icons.beach_access;
      case 'Danau':
        return Icons.water;
      default:
        return Icons.place;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favCategories = categories.where((c) => c != 'Semua').toList();

    return Scaffold(
      backgroundColor: kBg,
      appBar: darkAppBar(context, 'Profil Saya'),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 112,
                          height: 112,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [kAccent, Color(0xFFFF6F00)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            border: Border.all(color: kCard, width: 4),
                          ),
                          child: const Center(
                            child: Text('N',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 52,
                                    fontWeight: FontWeight.w800)),
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Text(name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.w800)),
                        const SizedBox(height: 4),
                        const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.travel_explore,
                                color: kAccent, size: 16),
                            SizedBox(width: 6),
                            Text('Traveler Jelajah Nusantara',
                                style: TextStyle(color: kMuted)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: kCard,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        _stat('${destinations.length}', 'Destinasi'),
                        Container(width: 1, height: 36, color: kMuted),
                        _stat('${categories.length - 1}', 'Kategori'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text('Informasi Kontak',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('Ketuk untuk menyalin',
                      style: TextStyle(color: kMuted, fontSize: 12)),
                  const SizedBox(height: 12),
                  _infoTile(context, Icons.person, 'Nama Lengkap', name),
                  _infoTile(context, Icons.email, 'Email', email),
                  _infoTile(context, Icons.phone, 'No. Telepon', phone),
                  const SizedBox(height: 14),
                  const Text('Minat Wisata',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: favCategories.map((c) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 9),
                        decoration: BoxDecoration(
                          color: kCard,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: kAccent.withAlpha(120)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(_categoryIcon(c), size: 16, color: kAccent),
                            const SizedBox(width: 6),
                            Text(c,
                                style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: kMuted),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Kembali'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kAccent,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const PlansPage()),
                          ),
                          icon: const Icon(Icons.event_available),
                          label: const Text('Rencana Saya'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}