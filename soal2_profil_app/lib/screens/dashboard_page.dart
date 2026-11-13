import 'package:flutter/material.dart';
import '../models/profile.dart';
import 'profile_page.dart';

// Halaman utama dashboard aplikasi
class DashboardPage extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier;
  final Profile profile;

  const DashboardPage({
    super.key,
    required this.themeNotifier,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = themeNotifier.value == ThemeMode.dark;

    return Scaffold(
      // AppBar dan toggle tema
      appBar: AppBar(
        title: const Text('Dashboard Utama'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
            tooltip: isDark ? 'Ganti ke Mode Terang' : 'Ganti ke Mode Gelap',
            onPressed: () {
              themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
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
              selected: true,
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.person_rounded),
              title: const Text('Profil Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(themeNotifier: themeNotifier),
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
                  themeNotifier.value = val ? ThemeMode.dark : ThemeMode.light;
                },
              ),
              onTap: () {
                themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
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

      // Konten utama dashboard
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ikon sambutan dashboard
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.primary.withValues(alpha: 0.2),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.dashboard_customize_rounded,
                    size: 80,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 24),

                Text(
                  'Selamat Datang di Dashboard',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  'Aplikasi Profil Mahasiswa - Pemrograman Mobile Lanjutan',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 32),

                // Ringkasan info akun mahasiswa
                Card(
                  elevation: 0,
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/images/profile.png'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.nama,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'NIM: ${profile.nim}',
                                style: TextStyle(color: theme.colorScheme.primary, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                profile.prodi,
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Tombol akses ke halaman profil
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    icon: const Icon(Icons.person_rounded),
                    label: const Text(
                      'Lihat Profil Mahasiswa',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(themeNotifier: themeNotifier),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
