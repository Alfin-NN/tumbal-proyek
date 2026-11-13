import 'package:flutter/material.dart';

import '../models/profile.dart';

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
          // Bagian Header
          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(
                      profile.nama.isNotEmpty ? profile.nama[0] : 'A',
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.nama,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                        ),
                        Text(
                          '${profile.prodi} • ${profile.nim}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Judul Seksi 1: Keahlian & Minat
          Row(
            children: [
              Icon(Icons.stars, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                'Keahlian & Minat',
                style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // ListView Keahlian
          Card(
            elevation: 1,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: profile.keahlian.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                  ),
                  title: Text(profile.keahlian[index]),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // Judul 2: Riwayat Pendidikan
          Row(
            children: [
              Icon(Icons.school, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                'Riwayat Pendidikan',
                style: Theme.of(context).textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // ListView Riwayat Pendidikan
          Card(
            elevation: 1,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: profile.riwayatPendidikan.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final edu = profile.riwayatPendidikan[index];
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.account_balance, size: 20),
                  ),
                  title: Text(
                    edu['namaSekolah'] ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text('${edu['jurusan']} • ${edu['tahun']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
