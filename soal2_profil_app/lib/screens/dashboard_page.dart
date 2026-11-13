import 'package:flutter/material.dart';
import '../models/profile.dart';

// Halaman utama dashboard
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
      body: const Center(
        child: Text('Selamat Datang di Portal Mahasiswa'),
      ),
    );
  }
}
