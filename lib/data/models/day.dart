import 'package:equatable/equatable.dart';

/// Traning day model.
class Day extends Equatable {
  final int? id;
  final int? ord;
  final String? name;
  final String? description;

  const Day({this.id, this.ord, this.name, this.description});

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        id: json['id'] as int,
        ord: json['ord'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'ord': ord,
        'name': name,
        'description': description,
      };

  @override
  List<Object?> get props => [id, ord, name, description];
}
