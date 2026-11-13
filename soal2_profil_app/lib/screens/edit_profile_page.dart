import 'package:flutter/material.dart';
import '../models/profile.dart';

// Halaman formulir edit data profil
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

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.currentProfile.nama);
    _emailController = TextEditingController(text: widget.currentProfile.email);
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
              TextFormField(controller: _namaController, decoration: const InputDecoration(labelText: 'Nama Lengkap')),
              TextFormField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email')),
            ],
          ),
        ),
      ),
    );
  }
}
