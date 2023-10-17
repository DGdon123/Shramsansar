// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DistrictNewModel {
  final int id;
  final int pradeshId;
  final String pradeshName;
  final String name;
  final String code;
  DistrictNewModel({
    required this.id,
    required this.pradeshId,
    required this.pradeshName,
    required this.name,
    required this.code,
  });

  DistrictNewModel copyWith({
    int? id,
    int? pradeshId,
    String? pradeshName,
    String? name,
    String? code,
  }) {
    return DistrictNewModel(
      id: id ?? this.id,
      pradeshId: pradeshId ?? this.pradeshId,
      pradeshName: pradeshName ?? this.pradeshName,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pradeshId': pradeshId,
      'pradeshName': pradeshName,
      'name': name,
      'code': code,
    };
  }

  factory DistrictNewModel.fromMap(Map<String, dynamic> map) {
    return DistrictNewModel(
      id: map['id'] ?? 0,
      pradeshId: map['pradesh_id'] ?? 0,
      pradeshName: map['pradesh_name'] ?? '',
      name: map['name'] ?? '',
      code: map['code'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DistrictNewModel.fromJson(String source) =>
      DistrictNewModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DistrictNewModel(id: $id, pradeshId: $pradeshId, pradeshName: $pradeshName, name: $name, code: $code)';
  }

  @override
  bool operator ==(covariant DistrictNewModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.pradeshId == pradeshId &&
        other.pradeshName == pradeshName &&
        other.name == name &&
        other.code == code;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        pradeshId.hashCode ^
        pradeshName.hashCode ^
        name.hashCode ^
        code.hashCode;
  }
}
