import 'dart:typed_data' show Uint8List;

import 'package:equatable/equatable.dart';

/// Miscle model.
class Muscle extends Equatable {
  final int? id;
  final String? name;
  final Uint8List? icon;

  const Muscle({this.id, this.name, this.icon});

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

  @override
  List<Object?> get props => [id, name, icon];
}
