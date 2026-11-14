import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';

// Halaman profil mahasiswa
class ProfilePage extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const ProfilePage({super.key, required this.themeNotifier});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile profile = Profile(
    nama: 'Azkia Alfin Zulfikar',
    nim: '1124160251',
    prodi: 'Teknik Informatika (Malam)',
    kelas: 'TI SE 24 Malam',
    bio: 'Mahasiswa Teknik Informatika peminat Mobile Development Flutter dan Game Modding.',
    email: 'azkiaalfin@gmail.com',
    hp: '0895364418878',
    github: 'github.com/Alfin-NN',
    keahlian: ['Mobile Dev (Flutter & Dart)', 'Modder Game', 'Mobile UI/UX Design'],
    riwayatPendidikan: [
      {'namaSekolah': 'Institut Teknologi & Bisnis Bina Sarana Global', 'jurusan': 'S1 Teknik Informatika', 'tahun': '2024 - Sekarang'},
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Mahasiswa')),
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/images/profile.png')),
            Text(profile.nama, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text(profile.nim),
          ],
        ),
      ),
    );
  }
}
