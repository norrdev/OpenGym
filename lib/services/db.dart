import 'dart:async';
import 'package:npng/models/model.dart';
import 'package:sqflite/sqflite.dart';

abstract class DB {
  static Database _db;

  static int get _version => 1;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + '/npng.db';
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
      print(_path);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async {
    await db.transaction((txn) async {
      await db.execute(
          'CREATE TABLE musles (id INTEGER PRIMARY KEY NOT NULL, name STRING)');
      await db.execute(
          'CREATE TABLE exersises (id INTEGER PRIMARY KEY NOT NULL, musles_id INTEGER, name STRING, description STRING)');
      await db.execute("INSERT INTO musles (name) VALUES ('ABS for test')");
    });
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, Model model) async =>
      await _db.insert(table, model.toMap());

  static Future<int> update(String table, Model model) async => await _db
      .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, Model model) async =>
      await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);
}
