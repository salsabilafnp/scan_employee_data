import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan_employee_data/app/data/models/dummy_employee.dart';
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
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
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
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.people),
                                    SizedBox(width: 10),
                                    Text(
                                      "20",
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Total Data",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.sync, color: Colors.green),
                                    SizedBox(width: 10),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Sync Data",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.sync_disabled,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "Unsync Data",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
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
                        Icon(Icons.place),
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
                      onPressed: () {
                        Get.toNamed(AppRoutes.makloonData);
                      },
                      label: Text("Kelola Makloon"),
                      icon: Icon(Icons.home_work),
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
                      onPressed: () {},
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
                        contentPadding: .symmetric(horizontal: 10, vertical: 2),
                        title: Text(
                          item.nama,
                          style: TextStyle(fontWeight: .w600),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                        subtitle: Row(
                          children: [
                            Text(item.makloon, style: TextStyle(fontSize: 12)),
                            SizedBox(width: 8),
                            Text(
                              item.createdAt,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        // Trailing: Status Icon
                        trailing: Tooltip(
                          message: isSyncedData == 1
                              ? "Sudah Terupload"
                              : "Belum Upload",
                          child: Icon(
                            isSyncedData == 1
                                ? Icons.check_circle
                                : Icons.cloud_upload_rounded,
                            color: isSyncedData == 1
                                ? Colors.green
                                : Colors.orange,
                          ),
                        ),
                        onTap: () {
                          // Navigasi ke detail edit
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
        onPressed: () {},
        tooltip: "Scan KTP",
        label: Text("Scan KTP"),
        icon: Icon(Icons.document_scanner),
      ),
    );
  }
}
