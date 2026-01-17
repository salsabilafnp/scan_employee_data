import 'package:scan_employee_data/app/data/models/employee.dart';
import 'package:scan_employee_data/app/data/models/makloon.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'ktp_scanner.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    // Tabel Employees
    await db.execute('''
      CREATE TABLE employees(
        id TEXT PRIMARY KEY,
        nik TEXT,
        nama TEXT,
        tempat_lahir TEXT,
        tgl_lahir TEXT,
        alamat TEXT,
        status_perkawinan TEXT,
        pekerjaan TEXT,
        makloon TEXT,
        petugas_input TEXT,
        foto_path TEXT,
        is_synced INTEGER DEFAULT 0,
        created_at TEXT
      )
    ''');

    // Tabel Makloons
    await db.execute('''
      CREATE TABLE makloons(
        id TEXT PRIMARY KEY,
        nama_makloon TEXT,
        alamat_makloon TEXT,
        created_at TEXT
      )
    ''');
  }

  /// CRUD Makloon
  Future<List<Makloon>> getAllMakloons() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'makloons',
      orderBy: "nama_makloon ASC",
    );
    return List.generate(maps.length, (i) => Makloon.fromMap(maps[i]));
  }

  Future<int> insertMakloon(Makloon makloon) async {
    final db = await database;
    return await db.insert(
      'makloons',
      makloon.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteMakloon(String id) async {
    final db = await database;
    return await db.delete('makloons', where: 'id = ?', whereArgs: [id]);
  }

  // Employee
  // insert employee
  Future<int> insertEmployee(Employee employee) async {
    final db = await database;
    return await db.insert(
      'employees',
      employee.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // get all employee
  Future<List<Employee>> getAllEmployees() async {
    final db = await database;
    // sort from newest
    final List<Map<String, dynamic>> maps = await db.query(
      'employees',
      orderBy: "created_at DESC",
    );
    return List.generate(maps.length, (i) => Employee.fromMap(maps[i]));
  }

  // get unsynced employee
  Future<List<Employee>> getUnsyncedEmployees() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'employees',
      where: 'is_synced = ?',
      whereArgs: [0], // false
    );
    return List.generate(maps.length, (i) => Employee.fromMap(maps[i]));
  }

  // update sync mark
  Future<int> markAsSynced(String id) async {
    final db = await database;
    return await db.update(
      'employees',
      {'is_synced': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
