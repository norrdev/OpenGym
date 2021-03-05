import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:npng/models/model.dart';
import 'package:sqflite/sqflite.dart';

abstract class DB {
  static Database db;

  static int get _version => 1;

  static Future<void> init() async {
    if (db != null) {
      return;
    }

    String path = await getDatabasesPath() + '/npng.db';
    // Check if the database exists
    bool exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets/db/en", "npng.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    }

    try {
      db = await openDatabase(path, version: _version, onCreate: onCreate);
      print(path);
    } catch (ex) {
      print(ex);
    }
  }

  static void onCreate(Database db, int version) async {}

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
