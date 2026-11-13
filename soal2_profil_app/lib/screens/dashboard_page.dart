import 'package:flutter/material.dart';
import '../models/profile.dart';

// Halaman utama dashboard mahasiswa
class DashboardPage extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier;
  final Profile profile;

  const DashboardPage({super.key, required this.themeNotifier, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Utama'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(radius: 28, child: Icon(Icons.person, size: 32)),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(profile.nama, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text('${profile.kelas} • ${profile.nim}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
