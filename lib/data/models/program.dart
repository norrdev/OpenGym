/// Training program model.
class Program {
  int? id;
  final String? name;
  final String? description;

  Program({this.id, this.name, this.description});

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
}
