import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile currentProfile;

  const EditProfilePage({super.key, required this.currentProfile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _namaController;
  late TextEditingController _bioController;
  late TextEditingController _emailController;
  late TextEditingController _hpController;
  late TextEditingController _kelasController;
  late TextEditingController _prodiController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan data profil saat ini
    _namaController = TextEditingController(text: widget.currentProfile.nama);
    _bioController = TextEditingController(text: widget.currentProfile.bio);
    _emailController = TextEditingController(text: widget.currentProfile.email);
    _hpController = TextEditingController(text: widget.currentProfile.hp);
    _kelasController = TextEditingController(text: widget.currentProfile.kelas);
    _prodiController = TextEditingController(text: widget.currentProfile.prodi);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _hpController.dispose();
    _kelasController.dispose();
    _prodiController.dispose();
    super.dispose();
  }

  void _simpanData() {
    // Validasi form
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Buat objek profil baru dengan nilai yang diperbarui
    final updatedProfile = widget.currentProfile.copyWith(
      nama: _namaController.text.trim(),
      bio: _bioController.text.trim(),
      email: _emailController.text.trim(),
      hp: _hpController.text.trim(),
      kelas: _kelasController.text.trim(),
      prodi: _prodiController.text.trim(),
    );

    // Kembalikan data baru ke Halaman Profil via Navigator.pop(context, dataBaru)
    Navigator.pop(context, updatedProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Info Header Form
                Text(
                  'Perbarui Informasi Diri',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Pastikan data yang dimasukkan sudah benar dan valid.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 16),

                // 1. Nama Lengkap (Wajib diisi)
                TextFormField(
                  controller: _namaController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap *',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama lengkap wajib diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // 2. Email (Validasi email regex)
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email *',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email wajib diisi';
                    }
                    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Format email tidak valid (contoh: user@domain.com)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // 3. Nomor HP (Hanya angka, 10-13 digit)
                TextFormField(
                  controller: _hpController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Nomor HP *',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                    hintText: 'Contoh: 0895364418878',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nomor HP wajib diisi';
                    }
                    final cleanValue = value.trim();
                    if (!RegExp(r'^[0-9]+$').hasMatch(cleanValue)) {
                      return 'Nomor HP hanya boleh berisi angka';
                    }
                    if (cleanValue.length < 10 || cleanValue.length > 13) {
                      return 'Nomor HP harus berukuran 10–13 digit';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // 4. Program Studi
                TextFormField(
                  controller: _prodiController,
                  decoration: const InputDecoration(
                    labelText: 'Program Studi',
                    prefixIcon: Icon(Icons.school),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Program studi tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // 5. Kelas
                TextFormField(
                  controller: _kelasController,
                  decoration: const InputDecoration(
                    labelText: 'Kelas',
                    prefixIcon: Icon(Icons.class_),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Kelas tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // 6. Bio Singkat
                TextFormField(
                  controller: _bioController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Bio Singkat',
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),

                // Tombol Simpan
                FilledButton.icon(
                  onPressed: _simpanData,
                  icon: const Icon(Icons.save),
                  label: const Text(
                    'Simpan Perubahan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
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
