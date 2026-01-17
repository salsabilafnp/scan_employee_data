import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan_employee_data/app/data/models/dummy_makloon.dart';

class MakloonPage extends StatefulWidget {
  const MakloonPage({super.key});

  @override
  State<MakloonPage> createState() => _MakloonPageState();
}

class _MakloonPageState extends State<MakloonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kelola Data Makloon")),
      body: SafeArea(
        child: Padding(
          padding: .all(15),
          child: ListView.builder(
            itemCount: dummyMakloons.length,
            itemBuilder: (context, index) {
              final item = dummyMakloons[index];
              return Card(
                margin: .only(bottom: 10),
                child: ListTile(
                  leading: CircleAvatar(child: Text(item.nama[0])),
                  title: Text(
                    item.nama,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    item.alamatMakloon,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _confirmDelete(item.id),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddDialog(context),
      ),
    );
  }

  // Dialog Tambah Data
  void _showAddDialog(BuildContext context) {
    Get.defaultDialog(
      title: "Tambah Makloon",
      content: Column(
        children: [
          TextField(
            controller: TextEditingController(),
            decoration: const InputDecoration(labelText: "Nama Makloon/PT"),
          ),
          TextField(
            controller: TextEditingController(),
            decoration: const InputDecoration(
              labelText: "Kode Divisi (Opsional)",
            ),
          ),
        ],
      ),
      textConfirm: "Simpan",
      textCancel: "Batal",
      // onConfirm: () => controller.addMakloon(namaC.text, kodeC.text),
    );
  }

  // Dialog Konfirmasi Hapus
  void _confirmDelete(String id) {
    Get.defaultDialog(
      title: "Hapus?",
      middleText: "Data yang dihapus tidak bisa dikembalikan.",
      textConfirm: "Ya, Hapus",
      textCancel: "Batal",
      confirmTextColor: Colors.white,
      onConfirm: () {
        // controller.deleteMakloon(id);
        Get.back(); // Tutup dialog
      },
    );
  }
}
