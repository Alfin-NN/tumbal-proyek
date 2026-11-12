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

  // Salin objek dengan beberapa field yang diubah (immutability helper)
  Profile copyWith({
    String? nama,
    String? nim,
    String? prodi,
    String? kelas,
    String? bio,
    String? email,
    String? hp,
    String? github,
    List<String>? keahlian,
    List<Map<String, String>>? riwayatPendidikan,
  }) {
    return Profile(
      nama: nama ?? this.nama,
      nim: nim ?? this.nim,
      prodi: prodi ?? this.prodi,
      kelas: kelas ?? this.kelas,
      bio: bio ?? this.bio,
      email: email ?? this.email,
      hp: hp ?? this.hp,
      github: github ?? this.github,
      keahlian: keahlian ?? this.keahlian,
      riwayatPendidikan: riwayatPendidikan ?? this.riwayatPendidikan,
    );
  }
}
