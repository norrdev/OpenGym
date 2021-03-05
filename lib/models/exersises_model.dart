import 'package:npng/models/model.dart';

class ExercisesItem extends Model {
  static String table = 'exercises';
  int id;
  String name;
  String description;
  int equipmentId;

  ExercisesItem({this.id, this.name, this.description, this.equipmentId});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'description': description,
      'equipment_id': equipmentId,
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static ExercisesItem fromMap(Map<String, dynamic> map) {
    return ExercisesItem(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      equipmentId: map['equipment_id'],
    );
  }
}
