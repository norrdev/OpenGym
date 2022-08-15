import 'package:equatable/equatable.dart';

/// Exercise model.
class Exercise extends Equatable {
  final int? id;
  final String? name;
  final String? description;

  const Exercise({this.id, this.name, this.description});

  @override
  List<Object?> get props => [id, name, description];

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json['id'] as int,
        name: json['name'] == null ? '' : json['name'] as String,
        description:
            json['description'] == null ? '' : json['description'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
}
