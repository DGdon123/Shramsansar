// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class NewTrainingCategoryModel {
  final int id;
  final String name;
  final int status;
  NewTrainingCategoryModel({
    required this.id,
    required this.name,
    required this.status,
  });

  NewTrainingCategoryModel copyWith({
    int? id,
    String? name,
    int? status,
  }) {
    return NewTrainingCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status,
    };
  }

  factory NewTrainingCategoryModel.fromMap(Map<String, dynamic> map) {
    return NewTrainingCategoryModel(
      id: map['id'] ??0,
      name: map['name'] ??"",
      status: map['status'] ??0,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewTrainingCategoryModel.fromJson(String source) => NewTrainingCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TrainingCategoryModel(id: $id, name: $name, status: $status)';

  @override
  bool operator ==(covariant NewTrainingCategoryModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ status.hashCode;
}
