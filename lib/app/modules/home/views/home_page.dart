import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan_employee_data/app/data/models/dummy_employee.dart';
import 'package:scan_employee_data/app/data/models/dummy_makloon.dart';
import 'package:scan_employee_data/app/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Get.toNamed(AppRoutes.setting),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .all(15),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                // operator name
                Text("Halo,"),
                Text(
                  "Username!",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                // data summary
                Card(
                  child: Padding(
                    padding: .all(15),
                    child: Column(
                      children: [
                        Text(
                          "Ringkasan Data Karyawan",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: .spaceAround,
                          children: [
                            _buildSummaryItem(
                              "20",
                              "Total Data",
                              Icons.people,
                              Colors.black,
                            ),
                            _buildSummaryItem(
                              "10",
                              "Synced Data",
                              Icons.sync,
                              Colors.green,
                            ),
                            _buildSummaryItem(
                              "10",
                              "Unsync Data",
                              Icons.sync_disabled,
                              Colors.orange,
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Sinkronisasi data terakhir pada 17 Januari 2026 17:00 WIB",
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_pin, color: Colors.red),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              "Lokasi Makloon Aktif",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Gudang Logistik Pusat",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    FilledButton.icon(
                      onPressed: () => Get.toNamed(AppRoutes.makloonData),
                      label: Text("Kelola Makloon"),
                      icon: Icon(Icons.factory),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // recent data
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "Data Karyawan Terbaru",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () => Get.toNamed(AppRoutes.employeeData),
                      label: Text("Lihat Semua"),
                      icon: Icon(Icons.arrow_forward),
                      iconAlignment: .end,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                // recent data - list
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dummyEmployees.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  padding: .symmetric(horizontal: 5),
                  itemBuilder: (context, index) {
                    final item = dummyEmployees[index];
                    final isSyncedData = item.isSynced;

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: .circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                        border: Border(
                          left: BorderSide(
                            color: isSyncedData == 1
                                ? Colors.green
                                : Colors.orange,
                            width: 5,
                          ),
                        ),
                      ),
                      // employee info
                      child: ListTile(
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: Text(
                          item.nama,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${item.makloon} • ${item.createdAt}",
                          style: TextStyle(fontSize: 12),
                        ),
                        trailing: Icon(
                          isSyncedData == 1
                              ? Icons.check_circle
                              : Icons.cloud_upload,
                          color: isSyncedData == 1
                              ? Colors.green
                              : Colors.orange,
                        ),
                        onTap: () {
                          // edit data
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showSelectMakloonDialog,
        tooltip: "Scan KTP",
        label: Text("Scan KTP"),
        icon: Icon(Icons.document_scanner),
      ),
    );
  }

  // summary item
  Widget _buildSummaryItem(
    String count,
    String label,
    IconData icon,
    Color? color,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: color),
            SizedBox(width: 10),
            Text(
              count,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.italic,
            color: color,
          ),
        ),
      ],
    );
  }

  // dialog select makloon
  void _showSelectMakloonDialog() {
    Get.defaultDialog(
      title: "Pilih Makloon",
      content: SizedBox(
        width: double.maxFinite,
        height: 200,
        child: ListView.builder(
          itemCount: dummyMakloons.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(dummyMakloons[index].nama),
              leading: Icon(Icons.factory),
              onTap: () {
                Get.back();
                Get.toNamed(
                  AppRoutes.scanKtp,
                  // arguments: dummyMakloons[index],
                );
              },
            );
          },
        ),
      ),
      actions: [
        OutlinedButton.icon(
          onPressed: () => Get.toNamed(AppRoutes.makloonData),
          icon: Icon(Icons.factory),
          label: Text("Kelola Makloon"),
        ),
      ],
      cancel: TextButton(
        onPressed: () => Get.back(),
        child: Text("Batal", style: TextStyle(color: Colors.red)),
      ),
    );
  }
}
