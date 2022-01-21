import 'dart:typed_data';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Muscle extends Equatable {
  int? id;
  final String? name;
  final Uint8List? icon;

  Muscle({this.id, this.name, this.icon});

  @override
  List<Object?> get props => [id, name, icon];

  // Create a Mucscle from JSON data
  factory Muscle.fromJson(Map<String, dynamic> json) => Muscle(
        id: json['id'] as int,
        name: json['name'] as String,
        icon: json['icon'] as Uint8List,
      );

  // Convert our Muscle to JSON to make it easier when you
  // store it in the database
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
      };
}
