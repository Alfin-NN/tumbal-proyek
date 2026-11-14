import 'package:flutter/material.dart';
import '../models/profile.dart';

// Form edit profil dengan aksi simpan data
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
    _namaController = TextEditingController(text: widget.currentProfile.nama);
    _bioController = TextEditingController(text: widget.currentProfile.bio);
    _emailController = TextEditingController(text: widget.currentProfile.email);
    _hpController = TextEditingController(text: widget.currentProfile.hp);
    _kelasController = TextEditingController(text: widget.currentProfile.kelas);
    _prodiController = TextEditingController(text: widget.currentProfile.prodi);
  }

  void _simpanData() {
    if (!_formKey.currentState!.validate()) return;
    final updated = widget.currentProfile.copyWith(
      nama: _namaController.text.trim(),
      bio: _bioController.text.trim(),
      email: _emailController.text.trim(),
      hp: _hpController.text.trim(),
      kelas: _kelasController.text.trim(),
      prodi: _prodiController.text.trim(),
    );
    Navigator.pop(context, updated);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(controller: _namaController, decoration: const InputDecoration(labelText: 'Nama Lengkap *')),
            ElevatedButton(onPressed: _simpanData, child: const Text('Simpan Perubahan')),
          ],
        ),
      ),
    );
  }
}
