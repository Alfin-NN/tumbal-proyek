import 'package:flutter/material.dart';
import '../models/profile.dart';

// Halaman tentang saya
class AboutPage extends StatelessWidget {
  final Profile profile;

  const AboutPage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya')),
      body: Center(
        child: Text('Profil: ${profile.nama} (${profile.nim})'),
      ),
    );
  }
}
