class Makloon {
  String id;
  String nama;
  String alamatMakloon;
  String createdAt;

  Makloon({
    required this.id,
    required this.nama,
    required this.alamatMakloon,
    required this.createdAt,
  });

  factory Makloon.fromMap(Map<String, dynamic> json) => Makloon(
    id: json['id'],
    nama: json['nama_makloon'],
    alamatMakloon: json['alamat_makloon'],
    createdAt: json['created_at'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'nama_makloon': nama,
    'alamat_makloon': alamatMakloon,
    'created_at': createdAt,
  };
}
