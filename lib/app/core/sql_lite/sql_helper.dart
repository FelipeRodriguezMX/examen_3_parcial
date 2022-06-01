import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class ISqlHelper {
  Future<void> database();
  Future<bool> insert({required String query});
  Future<bool> edit({required String query});
  Future<List<Map<String, Object?>>> get(String query);
}

class SQLHelperImplementation implements ISqlHelper {
  Database? _db;

  @override
  Future<Database> database() async {
    if (_db != null) return _db!;
    _db = await _initDB('examenVehiculo.db');
    return _db!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future<void> _onCreateDB(Database db, int version) async {
    db.execute(
        '''CREATE TABLE Marca (id INTEGER PRIMARY KEY AUTOINCREMENT, marca TEXT )''');

    db.execute(
      '''CREATE TABLE Vehiculo (id INTEGER PRIMARY KEY  AUTOINCREMENT, modelo TEXT, ano TEXT, marca_id INTEGER, FOREIGN KEY(marca_id) REFERENCES Marca(id))''',
    );
  }

  @override
  Future<bool> edit({required String query}) async {
    final result = await _db!.rawUpdate(query);
    return (result >= 0) ? true : false;
  }

  @override
  Future<List<Map<String, dynamic>>> get(String query) async {
    _db ??= await database();
    // var tableNames = (await _db!
    //         .query('sqlite_master', where: 'type = ?', whereArgs: ['table']))
    //     .map((row) => row['name'] as String)
    //     .toList(growable: false);
    // inspect(tableNames);
    final result = await _db!.rawQuery(query);
    return result;
  }

  @override
  Future<bool> insert({
    required String query,
  }) async {
    _db ??= await database();

    final result = await _db!.rawInsert(query);
    return (result >= 0) ? true : false;
  }
}
