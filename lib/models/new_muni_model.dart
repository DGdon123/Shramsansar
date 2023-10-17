// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewMuniModel {
  final int muniId;
  final int type;
  final int districtId;
  final String name;
  final String code;
  NewMuniModel({
    required this.muniId,
    required this.type,
    required this.districtId,
    required this.name,
    required this.code,
  });

  NewMuniModel copyWith({
    int? muniId,
    int? type,
    int? districtId,
    String? name,
    String? code,
  }) {
    return NewMuniModel(
      muniId: muniId ?? this.muniId,
      type: type ?? this.type,
      districtId: districtId ?? this.districtId,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'muniId': muniId,
      'type': type,
      'districtId': districtId,
      'name': name,
      'code': code,
    };
  }

  factory NewMuniModel.fromMap(Map<String, dynamic> map) {
    return NewMuniModel(
      muniId: map['muni_id'] ?? 0,
      type: map['type'] ?? 0,
      districtId: map['district_id'] ?? 0,
      name: map['name'] ?? '',
      code: map['code'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewMuniModel.fromJson(String source) =>
      NewMuniModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewMuniModel(muniId: $muniId, type: $type, districtId: $districtId, name: $name, code: $code)';
  }

  @override
  bool operator ==(covariant NewMuniModel other) {
    if (identical(this, other)) return true;

    return other.muniId == muniId &&
        other.type == type &&
        other.districtId == districtId &&
        other.name == name &&
        other.code == code;
  }

  @override
  int get hashCode {
    return muniId.hashCode ^
        type.hashCode ^
        districtId.hashCode ^
        name.hashCode ^
        code.hashCode;
  }
}
