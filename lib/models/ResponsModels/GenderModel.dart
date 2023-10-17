/// data : [{"id":1,"gender":"पुरुष"},{"id":2,"gender":"महिला"},{"id":3,"gender":"अन्य"}]

class GenderModel {
  GenderModel({
      this.data,});

  GenderModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GenderData.fromJson(v));
      });
    }
  }
  List<GenderData>? data;
GenderModel copyWith({  List<GenderData>? data,
}) => GenderModel(  data: data ?? this.data,
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
/// gender : "पुरुष"

class GenderData {
  GenderData({
      this.id, 
      this.gender,});

  GenderData.fromJson(dynamic json) {
    id = json['id'];
    gender = json['gender'];
  }
  int? id;
  String? gender;
GenderData copyWith({  int? id,
  String? gender,
}) => GenderData(  id: id ?? this.id,
  gender: gender ?? this.gender,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['gender'] = gender;
    return map;
  }

}