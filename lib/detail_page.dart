import 'package:flutter/material.dart';

import 'data.dart';
import 'profile_page.dart';

// ===============================================================
// HALAMAN 3: Detail Destinasi (+ pilih jumlah orang & simpan rencana)
// ===============================================================
class DetailPage extends StatefulWidget {
  final Destination destination;
  const DetailPage({super.key, required this.destination});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int people = 2;

  Widget _chip(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: kAccent),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _planBox(Destination d) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.event_available, color: kAccent, size: 20),
              SizedBox(width: 8),
              Text('Rencanakan Kunjungan',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(Icons.people, color: kMuted, size: 20),
              const SizedBox(width: 10),
              const Text('Jumlah orang', style: TextStyle(color: kMuted)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.remove_circle_outline,
                    color: Colors.white),
                onPressed: () {
                  if (people > 1) setState(() => people--);
                },
              ),
              Text('$people',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: kAccent),
                onPressed: () => setState(() => people++),
              ),
            ],
          ),
          const Divider(color: Colors.white12, height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total tiket',
                  style: TextStyle(color: kMuted, fontSize: 15)),
              Text(rupiah(d.priceValue * people),
                  style: const TextStyle(
                      color: kAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),
            ],
          ),
        ],
      ),
    );
  }

  void _savePlan(Destination d) {
    addPlan(d, people);
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    messenger.showSnackBar(
      SnackBar(
        content: Text('Rencana ke ${d.name} tersimpan!'),
        action: SnackBarAction(
          label: 'Lihat',
          onPressed: () => navigator.push(
            MaterialPageRoute(builder: (_) => const PlansPage()),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.destination;
    return Scaffold(
      backgroundColor: kBg,
      body: Stack(
        children: [
          AppImage(path: d.image, height: 340, width: double.infinity),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 290),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: const BoxDecoration(
                    color: kBg,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(d.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w800)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: kAccent, size: 18),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(d.location,
                                style: const TextStyle(color: kMuted)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        children: [
                          _chip(Icons.star, '${d.rating}'),
                          _chip(Icons.confirmation_number,
                              rupiah(d.priceValue)),
                          _chip(Icons.category, d.category),
                        ],
                      ),
                      const SizedBox(height: 14),
                      const Text('Tentang Destinasi',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(d.description,
                          style: const TextStyle(
                              color: kMuted, fontSize: 15, height: 1.6)),
                      const SizedBox(height: 22),
                      _planBox(d),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(color: kMuted),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                              ),
                              onPressed: () => _savePlan(d),
                              icon: const Icon(Icons.check_circle),
                              label: const Text('Simpan Rencana'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}