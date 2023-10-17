/// data : {"id":8,"service_provider_name":"ESSP","title":"ऑफ-सीजन वेजिटेबल प्रोडूसर, रिवाइज्ड","no_of_participant":12,"start_date":"2079-5-1","start_time":"16:02","end_date":"2079-5-14","eng_end_date":"2022-08-30","end_time":"17:03","category_name":"वूल प्रोसेस्सर, २००८","description":"<p>test</p>","pradesh_name":"प्रदेश नं. १","district_name":"खोटाँग","muni_name":"साकेला गाउँपालिका","ward":"10","serviceProvider":{"id":1,"name":"ESSP","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"ईटहरी उपमहानगरपालिका","ward":"10","type":1,"type_name":"ESP","phone":null,"mobile":"1234567890","email":"essp@youngminds.com.np","website":null,"description":"<p>ESSP Details</p>","logo":"/medias/default_2022_08_14_09_00_40.png"}}

class SingleTraningModel {
  SingleTraningModel({
      this.data,
    this.isApplied,
  });

  SingleTraningModel.fromJson(dynamic json) {
    data = json['data'] != null ? SingleTraningData.fromJson(json['data']) : null;
    isApplied = json['isApplied'];
  }
  SingleTraningData? data;
  bool? isApplied;
SingleTraningModel copyWith({  SingleTraningData? data,
}) => SingleTraningModel(  data: data ?? this.data,
  isApplied: isApplied ?? this.isApplied,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();

    }
    map['isApplied'] = isApplied;
    return map;
  }

}

/// id : 8
/// service_provider_name : "ESSP"
/// title : "ऑफ-सीजन वेजिटेबल प्रोडूसर, रिवाइज्ड"
/// no_of_participant : 12
/// start_date : "2079-5-1"
/// start_time : "16:02"
/// end_date : "2079-5-14"
/// eng_end_date : "2022-08-30"
/// end_time : "17:03"
/// category_name : "वूल प्रोसेस्सर, २००८"
/// description : "<p>test</p>"
/// pradesh_name : "प्रदेश नं. १"
/// district_name : "खोटाँग"
/// muni_name : "साकेला गाउँपालिका"
/// ward : "10"
/// serviceProvider : {"id":1,"name":"ESSP","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"ईटहरी उपमहानगरपालिका","ward":"10","type":1,"type_name":"ESP","phone":null,"mobile":"1234567890","email":"essp@youngminds.com.np","website":null,"description":"<p>ESSP Details</p>","logo":"/medias/default_2022_08_14_09_00_40.png"}

class SingleTraningData {
  SingleTraningData({
      this.id, 
      this.serviceProviderName, 
      this.title, 
      this.noOfParticipant, 
      this.startDate, 
      this.startTime, 
      this.endDate, 
      this.engEndDate, 
      this.endTime, 
      this.categoryName, 
      this.description, 
      this.pradeshName, 
      this.districtName, 
      this.muniName, 
      this.ward, 
      this.serviceProvider,});

  SingleTraningData.fromJson(dynamic json) {
    id = json['id'];
    serviceProviderName = json['service_provider_name'];
    title = json['title'];
    noOfParticipant = json['no_of_participant'];
    startDate = json['start_date'];
    startTime = json['start_time'];
    endDate = json['end_date'];
    engEndDate = json['eng_end_date'];
    endTime = json['end_time'];
    categoryName = json['category_name'];
    description = json['description'];
    pradeshName = json['pradesh_name'];
    districtName = json['district_name'];
    muniName = json['muni_name'];
    ward = json['ward'];
    serviceProvider = json['serviceProvider'] != null ? ServiceProvider.fromJson(json['serviceProvider']) : null;
  }
  int? id;
  String? serviceProviderName;
  String? title;
  int? noOfParticipant;
  String? startDate;
  String? startTime;
  String? endDate;
  String? engEndDate;
  String? endTime;
  String? categoryName;
  String? description;
  String? pradeshName;
  String? districtName;
  String? muniName;
  String? ward;
  ServiceProvider? serviceProvider;
SingleTraningData copyWith({  int? id,
  String? serviceProviderName,
  String? title,
  int? noOfParticipant,
  String? startDate,
  String? startTime,
  String? endDate,
  String? engEndDate,
  String? endTime,
  String? categoryName,
  String? description,
  String? pradeshName,
  String? districtName,
  String? muniName,
  String? ward,
  ServiceProvider? serviceProvider,
}) => SingleTraningData(  id: id ?? this.id,
  serviceProviderName: serviceProviderName ?? this.serviceProviderName,
  title: title ?? this.title,
  noOfParticipant: noOfParticipant ?? this.noOfParticipant,
  startDate: startDate ?? this.startDate,
  startTime: startTime ?? this.startTime,
  endDate: endDate ?? this.endDate,
  engEndDate: engEndDate ?? this.engEndDate,
  endTime: endTime ?? this.endTime,
  categoryName: categoryName ?? this.categoryName,
  description: description ?? this.description,
  pradeshName: pradeshName ?? this.pradeshName,
  districtName: districtName ?? this.districtName,
  muniName: muniName ?? this.muniName,
  ward: ward ?? this.ward,
  serviceProvider: serviceProvider ?? this.serviceProvider,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['service_provider_name'] = serviceProviderName;
    map['title'] = title;
    map['no_of_participant'] = noOfParticipant;
    map['start_date'] = startDate;
    map['start_time'] = startTime;
    map['end_date'] = endDate;
    map['eng_end_date'] = engEndDate;
    map['end_time'] = endTime;
    map['category_name'] = categoryName;
    map['description'] = description;
    map['pradesh_name'] = pradeshName;
    map['district_name'] = districtName;
    map['muni_name'] = muniName;
    map['ward'] = ward;
    if (serviceProvider != null) {
      map['serviceProvider'] = serviceProvider?.toJson();
    }
    return map;
  }

}

/// id : 1
/// name : "ESSP"
/// pradesh_name : "प्रदेश नं. १"
/// district_name : "सुनसरि"
/// muni_name : "ईटहरी उपमहानगरपालिका"
/// ward : "10"
/// type : 1
/// type_name : "ESP"
/// phone : null
/// mobile : "1234567890"
/// email : "essp@youngminds.com.np"
/// website : null
/// description : "<p>ESSP Details</p>"
/// logo : "/medias/default_2022_08_14_09_00_40.png"

class ServiceProvider {
  ServiceProvider({
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
      this.logo,
      this.isApplied,

  });

  ServiceProvider.fromJson(dynamic json) {
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
    isApplied = json['isApplied'];
  }
  int? id;
  String? name;
  String? pradeshName;
  String? districtName;
  String? muniName;
  String? ward;
  int? type;
  String? typeName;
  dynamic phone;
  String? mobile;
  String? email;
  dynamic website;
  String? description;
  String? logo;
  bool? isApplied;
ServiceProvider copyWith({  int? id,
  String? name,
  String? pradeshName,
  String? districtName,
  String? muniName,
  String? ward,
  int? type,
  String? typeName,
  dynamic phone,
  String? mobile,
  String? email,
  dynamic website,
  String? description,
  String? logo,
  bool? isApplied,
}) => ServiceProvider(  id: id ?? this.id,
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
  isApplied: isApplied ?? this.isApplied,
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
    map['isApplied'] = isApplied;
    return map;
  }

}