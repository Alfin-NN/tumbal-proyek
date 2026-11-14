import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';
import 'about_page.dart';

// Halaman utama profil mahasiswa
class ProfilePage extends StatefulWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const ProfilePage({super.key, required this.themeNotifier});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Data profil mahasiswa
  Profile profile = Profile(
    nama: 'Azkia Alfin Zulfikar',
    nim: '1124160251',
    prodi: 'Teknik Informatika (Malam)',
    kelas: 'TI SE 24 Malam',
    bio: 'Mahasiswa Teknik Informatika peminat Mobile Development Flutter dan Game Modding.',
    email: 'azkiaalfin@gmail.com',
    hp: '0895364418878',
    github: 'github.com/Alfin-NN',
    keahlian: [
      'Mobile Dev (Flutter & Dart)',
      'Modder Game',
      'Mobile UI/UX Design',
      'Version Control (Git & GitHub)',
    ],
    riwayatPendidikan: [
      {
        'namaSekolah': 'Institut Teknologi & Bisnis Bina Sarana Global',
        'jurusan': 'S1 Teknik Informatika',
        'tahun': '2024 - Sekarang',
      },
      {
        'namaSekolah': 'SMK Negeri / Swasta',
        'jurusan': 'Teknik Komputer & Jaringan',
        'tahun': '2021 - 2024',
      },
    ],
  );

  // Buka halaman edit profil dan terima data hasil update
  void _bukaHalamanEdit() async {
    final updatedData = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(currentProfile: profile),
      ),
    );

    if (updatedData != null) {
      setState(() {
        profile = updatedData;
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.check_circle_rounded, color: Colors.white),
              SizedBox(width: 12),
              Text('Profil berhasil diperbarui!'),
            ],
          ),
          backgroundColor: Colors.green.shade700,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = widget.themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      // AppBar dengan aksi tema, edit, dan info
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
            tooltip: isDark ? 'Mode Terang' : 'Mode Gelap',
            onPressed: () {
              widget.themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit_rounded),
            tooltip: 'Edit Profil',
            onPressed: _bukaHalamanEdit,
          ),
          IconButton(
            icon: const Icon(Icons.info_outline_rounded),
            tooltip: 'Tentang Saya',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(profile: profile),
                ),
              );
            },
          ),
        ],
      ),

      // Menu samping navigasi
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                profile.nama,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              accountEmail: Text(profile.email),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard_rounded),
              title: const Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_rounded),
              title: const Text('Profil Saya'),
              selected: true,
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info_rounded),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(profile: profile),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
              title: Text(isDark ? 'Mode Terang' : 'Mode Gelap'),
              trailing: Switch(
                value: isDark,
                onChanged: (val) {
                  widget.themeNotifier.value = val ? ThemeMode.dark : ThemeMode.light;
                },
              ),
              onTap: () {
                widget.themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.redAccent),
              title: const Text('Keluar', style: TextStyle(color: Colors.redAccent)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),

      // Tampilan isi profil
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header foto profil
              Center(
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 54,
                        backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _bukaHalamanEdit,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                            border: Border.all(color: theme.scaffoldBackgroundColor, width: 2),
                          ),
                          child: const Icon(
                            Icons.edit_rounded,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              Text(
                profile.nama,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
              const SizedBox(height: 6),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'NIM: ${profile.nim}',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 6),

              Text(
                profile.prodi,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 20),

              // Seksi kartu kontak
              Card(
                elevation: 0,
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      InfoTile(
                        icon: Icons.email_rounded,
                        label: 'Email',
                        value: profile.email,
                      ),
                      const Divider(indent: 56, endIndent: 16, height: 1),
                      InfoTile(
                        icon: Icons.phone_rounded,
                        label: 'Nomor HP',
                        value: profile.hp,
                      ),
                      const Divider(indent: 56, endIndent: 16, height: 1),
                      InfoTile(
                        icon: Icons.class_rounded,
                        label: 'Kelas',
                        value: profile.kelas,
                      ),
                      const Divider(indent: 56, endIndent: 16, height: 1),
                      InfoTile(
                        icon: Icons.code_rounded,
                        label: 'GitHub',
                        value: profile.github,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Seksi kartu keahlian dan hobi
              Card(
                elevation: 0,
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      InfoTile(
                        icon: Icons.psychology_rounded,
                        label: 'Keahlian Utama',
                        value: 'Mobile Dev (Flutter & Dart)',
                      ),
                      Divider(indent: 56, endIndent: 16, height: 1),
                      InfoTile(
                        icon: Icons.code_rounded,
                        label: 'Keahlian Lain',
                        value: 'Modder Game',
                      ),
                      Divider(indent: 56, endIndent: 16, height: 1),
                      InfoTile(
                        icon: Icons.sports_esports_rounded,
                        label: 'Hobi / Minat',
                        value: 'Strategy Gaming & Reverse Engineering',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),

      // Tombol aksi cepat edit profil
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaHalamanEdit,
        icon: const Icon(Icons.edit_rounded),
        label: const Text('Edit Profil'),
      ),
    );
  }
}
