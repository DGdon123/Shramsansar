// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewCasteModel {
  final int id;
  final String name;
  NewCasteModel({
    required this.id,
    required this.name,
  });
  

  NewCasteModel copyWith({
    int? id,
    String? name,
  }) {
    return NewCasteModel(
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

  factory NewCasteModel.fromMap(Map<String, dynamic> map) {
    return NewCasteModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewCasteModel.fromJson(String source) => NewCasteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NewCasteModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant NewCasteModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
