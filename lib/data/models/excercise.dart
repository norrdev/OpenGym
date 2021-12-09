import 'package:npng/config.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Exercise extends Equatable {
  int? id;
  final String? name;
  final String? description;

  Exercise({this.id, this.name, this.description});

  @override
  List<Object?> get props => [id, name, description];

  // Create a Mucscle from JSON data
  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
      );

  // Convert our Muscle to JSON to make it easier when you
  // store it in the database
  Map<String, dynamic> toJson() => {
        'id': id,
        '${kLocale}_name': name,
        'description': description,
      };
}
