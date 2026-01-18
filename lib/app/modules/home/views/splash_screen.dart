import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan_employee_data/app/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: .all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.document_scanner, size: 80, color: Colors.blue),
            SizedBox(height: 20),
            Text(
              "Selamat Datang",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Masukkan identitas Anda untuk melanjutkan",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Nama Operator / Petugas Input",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  // save to local
                  Get.offAllNamed(AppRoutes.home);
                } else {
                  Get.snackbar("Error", "Nama tidak boleh kosong");
                }
              },
              child: Text("Masuk Aplikasi"),
            ),
          ],
        ),
      ),
    );
  }
}
