import 'package:npng/models/model.dart';

class TodoItem extends Model {
  static String table = 'musles';

  int id;
  String name;

  TodoItem({this.id, this.name});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static TodoItem fromMap(Map<String, dynamic> map) {
    return TodoItem(
      id: map['id'],
      name: map['name'],
    );
  }
}
