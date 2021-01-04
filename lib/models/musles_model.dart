import 'package:sqflite/sqflite.dart';

final String tableMusles = 'musles';
final String columnId = 'id';
final String columnName = 'name';

class Musles {
  int id;
  String title;
  bool done;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: title,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Musles();

  Musles.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnName];
  }
}

class MuslesModel {
  Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableMusles ( 
  $columnId integer primary key autoincrement, 
  $columnName text not null)
''');
    });
  }

  Future<Musles> insert(Musles todo) async {
    todo.id = await db.insert(tableMusles, todo.toMap());
    return todo;
  }

  Future<Musles> getTodo(int id) async {
    List<Map> maps = await db.query(tableMusles,
        columns: [columnId, columnName],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Musles.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db
        .delete(tableMusles, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Musles todo) async {
    return await db.update(tableMusles, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  Future close() async => db.close();
}
