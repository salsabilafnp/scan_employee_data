import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pindai KTP")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: .all(15), child: Column()),
        ),
      ),
    );
  }
}
