import 'package:flutter/material.dart';

// Halaman login pembuka
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school_rounded, size: 80, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text('Aplikasi Profil Mahasiswa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Masuk ke Dashboard Mahasiswa'),
          ],
        ),
      ),
    );
  }
}
