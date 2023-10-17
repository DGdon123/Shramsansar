/// data : [{"id":1,"name":"LinkedIn"},{"id":2,"name":"YouTube"},{"id":3,"name":"Twitter"},{"id":4,"name":"Instagram"}]

class SocialNameModel {
  SocialNameModel({
      this.data,});

  SocialNameModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SocialNameData.fromJson(v));
      });
    }
  }
  List<SocialNameData>? data;
SocialNameModel copyWith({  List<SocialNameData>? data,
}) => SocialNameModel(  data: data ?? this.data,
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
/// name : "LinkedIn"

class SocialNameData {
  SocialNameData({
      this.id, 
      this.name,});

  SocialNameData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
SocialNameData copyWith({  num? id,
  String? name,
}) => SocialNameData(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}