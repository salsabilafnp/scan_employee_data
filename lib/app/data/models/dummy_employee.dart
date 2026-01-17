import 'package:intl/intl.dart';
import 'package:scan_employee_data/app/data/models/employee.dart';

String getFormattedTime(DateTime date) {
  return DateFormat('dd/MM/yyyy HH:mm').format(date);
}

List<Employee> dummyEmployees = [
  // 1. Data Paling Baru (Belum Sync - Kasus: Offline/Baru Scan)
  Employee(
    id: 'uuid-001',
    nik: '3201123456789001',
    nama: 'Andi Saputra',
    tempatLahir: 'Bandung',
    tglLahir: '12/05/1995',
    alamat: 'Jl. Merdeka No. 10, Bandung',
    statusPerkawinan: 'Belum Kawin',
    pekerjaan: 'Programmer',
    fotoPath: 'assets/images/placeholder_face_1.jpg',
    makloon: "PT. Maju Mundur (Jahit)",
    isSynced: 0,
    createdAt: getFormattedTime(
      DateTime.now().subtract(const Duration(minutes: 15)),
    ),
    petugasInput: 'admin_1',
  ),

  // 2. Data Baru (Sudah Sync - Kasus: Sukses Upload)
  Employee(
    id: 'uuid-002',
    nik: '3171123456789002',
    nama: 'Budi Santoso',
    tempatLahir: 'Jakarta',
    tglLahir: '23/08/1990',
    alamat: 'Jl. Sudirman Kav. 5, Jakarta Selatan',
    statusPerkawinan: 'Kawin',
    pekerjaan: 'Marketing',
    fotoPath: 'assets/images/placeholder_face_2.jpg',
    makloon: "PT. Maju Mundur (Jahit)",
    isSynced: 1,
    createdAt: getFormattedTime(
      DateTime.now().subtract(const Duration(minutes: 45)),
    ),
    petugasInput: 'admin_1',
  ),

  // 3. Data Tadi Pagi (Belum Sync - Kasus: Lupa sync/Error)
  Employee(
    id: 'uuid-003',
    nik: '3578123456789003',
    nama: 'Citra Kirana',
    tempatLahir: 'Surabaya',
    tglLahir: '01/01/1998',
    alamat: 'Perumahan Griya Indah Blok A3, Surabaya',
    statusPerkawinan: 'Belum Kawin',
    pekerjaan: 'Staff Admin',
    fotoPath: 'assets/images/placeholder_face_3.jpg',
    makloon: "Gudang Logistik Pusat",
    isSynced: 0,
    createdAt: getFormattedTime(
      DateTime.now().subtract(const Duration(hours: 3)),
    ),
    petugasInput: 'admin_1',
  ),

  // 4. Data Kemarin (Sudah Sync)
  Employee(
    id: 'uuid-004',
    nik: '5171123456789004',
    nama: 'Dewa Made',
    tempatLahir: 'Denpasar',
    tglLahir: '14/02/1988',
    alamat: 'Jl. Legian No. 99, Bali',
    statusPerkawinan: 'Kawin',
    pekerjaan: 'Security',
    fotoPath: 'assets/images/placeholder_face_4.jpg',
    makloon: "Gudang Logistik Pusat",
    isSynced: 1,
    createdAt: getFormattedTime(
      DateTime.now().subtract(const Duration(days: 1, hours: 2)),
    ),
    petugasInput: 'admin_2',
  ),

  // 5. Data Lama (Sudah Sync)
  Employee(
    id: 'uuid-005',
    nik: '1271123456789005',
    nama: 'Eka Pertiwi',
    tempatLahir: 'Medan',
    tglLahir: '30/11/1992',
    alamat: 'Jl. Sisingamangaraja No. 12, Medan',
    statusPerkawinan: 'Cerai Hidup',
    pekerjaan: 'HRD Manager',
    fotoPath: 'assets/images/placeholder_face_5.jpg',
    makloon: "PT. Sejahtera (Packing)",
    isSynced: 1,
    createdAt: getFormattedTime(
      DateTime.now().subtract(const Duration(days: 2)),
    ),
    petugasInput: 'admin_1',
  ),
];
