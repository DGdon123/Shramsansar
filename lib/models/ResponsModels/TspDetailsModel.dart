import 'ViewAllTrainingsModel.dart';

/// data : {"id":2,"name":"TSP","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"धरान उपमहानगरपालिका","ward":"12","type":2,"type_name":"TSP","phone":"1234567890","mobile":"1234567890","email":"tsp@youngminds.com.np","website":"1234567890","description":"<p>TSP Details</p>","logo":"/medias/testtsp_2022_08_29_10_12_34.jpg"}
/// trainings : [{"id":3,"service_provider_name":"TSP","title":"हर्ब प्रोसेसर","no_of_participant":6,"start_date":"2079-2-2","start_time":"01:07","end_date":"2079-4-14","eng_end_date":"2022-07-30","end_time":"19:07","category_name":"हर्ब प्रोसेसर","description":"<p><strong>प्र. यस संस्थाले तालिम प्रदान गर्न थालेको कति समय पुरा भयो?&nbsp;</strong></p>\r\n\r\n<p>उ. १० वर्ष</p>","pradesh_name":"प्रदेश नं. १","district_name":"पाचथर","muni_name":"फालेलुङ गाउँपालिका","ward":"5","serviceProvider":{"id":2,"name":"TSP","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"धरान उपमहानगरपालिका","ward":"12","type":2,"type_name":"TSP","phone":"1234567890","mobile":"1234567890","email":"tsp@youngminds.com.np","website":"1234567890","description":"<p>TSP Details</p>","logo":"/medias/testtsp_2022_08_29_10_12_34.jpg"}},{"id":2,"service_provider_name":"TSP","title":"Dairy Product / Sweet Maker","no_of_participant":50,"start_date":"2079-1-26","start_time":"22:30","end_date":"2079-4-28","eng_end_date":"2022-08-13","end_time":"14:03","category_name":"डेरी प्रोडक्ट/स्वीट्स मेकर, २००८","description":"<p>Dairy Product Maker and Sweets Maker is designed to produce employable workforce equipped with knowledge, skills, and attitudes related to dairy product and sweets making occupation.</p>","pradesh_name":"प्रदेश नं. १","district_name":"मोरङ","muni_name":"विराटनगर महानगरपालिका","ward":"2","serviceProvider":{"id":2,"name":"TSP","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"धरान उपमहानगरपालिका","ward":"12","type":2,"type_name":"TSP","phone":"1234567890","mobile":"1234567890","email":"tsp@youngminds.com.np","website":"1234567890","description":"<p>TSP Details</p>","logo":"/medias/testtsp_2022_08_29_10_12_34.jpg"}},{"id":1,"service_provider_name":"TSP","title":"व्यवसायिक गाइ पालन तालिम","no_of_participant":15,"start_date":"2079-1-1","start_time":"15:05","end_date":"2080-1-2","eng_end_date":"2023-04-15","end_time":"16:06","category_name":"डेरी प्रोडक्ट/स्वीट्स मेकर, २००८","description":"<p>उक्त तालिम तालिम ७ दिनको हुन्छउक्त तालिम तालिम ७ दिनको हुन्छउक्त तालिम तालिम ७ दिनको हुन्छउक्त तालिम तालिम ७ दिनको हुन्छउक्त तालिम तालिम ७ दिनको हुन्छउक्त तालिम तालिम</p>","pradesh_name":"प्रदेश नं. १","district_name":"मोरङ","muni_name":"विराटनगर महानगरपालिका","ward":"10","serviceProvider":{"id":2,"name":"TSP","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"धरान उपमहानगरपालिका","ward":"12","type":2,"type_name":"TSP","phone":"1234567890","mobile":"1234567890","email":"tsp@youngminds.com.np","website":"1234567890","description":"<p>TSP Details</p>","logo":"/medias/testtsp_2022_08_29_10_12_34.jpg"}}]

class TspDetailsModel {
  TspDetailsModel({
      this.data, 
      this.trainings,});

  TspDetailsModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['trainings'] != null) {
      trainings = [];
      json['trainings'].forEach((v) {
        trainings?.add(ViewAllTrainingsData.fromJson(v));
      });
    }
  }
  Data? data;
  List<ViewAllTrainingsData>? trainings;
