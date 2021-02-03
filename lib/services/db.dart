import 'dart:async';
import 'package:npng/models/model.dart';
import 'package:sqflite/sqflite.dart';

abstract class DB {
  static Database db;

  static int get _version => 1;

  static Future<void> init() async {
    if (db != null) {
      return;
    }

    try {
      String _path = await getDatabasesPath() + '/npng.db';
      db = await openDatabase(_path, version: _version, onCreate: onCreate);
      print(_path);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async {
    // await db.transaction((txn) async {
    //   await txn.execute(
    //       'CREATE TABLE musles (id INTEGER PRIMARY KEY NOT NULL, name STRING)');
    //   await txn.execute(
    //       'CREATE TABLE exersises (id INTEGER PRIMARY KEY NOT NULL, musles_id INTEGER, name STRING, description STRING)');
    //   await db.execute("INSERT INTO musles (name) VALUES ('ABS for test')");
    // });
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      db.query(table);

  static Future<int> insert(String table, Model model) async =>
      await db.insert(table, model.toMap());

  static Future<int> update(String table, Model model) async => await db
      .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, Model model) async =>
      await db.delete(table, where: 'id = ?', whereArgs: [model.id]);

  static Future<List<Map<String, dynamic>>> rawQuery(String sql) async =>
      db.rawQuery(sql);

  static Future rawExecute(String sql) async => db.execute(sql);
}
