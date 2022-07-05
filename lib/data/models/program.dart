import 'package:equatable/equatable.dart';

/// Training program model.
class Program extends Equatable {
  final int? id;
  final String? name;
  final String? description;

  const Program({this.id, this.name, this.description});

  factory Program.fromJson(Map<String, dynamic> json) => Program(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };

  @override
  List<Object?> get props => [id, name, description];
}
