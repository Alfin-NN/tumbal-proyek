import 'package:flutter/material.dart';
import '../models/profile.dart';

// Halaman formulir edit dengan validasi input
class EditProfilePage extends StatefulWidget {
  final Profile currentProfile;

  const EditProfilePage({super.key, required this.currentProfile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaController;
  late TextEditingController _emailController;
  late TextEditingController _hpController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.currentProfile.nama);
    _emailController = TextEditingController(text: widget.currentProfile.email);
    _hpController = TextEditingController(text: widget.currentProfile.hp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: 'Nama Lengkap *'),
                validator: (v) => v!.trim().isEmpty ? 'Nama wajib diisi' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email *'),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Email wajib diisi';
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v.trim())) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _hpController,
                decoration: const InputDecoration(labelText: 'Nomor HP *'),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Nomor HP wajib diisi';
                  if (!RegExp(r'^[0-9]+$').hasMatch(v.trim())) return 'Hanya boleh angka';
                  if (v.trim().length < 10 || v.trim().length > 13) return 'Harus 10-13 digit';
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
