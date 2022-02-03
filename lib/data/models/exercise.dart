/// Exercise model.
class Exercise {
  int? id;
  final String? name;
  final String? description;

  Exercise({this.id, this.name, this.description});

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
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
