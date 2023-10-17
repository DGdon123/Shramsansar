/// data : [{"id":1,"name":"Citizen","status":1,"created_at":"2022-10-02T11:39:42.000000Z","updated_at":"2022-10-02T11:41:00.000000Z"},{"id":2,"name":"driving license","status":1,"created_at":"2022-10-02T11:40:20.000000Z","updated_at":"2022-10-02T11:40:58.000000Z"},{"id":3,"name":"Passport","status":1,"created_at":"2022-10-02T11:40:55.000000Z","updated_at":"2022-10-02T11:40:57.000000Z"}]

class DocumentTypeModel {
  DocumentTypeModel({
      this.data,});

  DocumentTypeModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DocumentTypeData.fromJson(v));
      });
    }
  }
  List<DocumentTypeData>? data;
DocumentTypeModel copyWith({  List<DocumentTypeData>? data,
}) => DocumentTypeModel(  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Citizen"
/// status : 1
/// created_at : "2022-10-02T11:39:42.000000Z"
/// updated_at : "2022-10-02T11:41:00.000000Z"

class DocumentTypeData {
  DocumentTypeData({
      this.id, 
      this.name, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  DocumentTypeData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;
DocumentTypeData copyWith({  int? id,
  String? name,
  int? status,
  String? createdAt,
  String? updatedAt,
}) => DocumentTypeData(  id: id ?? this.id,
  name: name ?? this.name,
  status: status ?? this.status,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}