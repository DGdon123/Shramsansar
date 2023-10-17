/// data : [{"id":22,"name":"कुक"},{"id":21,"name":"प्लम्बर"},{"id":20,"name":"क्लीनर"},{"id":19,"name":"सिक्योरिटी गार्ड"},{"id":18,"name":"डिलीवरी पर्सन"},{"id":17,"name":"मार्केटिंग"},{"id":16,"name":"कंस्ट्रंक्शन लेबर"},{"id":15,"name":"लेबर"},{"id":14,"name":"किचन हेल्पर"},{"id":13,"name":"ड्राइवर"},{"id":12,"name":"ड्राइवर हेल्पर"},{"id":11,"name":"वेटर"},{"id":10,"name":"ऑफिस असिस्टेंस"},{"id":9,"name":"अकाउंटेंट"},{"id":8,"name":"बेल्ल बॉय"},{"id":7,"name":"शेफ"},{"id":6,"name":"फार्म हेल्पर"},{"id":5,"name":"रिसेप्शनिस्ट"},{"id":4,"name":"केशियर"},{"id":3,"name":"ऑफिस रनर"},{"id":2,"name":"स्टोर कीपर"},{"id":1,"name":"ऑफिस मैसेंजर"}]

class SkilsModel {
  SkilsModel({
      this.data,});

  SkilsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SkilsData.fromJson(v));
      });
    }
  }
  List<SkilsData>? data;
SkilsModel copyWith({
  List<SkilsData>? data,
}) => SkilsModel(  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 22
/// name : "कुक"

class SkilsData {
  SkilsData({
      this.id, 
      this.name,});

  SkilsData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;
SkilsData copyWith({  int? id,
  String? name,
}) => SkilsData(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}