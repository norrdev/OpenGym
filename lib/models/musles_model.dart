import 'package:npng/models/model.dart';

class MuslesItem extends Model {
  static String table = 'musles';

  int id;
  String name;

  MuslesItem({this.id, this.name});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static MuslesItem fromMap(Map<String, dynamic> map) {
    return MuslesItem(
      id: map['id'],
      name: map['name'],
    );
  }
}
