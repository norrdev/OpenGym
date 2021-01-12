import 'package:npng/models/model.dart';

class MusclesItem extends Model {
  static String table = 'musсles';

  int id;
  String name;

  MusclesItem({this.id, this.name});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static MusclesItem fromMap(Map<String, dynamic> map) {
    return MusclesItem(
      id: map['id'],
      name: map['name'],
    );
  }
}
