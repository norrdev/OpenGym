import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

Database? db;

Future<void> initDataBase() async {
  if (db != null) {
    return;
  }

  String path = await getDatabasesPath() + '/npng.db';
  // Check if the database exists
  bool exists = await databaseExists(path);

  if (!exists) {
    // Should happen only the first time you launch your application
    print("Creating new DB copy from asset...");

    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(join("assets/db", "npng.db"));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);
  }

  try {
    db = await openDatabase(path, version: 1);
  } catch (ex) {
    print(ex);
  }
}

Future<String> backupDataBase() async {
  String path = await getDatabasesPath() +
      '/npng ${DateTime.now().toLocal().toString()}.db';
  await db!.rawQuery("VACUUM npng INTO '$path';");
  return path;
}

void importDataBase(String filePath) async {
  File file = File(filePath);
  String pathToDb = await getDatabasesPath() + '/npng.db';
  backupDataBase();
  await db!.close();
  db = null;
  await file.copy(pathToDb);
  await initDataBase();
}
