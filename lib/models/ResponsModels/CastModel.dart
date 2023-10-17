/// data : [{"id":1,"name":"यादव"},{"id":2,"name":"मुस्लिम"},{"id":3,"name":"कामी"},{"id":4,"name":"नेवार"},{"id":5,"name":"तामाङ"},{"id":6,"name":"मगर"},{"id":7,"name":"ब्राह्मण पहाड"}]

class CastModel {
  CastModel({
      this.data,});

  CastModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CastData.fromJson(v));
      });
    }
  }
  List<CastData>? data;
CastModel copyWith({  List<CastData>? data,
}) => CastModel(  data: data ?? this.data,
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
/// name : "यादव"

class CastData {
  CastData({
      this.id, 
      this.name,});

  CastData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;
CastData copyWith({  int? id,
  String? name,
}) => CastData(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}