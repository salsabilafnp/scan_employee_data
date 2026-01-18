import 'package:flutter/material.dart';
import 'package:scan_employee_data/app/data/models/dummy_employee.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Karyawan")),
      body: SafeArea(
        child: SingleChildScrollView(
          // recent data - list
          child: Padding(
            padding: .all(15),
            child: ListView.separated(
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
                        color: isSyncedData == 1 ? Colors.green : Colors.orange,
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
                      color: isSyncedData == 1 ? Colors.green : Colors.orange,
                    ),
                    onTap: () {
                      // edit data
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
