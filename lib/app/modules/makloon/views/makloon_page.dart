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
      appBar: AppBar(title: Text("Kelola Makloon")),
      body: SafeArea(
        child: Padding(
          padding: .all(15),
          child: ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: dummyMakloons.length,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            padding: .symmetric(horizontal: 5),
            itemBuilder: (context, index) {
              final item = dummyMakloons[index];

              return ListTile(
                tileColor: Colors.white,
                leading: CircleAvatar(child: Text(item.nama[0])),
                title: Text(dummyMakloons[index].nama),
                subtitle: Text(
                  dummyMakloons[index].alamatMakloon,
                  maxLines: 2,
                  softWrap: true,
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _confirmDelete,
                ),
                // onTap: () => editDialog,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddDialog(context),
      ),
    );
  }

  // Dialog Tambah Data
  void _showAddDialog(BuildContext context) {
    Get.defaultDialog(
      title: "Tambah Makloon",
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                labelText: "Nama Makloon",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                labelText: "Alamat Makloon",
                floatingLabelStyle: TextStyle(),
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
      ),
      cancel: TextButton(
        onPressed: () => Get.back(),
        child: Text("Batal", style: TextStyle(color: Colors.red)),
      ),
      confirm: FilledButton(
        onPressed: () {
          // controller.addMakloon(namaC.text, alamat.text),
        },
        child: Text("Simpan"),
      ),
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
        Get.back();
      },
    );
  }
}
