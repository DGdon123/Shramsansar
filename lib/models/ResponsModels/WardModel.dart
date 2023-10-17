/// data : [{"id":1,"ward_no":"1"},{"id":2,"ward_no":"2"},{"id":3,"ward_no":"3"},{"id":4,"ward_no":"4"},{"id":5,"ward_no":"5"},{"id":6,"ward_no":"6"},{"id":7,"ward_no":"7"},{"id":8,"ward_no":"8"},{"id":9,"ward_no":"9"},{"id":10,"ward_no":"10"},{"id":11,"ward_no":"11"},{"id":12,"ward_no":"12"},{"id":13,"ward_no":"13"},{"id":14,"ward_no":"14"},{"id":15,"ward_no":"15"},{"id":16,"ward_no":"16"},{"id":17,"ward_no":"17"},{"id":18,"ward_no":"18"},{"id":19,"ward_no":"19"},{"id":20,"ward_no":"20"},{"id":21,"ward_no":"21"},{"id":22,"ward_no":"22"},{"id":23,"ward_no":"23"},{"id":24,"ward_no":"24"},{"id":25,"ward_no":"25"},{"id":26,"ward_no":"26"},{"id":27,"ward_no":"27"},{"id":28,"ward_no":"28"},{"id":29,"ward_no":"29"},{"id":30,"ward_no":"30"},{"id":31,"ward_no":"31"},{"id":32,"ward_no":"32"},{"id":33,"ward_no":"33"},{"id":34,"ward_no":"34"},{"id":35,"ward_no":"35"}]

class WardModel {
  WardModel({
      this.data,});

  WardModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(WardData.fromJson(v));
      });
    }
  }
  List<WardData>? data;
WardModel copyWith({  List<WardData>? data,
}) => WardModel(  data: data ?? this.data,
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
/// ward_no : "1"

class WardData {
  WardData({
      this.id, 
      this.wardNo,});

  WardData.fromJson(dynamic json) {
    id = json['id'];
    wardNo = json['ward_no'];
  }
  int? id;
  String? wardNo;
WardData copyWith({  int? id,
  String? wardNo,
}) => WardData(  id: id ?? this.id,
  wardNo: wardNo ?? this.wardNo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['ward_no'] = wardNo;
    return map;
  }

}