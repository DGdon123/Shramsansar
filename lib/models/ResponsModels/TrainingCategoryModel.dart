/// data : [{"id":21,"name":"डेरी प्रोडक्ट/स्वीट्स मेकर, २००८","status":1},{"id":20,"name":"कम्युनिटी लिव्स्टक् असिस्टेन्ट रिवाइज्ड, २०७२","status":1},{"id":19,"name":"वूल प्रोसेस्सर, २००८","status":1},{"id":18,"name":"स्लदर हाउस टेक्निसियन, २०१०","status":1},{"id":17,"name":"भिलेज एनिमल हेल्थ् वर्कर, रिवाइज्ड २०६९","status":1},{"id":16,"name":"पाेल्ट्रि फार्म वर्कर्, २०६९","status":1},{"id":15,"name":"कम्युनिटी लिव्स्टक् असिस्टेन्ट टेक्निसियन, २०७१","status":1},{"id":14,"name":"जुनियर डेयरी टेक्निसियन (मोड्युलर), संशोधित २००७","status":1},{"id":13,"name":"गाेट किपर्, २०७०","status":1},{"id":12,"name":"सेरीकल्चर टेक्निकल वर्कर","status":1},{"id":11,"name":"नर्सरी एंड गार्डन असिस्टेंट, रिवाइज्ड २०१५","status":1},{"id":10,"name":"गार्डन डिज़ाइनर, रिवाइज्ड","status":1},{"id":9,"name":"फ्लावर डेकोरेटर रिवाइज्ड","status":1},{"id":8,"name":"फ्रूट प्रोसेसर, रिवाइज्ड","status":1},{"id":7,"name":"अल्लो प्रोसेसर","status":1},{"id":6,"name":"हर्ब प्रोसेसर","status":1},{"id":5,"name":"ऑफ-सीजन वेजिटेबल प्रोडूसर, रिवाइज्ड","status":1},{"id":4,"name":"बनाना फाइबर प्रोसेसर","status":1},{"id":3,"name":"असिस्टेंट टि टेक्निशन, रिवाइज्ड","status":1},{"id":2,"name":"असिस्टेंट कॉफ़ी टेक्निशन, रिवाइज्ड","status":1},{"id":1,"name":"कम्युनिटी एग्रीकल्चर असिस्टेंट","status":1}]

class TrainingCategoryModel {
  TrainingCategoryModel({
      this.data,});

  TrainingCategoryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(TrainingCategoryData.fromJson(v));
      });
    }
  }
  List<TrainingCategoryData>? data;
TrainingCategoryModel copyWith({  List<TrainingCategoryData>? data,
}) => TrainingCategoryModel(  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 21
/// name : "डेरी प्रोडक्ट/स्वीट्स मेकर, २००८"
/// status : 1

class TrainingCategoryData {
  TrainingCategoryData({
      this.id, 
      this.name, 
      this.status,});

  TrainingCategoryData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }
  int? id;
  String? name;
  int? status;
TrainingCategoryData copyWith({  int? id,
  String? name,
  int? status,
}) => TrainingCategoryData(  id: id ?? this.id,
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