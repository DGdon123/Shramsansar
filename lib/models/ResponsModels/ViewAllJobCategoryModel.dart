/// data : [{"id":15,"name":"मार्केटिंग ऑफिसर","status":1},{"id":14,"name":"शेफ","status":1},{"id":13,"name":"किचन हेल्पर","status":1},{"id":12,"name":"बेल बोय","status":1},{"id":11,"name":"बरिस्ता","status":1},{"id":10,"name":"हैवी ड्राइवर","status":1},{"id":9,"name":"ऑफिस असिस्टेंट","status":1},{"id":8,"name":"सिक्योरिटी गार्ड","status":1},{"id":7,"name":"कंप्यूटर ऑपरेटर","status":1},{"id":6,"name":"ग्राफ़िक डिज़ाइनर","status":1},{"id":5,"name":"व्हीकल ऑपरेटर","status":1},{"id":4,"name":"बेकर","status":1},{"id":3,"name":"कैमरामैन","status":1},{"id":2,"name":"ऑउटडोर्स सेल्स बोय","status":1},{"id":1,"name":"हाउसकीपिंग","status":1}]

class ViewAllJobCategoryModel {
  ViewAllJobCategoryModel({
      this.data,});

  ViewAllJobCategoryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ViewAllJobCategoryData.fromJson(v));
      });
    }
  }
  List<ViewAllJobCategoryData>? data;
ViewAllJobCategoryModel copyWith({  List<ViewAllJobCategoryData>? data,
}) => ViewAllJobCategoryModel(  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 15
/// name : "मार्केटिंग ऑफिसर"
/// status : 1

class ViewAllJobCategoryData {
  ViewAllJobCategoryData({
      this.id, 
      this.name, 
      this.status,});

  ViewAllJobCategoryData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }
  int? id;
  String? name;
  int? status;
ViewAllJobCategoryData copyWith({  int? id,
  String? name,
  int? status,
}) => ViewAllJobCategoryData(  id: id ?? this.id,
  name: name ?? this.name,
  status: status ?? this.status,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['status'] = status;
    return map;
  }

}