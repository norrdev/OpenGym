import 'package:npng/models/model.dart';

class ExercisesItem extends Model {
  static String tableExercises = 'exercises';
  static String tableLoad = 'load';
  static String tableEquipment = 'equipment';

  int id;
  String name;
  String description;
  //int equipment_id;

  ExercisesItem({this.id, this.name, this.description});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'description': description,
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
    );
  }
}
