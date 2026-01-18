import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan_employee_data/app/routes/app_routes.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    // final String = Get.arguments ?? "Unknown";

    return Scaffold(
      appBar: AppBar(title: Text("Pindai KTP")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .all(15),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.blue[50],
                  width: double.infinity,
                  child: Text(
                    "Makloon Terpilih: ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.credit_card,
                          size: 100,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 20),
                        const Text("Posisikan KTP di dalam bingkai"),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Get.toNamed(
                                  AppRoutes.detailEmployee,
                                  // arguments: {
                                  //   'makloon': 'mak-01',
                                  //   'nik': '3201123456780005',
                                  //   'nama': 'AHMAD SUBARJO',
                                  //   'alamat': 'JL. MERDEKA NO 45',
                                  // },
                                );
                              },
                              icon: const Icon(Icons.camera_alt),
                              label: const Text("Ambil Foto"),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            OutlinedButton.icon(
                              onPressed: () {
                                Get.toNamed(
                                  AppRoutes.detailEmployee,
                                  // arguments: {
                                  //   'makloon': 'mak-01',
                                  //   'nik': '3201123456780005',
                                  //   'nama': 'AHMAD SUBARJO',
                                  //   'alamat': 'JL. MERDEKA NO 45',
                                  // },
                                );
                              },
                              icon: const Icon(Icons.upload_file),
                              label: const Text("Upload File"),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
