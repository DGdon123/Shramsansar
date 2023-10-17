/// data : [{"id":1,"name":"प्रदेश नं. १"},{"id":2,"name":"मधेश प्रदेश"},{"id":3,"name":"बागमती प्रदेश"},{"id":4,"name":"गण्डकी प्रदेश"},{"id":5,"name":"लुम्बिनी प्रदेश"},{"id":6,"name":"कर्णाली प्रदेश"},{"id":7,"name":"सुदूर-पश्चिम प्रदेश"}]

class PradeshModel {
  PradeshModel({
      this.data,});

  PradeshModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(PradeshData.fromJson(v));
      });
    }
  }
  List<PradeshData>? data;
PradeshModel copyWith({  List<PradeshData>? data,
}) => PradeshModel(  data: data ?? this.data,
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
/// name : "प्रदेश नं. १"

class PradeshData {
  PradeshData({
      this.id, 
      this.name,});

  PradeshData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;
PradeshData copyWith({  int? id,
  String? name,
}) => PradeshData(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}