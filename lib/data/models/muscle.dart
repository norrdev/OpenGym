import 'dart:typed_data';

/// Miscle model.
class Muscle {
  int? id;
  final String? name;
  final Uint8List? icon;

  Muscle({this.id, this.name, this.icon});

  factory Muscle.fromJson(Map<String, dynamic> json) => Muscle(
        id: json['id'] as int,
        name: json['name'] as String,
        icon: json['icon'] as Uint8List,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
      };
}
