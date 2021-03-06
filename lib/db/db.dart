import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:weather/model/sql_model.dart';
import 'package:weather/model/weather_model.dart';

abstract class DB {

  static Database? _db;

  static int get _version => 1;

  static Future<void> init() async {

    if (_db != null) { return; }

    try {
      String _path = await getDatabasesPath() + 'example';
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    }
    catch(ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async =>
      await db.execute('CREATE TABLE todo_items (id INTEGER PRIMARY KEY, cityName TEXT)');

  static Future<List<Map<String, dynamic>>> query(String table) async => _db!.query(table);

  static Future<int> insert(String table, SQLModel model) async =>
      await _db!.insert(table, model.toJson());

  static Future<int> update(String table, SQLModel model) async =>
      await _db!.update(table, model.toJson(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, SQLModel model) async =>
      await _db!.delete(table, where: 'id = ?', whereArgs: [model.id]);
}