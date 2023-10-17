// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewPradeshModel {
  final int id;
  final String name;
  NewPradeshModel({
    required this.id,
    required this.name,
  });

  NewPradeshModel copyWith({
    int? id,
    String? name,
  }) {
    return NewPradeshModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory NewPradeshModel.fromMap(Map<String, dynamic> map) {
    return NewPradeshModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewPradeshModel.fromJson(String source) =>
      NewPradeshModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PradeshModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant NewPradeshModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
