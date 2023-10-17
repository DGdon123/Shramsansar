
import 'package:lmiis/models/ResponsModels/ViewAllJobsModel.dart';
import 'ViewAllTrainingsModel.dart';

/// data : {"id":1,"name":"ESSP","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"ईटहरी उपमहानगरपालिका","ward":"10","type":1,"type_name":"ESP","phone":"1234567890","mobile":"1234567890","email":"essp@youngminds.com.np","website":"1234567890","description":"<p>ESSP Details</p>","logo":"/medias/default_2022_08_14_09_00_40.png"}
/// jobs : [{"id":12,"service_provider_name":"ESSP","title":"Videographer","position_type":"Part Time","category_name":"कैमरामैन","openings":"4","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"दुहवी नगरपालिका","ward":5,"address":"Duhabi","deadline":"2079-4-17","eng_deadline":"2022-08-02","description":"<p>test</p>","specification":"<p>test</p>","salary_min":"18000","salary_max":"25000","required_experience":"test","required_education":"test","disclose_org_address":0,"organization":{"id":2,"name":"Avani advertisement","pradesh_name":"बागमती प्रदेश","district_name":"दोलखा","muni_name":"जिरी नगरपालिका","ward":1,"address":"Dolakha","email":"Avani@advertisement.com","contact_number":"9876543999"},"serviceProvider":{"id":1,"name":"ESSP","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"ईटहरी उपमहानगरपालिका","ward":"10","type":1,"type_name":"ESP","phone":"1234567890","mobile":"1234567890","email":"essp@youngminds.com.np","website":"1234567890","description":"<p>ESSP Details</p>","logo":"/medias/default_2022_08_14_09_00_40.png"}},{"id":3,"service_provider_name":"ESSP","title":"Housekeeper","position_type":"Part Time","category_name":"हाउसकीपिंग","openings":"25","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"दुहवी नगरपालिका","ward":3,"address":"Duhabi","deadline":"2079-5-4","eng_deadline":"2022-08-20","description":"<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\">This is content for jobs or trainings</span></span></p>","specification":"<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,sans-serif\">This is content for jobs or trainings</span></span></p>","salary_min":"10000","salary_max":"20000","required_experience":"6 Months","required_education":"SLC","disclose_org_address":0,"organization":{"id":1,"name":"women foundation nepal","pradesh_name":"लुम्बिनी प्रदेश","district_name":"दाङ्ग","muni_name":"तुल्सीपुर उपमहानगरपालिका","ward":4,"address":"Daang","email":"women@gmail.com","contact_number":"9876548666"},"serviceProvider":{"id":1,"name":"ESSP","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"ईटहरी उपमहानगरपालिका","ward":"10","type":1,"type_name":"ESP","phone":"1234567890","mobile":"1234567890","email":"essp@youngminds.com.np","website":"1234567890","description":"<p>ESSP Details</p>","logo":"/medias/default_2022_08_14_09_00_40.png"}}]
/// trainings : [{"id":8,"service_provider_name":"ESSP","title":"ऑफ-सीजन वेजिटेबल प्रोडूसर, रिवाइज्ड","no_of_participant":12,"start_date":"2079-5-1","start_time":"16:02","end_date":"2079-5-14","eng_end_date":"2022-08-30","end_time":"17:03","category_name":"वूल प्रोसेस्सर, २००८","description":"<p>test</p>","pradesh_name":"प्रदेश नं. १","district_name":"खोटाँग","muni_name":"साकेला गाउँपालिका","ward":"10","serviceProvider":{"id":1,"name":"ESSP","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"ईटहरी उपमहानगरपालिका","ward":"10","type":1,"type_name":"ESP","phone":"1234567890","mobile":"1234567890","email":"essp@youngminds.com.np","website":"1234567890","description":"<p>ESSP Details</p>","logo":"/medias/default_2022_08_14_09_00_40.png"}},{"id":4,"service_provider_name":"ESSP","title":"व्यवसायिक गाइ पालन तालिम","no_of_participant":15,"start_date":"2079-1-1","start_time":"15:05","end_date":"2080-1-26","eng_end_date":"2023-05-09","end_time":"16:06","category_name":"डेरी प्रोडक्ट/स्वीट्स मेकर, २००८","description":"<p>उक्त तालिम तालिम ७ दिनको हुन्छउक्त तालिम तालिम ७ दिनको हुन्छउक्त तालिम तालिम ७ दिनको हुन्छउक्त तालिम तालिम ७ दिनको हुन्छउक्त तालिम तालिम ७ दिनको हुन्छ</p>","pradesh_name":"प्रदेश नं. १","district_name":"मोरङ","muni_name":"विराटनगर महानगरपालिका","ward":"10","serviceProvider":{"id":1,"name":"ESSP","pradesh_name":"प्रदेश नं. १","district_name":"सुनसरि","muni_name":"ईटहरी उपमहानगरपालिका","ward":"10","type":1,"type_name":"ESP","phone":"1234567890","mobile":"1234567890","email":"essp@youngminds.com.np","website":"essp@youngminds.com.np","description":"<p>ESSP Details</p>","logo":"/medias/default_2022_08_14_09_00_40.png"}}]

class EsspServiceDetailsModel {
  EsspServiceDetailsModel({
      this.data, 
      this.jobs, 
      this.trainings,});

  EsspServiceDetailsModel.fromJson(dynamic json) {
    data = json['data'] != null ? EsspServiceDetailsData.fromJson(json['data']) : null;
    if (json['jobs'] != null) {
      jobs = [];
      json['jobs'].forEach((v) {
        jobs?.add(ViewAllJobsData.fromJson(v));
      });
    }
    if (json['trainings'] != null) {
      trainings = [];
      json['trainings'].forEach((v) {
        trainings?.add(ViewAllTrainingsData.fromJson(v));
      });
    }
  }
  EsspServiceDetailsData? data;
  List<ViewAllJobsData>? jobs;
  List<ViewAllTrainingsData>? trainings;
EsspServiceDetailsModel copyWith({  EsspServiceDetailsData? data,
  List<ViewAllJobsData>? jobs,
  List<ViewAllTrainingsData>? trainings,
}) => EsspServiceDetailsModel(  data: data ?? this.data,
  jobs: jobs ?? this.jobs,
  trainings: trainings ?? this.trainings,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (jobs != null) {
      map['jobs'] = jobs?.map((v) => v.toJson()).toList();
    }
    if (trainings != null) {
      map['trainings'] = trainings?.map((v) => v.toJson()).toList();
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
/// phone : "1234567890"
/// mobile : "1234567890"
/// email : "essp@youngminds.com.np"
/// website : "1234567890"
/// description : "<p>ESSP Details</p>"
/// logo : "/medias/default_2022_08_14_09_00_40.png"

class EsspServiceDetailsData {
  EsspServiceDetailsData({
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

  EsspServiceDetailsData.fromJson(dynamic json) {
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
EsspServiceDetailsData copyWith({  num? id,
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
}) => EsspServiceDetailsData(  id: id ?? this.id,
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