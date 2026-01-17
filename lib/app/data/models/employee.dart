
class Employee {
  String id;
  String nik;
  String nama;
  String tempatLahir;
  String tglLahir;
  String alamat;
  String statusPerkawinan;
  String pekerjaan;
  String fotoPath;
  String makloon;
  int isSynced;
  String createdAt;
  String petugasInput;

  Employee({
    required this.id,
    required this.nik,
    required this.nama,
    required this.tempatLahir,
    required this.tglLahir,
    required this.alamat,
    required this.statusPerkawinan,
    required this.pekerjaan,
    required this.fotoPath,
    required this.makloon,
    this.isSynced = 0,
    required this.createdAt,
    required this.petugasInput,
  });

  factory Employee.fromMap(Map<String, dynamic> json) => Employee(
    id: json['id'],
    nik: json['nik'],
    nama: json['nama'],
    tempatLahir: json['tempat_lahir'],
    tglLahir: json['tgl_lahir'],
    alamat: json['alamat'],
    statusPerkawinan: json['status_perkawinan'],
    pekerjaan: json['pekerjaan'],
    fotoPath: json['foto_path'],
    makloon: json['makloon'] ?? '',
    isSynced: json['is_synced'],
    createdAt: json['created_at'],
    petugasInput: json['petugas_input'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'nik': nik,
    'nama': nama,
    'tempat_lahir': tempatLahir,
    'tgl_lahir': tglLahir,
    'alamat': alamat,
    'status_perkawinan': statusPerkawinan,
    'pekerjaan': pekerjaan,
    'foto_path': fotoPath,
    'makloon': makloon,
    'is_synced': isSynced,
    'created_at': createdAt,
    'petugas_input': petugasInput,
  };

  Map<String, dynamic> toJson() => {
    'nik': nik,
    'nama': nama,
    'tempat_lahir': tempatLahir,
    'tgl_lahir': tglLahir,
    'alamat': alamat,
    'status_perkawinan': statusPerkawinan,
    'pekerjaan': pekerjaan,
    'makloon': makloon,
    'petugas_input': petugasInput,
  };
}