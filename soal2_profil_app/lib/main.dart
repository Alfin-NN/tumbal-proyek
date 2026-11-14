import 'package:flutter/material.dart';

import 'models/profile.dart';
import 'screens/login_page.dart';
import 'screens/dashboard_page.dart';
import 'screens/profile_page.dart';

// Titik awal aplikasi dijalankan
void main() {
  runApp(const MyApp());
}

// Widget root aplikasi
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Pengatur mode tema terang dan gelap
  final ValueNotifier<ThemeMode> _themeNotifier = ValueNotifier(
    ThemeMode.system,
  );

  // Data profil mahasiswa
  final Profile _defaultProfile = Profile(
    nama: 'Azkia Alfin Zulfikar',
    nim: '1124160251',
    prodi: 'Teknik Informatika (Malam)',
    kelas: 'TI SE 24 Malam',
    bio: 'Mahasiswa Teknik Informatika yang berfokus pada pengembangan aplikasi mobile dengan Flutter, rekayasa perangkat lunak, dan eksplorasi teknologi modern.',
    email: 'azkiaalfin@gmail.com',
    hp: '0895364418878',
    github: 'github.com/Alfin-NN',
    keahlian: [
      'Mobile Dev (Flutter & Dart)',
      'Modder Game',
      'Strategy Gaming & Reverse Engineering',
    ],
    riwayatPendidikan: [
      {
        'namaSekolah': 'Institut Teknologi & Bisnis Bina Sarana Global',
        'jurusan': 'S1 Teknik Informatika',
        'tahun': '2024 - Sekarang',
      },
      {
        'namaSekolah': 'SMK / SMA Sederajat',
        'jurusan': 'Teknik Komputer & Jaringan',
        'tahun': '2021 - 2024',
      },
      {
        'namaSekolah': 'SMP Sederajat',
        'jurusan': 'Pendidikan Menengah Pertama',
        'tahun': '2018 - 2021',
      },
    ],
  );

  @override
  void dispose() {
    _themeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _themeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp(
          title: 'Profil Alfin',
          debugShowCheckedModeBanner: false,

          // Konfigurasi tema terang
          theme: ThemeData(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(
                  seedColor: const Color(0xFF3F51B5),
                  brightness: Brightness.light,
                ).copyWith(
                  secondary: const Color(0xFF00ACC1),
                  surface: const Color(0xFFF8F9FD),
                ),
            scaffoldBackgroundColor: const Color(0xFFF8F9FD),
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              elevation: 0,
              scrolledUnderElevation: 1,
            ),
            cardTheme: CardThemeData(
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),

          // Konfigurasi tema gelap
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme:
                ColorScheme.fromSeed(
                  seedColor: const Color(0xFF5C6BC0),
                  brightness: Brightness.dark,
                ).copyWith(
                  secondary: const Color(0xFF26C6DA),
                  surface: const Color(0xFF161922),
                ),
            scaffoldBackgroundColor: const Color(0xFF10121A),
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              elevation: 0,
              scrolledUnderElevation: 1,
            ),
            cardTheme: CardThemeData(
              color: const Color(0xFF1B1E29),
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),

          themeMode: currentMode,

          // Rute navigasi halaman
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginPage(),
            '/dashboard': (context) => DashboardPage(
              themeNotifier: _themeNotifier,
              profile: _defaultProfile,
            ),
            '/profile': (context) => ProfilePage(themeNotifier: _themeNotifier),
          },
        );
      },
    );
  }
}
