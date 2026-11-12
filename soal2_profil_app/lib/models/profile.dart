class Profile {
  String nama;
  String nim;
  String prodi;
  String kelas;
  String bio;
  String email;
  String hp;
  String github;
  List<String> keahlian;
  List<Map<String, String>> riwayatPendidikan;

  Profile({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.kelas,
    required this.bio,
    required this.email,
    required this.hp,
    required this.github,
    required this.keahlian,
    required this.riwayatPendidikan,
  });
}