TspDetailsModel copyWith({  Data? data,
  List<ViewAllTrainingsData>? trainings,
}) => TspDetailsModel(  data: data ?? this.data,
  trainings: trainings ?? this.trainings,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (trainings != null) {
      map['trainings'] = trainings?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


/// id : 2
/// name : "TSP"
/// pradesh_name : "प्रदेश नं. १"
/// district_name : "सुनसरि"
/// muni_name : "धरान उपमहानगरपालिका"
/// ward : "12"
/// type : 2
/// type_name : "TSP"
/// phone : "1234567890"
/// mobile : "1234567890"
/// email : "tsp@youngminds.com.np"
/// website : "1234567890"
/// description : "<p>TSP Details</p>"
/// logo : "/medias/testtsp_2022_08_29_10_12_34.jpg"

class TspDetailsServiceProvider {
  TspDetailsServiceProvider({
      this.id, 
      this.name, 
      this.pradeshName, 
      this.districtName, 
      this.muniName, 
      this.ward, 
      this.type, 
      this.typeName, 
      this.phone, 
      this.mobile, 
      this.email, 
      this.website, 
      this.description, 
      this.logo,});

  TspDetailsServiceProvider.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    pradeshName = json['pradesh_name'];
    districtName = json['district_name'];
    muniName = json['muni_name'];
    ward = json['ward'];
    type = json['type'];
    typeName = json['type_name'];
    phone = json['phone'];
    mobile = json['mobile'];
    email = json['email'];
    website = json['website'];
    description = json['description'];
    logo = json['logo'];
  }
  num? id;
  String? name;
  String? pradeshName;
  String? districtName;
  String? muniName;
  String? ward;
  num? type;
  String? typeName;
  String? phone;
  String? mobile;
  String? email;
  String? website;
  String? description;
  String? logo;
TspDetailsServiceProvider copyWith({  num? id,
  String? name,
  String? pradeshName,
  String? districtName,
  String? muniName,
  String? ward,
  num? type,
  String? typeName,
  String? phone,
  String? mobile,
  String? email,
  String? website,
  String? description,
  String? logo,
}) => TspDetailsServiceProvider(  id: id ?? this.id,
  name: name ?? this.name,
  pradeshName: pradeshName ?? this.pradeshName,
  districtName: districtName ?? this.districtName,
  muniName: muniName ?? this.muniName,
  ward: ward ?? this.ward,
  type: type ?? this.type,
  typeName: typeName ?? this.typeName,
  phone: phone ?? this.phone,
  mobile: mobile ?? this.mobile,
  email: email ?? this.email,
  website: website ?? this.website,
  description: description ?? this.description,
  logo: logo ?? this.logo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['pradesh_name'] = pradeshName;
    map['district_name'] = districtName;
    map['muni_name'] = muniName;
    map['ward'] = ward;
    map['type'] = type;
    map['type_name'] = typeName;
    map['phone'] = phone;
    map['mobile'] = mobile;
    map['email'] = email;
    map['website'] = website;
    map['description'] = description;
    map['logo'] = logo;
    return map;
  }

}

/// id : 2
/// name : "TSP"
/// pradesh_name : "प्रदेश नं. १"
/// district_name : "सुनसरि"
/// muni_name : "धरान उपमहानगरपालिका"
/// ward : "12"
/// type : 2
/// type_name : "TSP"
/// phone : "1234567890"
/// mobile : "1234567890"
/// email : "tsp@youngminds.com.np"
/// website : "1234567890"
/// description : "<p>TSP Details</p>"
/// logo : "/medias/testtsp_2022_08_29_10_12_34.jpg"

class Data {
  Data({
      this.id, 
      this.name, 
      this.pradeshName, 
      this.districtName, 
      this.muniName, 
      this.ward, 
      this.type, 
      this.typeName, 
      this.phone, 
      this.mobile, 
      this.email, 
      this.website, 
      this.description, 
      this.logo,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    pradeshName = json['pradesh_name'];
    districtName = json['district_name'];
    muniName = json['muni_name'];
    ward = json['ward'];
    type = json['type'];
    typeName = json['type_name'];
    phone = json['phone'];
    mobile = json['mobile'];
    email = json['email'];
    website = json['website'];
    description = json['description'];
    logo = json['logo'];
  }
  num? id;
  String? name;
  String? pradeshName;
  String? districtName;
  String? muniName;
  String? ward;
  num? type;
  String? typeName;
  String? phone;
  String? mobile;
  String? email;
  String? website;
  String? description;
  String? logo;
Data copyWith({  num? id,
  String? name,
  String? pradeshName,
  String? districtName,
  String? muniName,
  String? ward,
  num? type,
  String? typeName,
  String? phone,
  String? mobile,
  String? email,
  String? website,
  String? description,
  String? logo,
}) => Data(  id: id ?? this.id,
  name: name ?? this.name,
  pradeshName: pradeshName ?? this.pradeshName,
  districtName: districtName ?? this.districtName,
  muniName: muniName ?? this.muniName,
  ward: ward ?? this.ward,
  type: type ?? this.type,
  typeName: typeName ?? this.typeName,
  phone: phone ?? this.phone,
  mobile: mobile ?? this.mobile,
  email: email ?? this.email,
  website: website ?? this.website,
  description: description ?? this.description,
  logo: logo ?? this.logo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['pradesh_name'] = pradeshName;
    map['district_name'] = districtName;
    map['muni_name'] = muniName;
    map['ward'] = ward;
    map['type'] = type;
    map['type_name'] = typeName;
    map['phone'] = phone;
    map['mobile'] = mobile;
    map['email'] = email;
    map['website'] = website;
    map['description'] = description;
    map['logo'] = logo;
    return map;
  }

}