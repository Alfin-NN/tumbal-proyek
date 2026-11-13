import 'package:flutter/material.dart';
import '../models/profile.dart';

// Halaman tentang saya dengan riwayat pendidikan
class AboutPage extends StatelessWidget {
  final Profile profile;

  const AboutPage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(profile.nama, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          const Text('Keahlian & Minat:', style: TextStyle(fontWeight: FontWeight.bold)),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: profile.keahlian.length,
            itemBuilder: (c, i) => ListTile(
              leading: const Icon(Icons.check_circle_outline, color: Colors.green),
              title: Text(profile.keahlian[i]),
            ),
          ),
          const SizedBox(height: 16),
          const Text('Riwayat Pendidikan:', style: TextStyle(fontWeight: FontWeight.bold)),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: profile.riwayatPendidikan.length,
            itemBuilder: (c, i) => ListTile(
              leading: const Icon(Icons.school, color: Colors.blue),
              title: Text(profile.riwayatPendidikan[i]['namaSekolah'] ?? ''),
              subtitle: Text(profile.riwayatPendidikan[i]['jurusan'] ?? ''),
            ),
          ),
        ],
      ),
    );
  }
}
