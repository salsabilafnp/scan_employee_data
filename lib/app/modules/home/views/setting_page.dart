import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pengaturan")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .all(15),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Card(
                  child: Padding(
                    padding: .all(20),
                    child: Column(
                      children: [
                        Text(
                          "Informasi Petugas Input",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Icon(Icons.person),
                            Text("Username"),
                            IconButton(
                              onPressed: () {
                                // edit username
                              },
                              icon: Icon(Icons.edit, color: Colors.blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Sinkronisasi data terakhir pada 17 Januari 2026 17:00 WIB",
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () {
                    // backup
                  },
                  label: Text("Backup Data"),
                  icon: Icon(Icons.backup),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.orange),
                  ),
                ),
                SizedBox(height: 5),
                FilledButton.icon(
                  onPressed: () {
                    // logout
                  },
                  label: Text("Logout"),
                  icon: Icon(Icons.logout_outlined),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
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
