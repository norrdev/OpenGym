import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Program extends Equatable {
  int? id;
  final String? name;
  final String? description;

  Program({this.id, this.name, this.description});

  @override
  List<Object?> get props => [id, name, description];

  // Create a Program from JSON data
  factory Program.fromJson(Map<String, dynamic> json) => Program(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
      );

  // Convert our Program to JSON to make it easier when you
  // store it in the database
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
      };
}
