import 'dart:io';
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
    //print("Creating new DB copy from asset...");

    // Make sure the parent directory exists
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(join('assets/db', 'npng.db'));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);
  }

  try {
    db = await openDatabase(path, version: 1);
  } catch (ex) {
    //print(ex);
  }
}

Future<String> backupDataBase() async {
  String path = await getDatabasesPath() +
      //'/npng ${DateTime.now().toLocal().toString()}.db';
      '/npng-backup.db';
  await deleteDbBackupFile(path);
  await db!.rawQuery("VACUUM npng INTO '$path';");
  return path;
}

Future<void> deleteDbBackupFile(String filePath) async {
  if (filePath != await getDatabasesPath() + '/npng.db') {
    File fileToDel = File(filePath);
    if (await fileToDel.exists()) {
      fileToDel.delete();
      //print('$filePath deleted');
    }
  }
}

void importDataBase(String filePath) async {
  //TODO: make try/catch block. If file is not DB, restore from last backup.
  File file = File(filePath);
  String pathToDb = await getDatabasesPath() + '/npng.db';
  await backupDataBase();
  await db!.close();
  db = null;
  await file.copy(pathToDb);
  await initDataBase();
}
