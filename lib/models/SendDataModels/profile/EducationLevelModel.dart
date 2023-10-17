/// data : [{"id":1,"name":"डाक्टरेट"},{"id":2,"name":"मास्टर"},{"id":3,"name":"स्नातक"},{"id":4,"name":"उच्च माध्यमिक शिक्षा"},{"id":5,"name":"माध्यमिक शिक्षा"},{"id":6,"name":"मध्य शिक्षा"},{"id":7,"name":"प्राथमिक शिक्षा"}]

class EducationLevelModel {
  EducationLevelModel({
      this.data,});

  EducationLevelModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(EducationLevelData.fromJson(v));
      });
    }
  }
  List<EducationLevelData>? data;
EducationLevelModel copyWith({  List<EducationLevelData>? data,
}) => EducationLevelModel(  data: data ?? this.data,
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
/// name : "डाक्टरेट"

class EducationLevelData {
  EducationLevelData({
      this.id, 
      this.name,});

  EducationLevelData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;
EducationLevelData copyWith({  int? id,
  String? name,
}) => EducationLevelData(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}