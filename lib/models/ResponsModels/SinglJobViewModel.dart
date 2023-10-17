
class SinglJobViewModel {
  SinglJobViewModel({
      this.data,
    this.isApplied,
  });

  SinglJobViewModel.fromJson(dynamic json) {
    data = json['data'] != null ? SinglJobViewData.fromJson(json['data']) : null;
    isApplied = json['isApplied'];
  }
  SinglJobViewData? data;
  bool? isApplied;
SinglJobViewModel copyWith({  SinglJobViewData? data,
}) => SinglJobViewModel(  data: data ?? this.data,
  isApplied: isApplied ?? this.isApplied,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
      map['isApplied'] = isApplied;
    }
    return map;
  }

}

class SinglJobViewData {
  SinglJobViewData({
      this.id, 
      this.serviceProviderName, 
      this.title, 
      this.positionType, 
      this.categoryName, 
      this.openings, 
      this.pradeshName, 
      this.districtName, 
      this.muniName, 
      this.ward, 
      this.address, 
      this.deadline, 
      this.engDeadline, 
      this.description, 
      this.specification, 
      this.salaryMin, 
      this.salaryMax, 
      this.requiredExperience, 
      this.requiredEducation, 
      this.discloseOrgAddress, 
      this.organization, 
      this.serviceProvider,
      this.isApplied,

  });

  SinglJobViewData.fromJson(dynamic json) {
    id = json['id'];
    serviceProviderName = json['service_provider_name'];
    title = json['title'];
    positionType = json['position_type'];
    categoryName = json['category_name'];
    openings = json['openings'];
    pradeshName = json['pradesh_name'];
    districtName = json['district_name'];
    muniName = json['muni_name'];
    ward = json['ward'];
    address = json['address'];
    deadline = json['deadline'];
    engDeadline = json['eng_deadline'];
    description = json['description'];
    specification = json['specification'];
    salaryMin = json['salary_min'];
    salaryMax = json['salary_max'];
    requiredExperience = json['required_experience'];
    requiredEducation = json['required_education'];
    discloseOrgAddress = json['disclose_org_address'];
    isApplied = json['isApplied'];
    organization = json['organization'] != null ? Organization.fromJson(json['organization']) : null;
    serviceProvider = json['serviceProvider'] != null ? ServiceProvider.fromJson(json['serviceProvider']) : null;
  }
  int? id;
  String? serviceProviderName;
  String? title;
  String? positionType;
  String? categoryName;
  String? openings;
  String? pradeshName;
  String? districtName;
  String? muniName;
  int? ward;
  String? address;
  String? deadline;
  String? engDeadline;
  String? description;
  String? specification;
  String? salaryMin;
  String? salaryMax;
  String? requiredExperience;
  String? requiredEducation;
  int? discloseOrgAddress;
  Organization? organization;
  ServiceProvider? serviceProvider;
  bool? isApplied;
SinglJobViewData copyWith({  int? id,
  String? serviceProviderName,
  String? title,
  String? positionType,
  String? categoryName,
  String? openings,
  String? pradeshName,
  String? districtName,
  String? muniName,
  int? ward,
  String? address,
  String? deadline,
  String? engDeadline,
  String? description,
  String? specification,
  String? salaryMin,
  String? salaryMax,
  String? requiredExperience,
  String? requiredEducation,
  int? discloseOrgAddress,
  Organization? organization,
  ServiceProvider? serviceProvider,
  bool? isApplied,
}) => SinglJobViewData(  id: id ?? this.id,
  serviceProviderName: serviceProviderName ?? this.serviceProviderName,
  title: title ?? this.title,
  positionType: positionType ?? this.positionType,
  categoryName: categoryName ?? this.categoryName,
  openings: openings ?? this.openings,
  pradeshName: pradeshName ?? this.pradeshName,
  districtName: districtName ?? this.districtName,
  muniName: muniName ?? this.muniName,
  ward: ward ?? this.ward,
  address: address ?? this.address,
  deadline: deadline ?? this.deadline,
  engDeadline: engDeadline ?? this.engDeadline,
  description: description ?? this.description,
  specification: specification ?? this.specification,
  salaryMin: salaryMin ?? this.salaryMin,
  salaryMax: salaryMax ?? this.salaryMax,
  requiredExperience: requiredExperience ?? this.requiredExperience,
  requiredEducation: requiredEducation ?? this.requiredEducation,
  discloseOrgAddress: discloseOrgAddress ?? this.discloseOrgAddress,
  organization: organization ?? this.organization,
  serviceProvider: serviceProvider ?? this.serviceProvider,
  isApplied: isApplied ?? this.isApplied,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['service_provider_name'] = serviceProviderName;
    map['title'] = title;
    map['position_type'] = positionType;
    map['category_name'] = categoryName;
    map['openings'] = openings;
    map['pradesh_name'] = pradeshName;
    map['district_name'] = districtName;
    map['muni_name'] = muniName;
    map['ward'] = ward;
    map['address'] = address;
    map['deadline'] = deadline;
    map['eng_deadline'] = engDeadline;
    map['description'] = description;
    map['specification'] = specification;
    map['salary_min'] = salaryMin;
    map['salary_max'] = salaryMax;
    map['required_experience'] = requiredExperience;
    map['required_education'] = requiredEducation;
    map['disclose_org_address'] = discloseOrgAddress;
    map['isApplied'] = isApplied;
    if (organization != null) {
      map['organization'] = organization?.toJson();
    }
    if (serviceProvider != null) {
      map['serviceProvider'] = serviceProvider?.toJson();
    }
    return map;
  }

}

/// id : 4
/// name : "Association"
/// pradesh_name : "प्रदेश नं. १"
/// district_name : "मोरङ"
/// muni_name : "विराटनगर महानगरपालिका"
/// ward : "10"
/// type : 4
/// type_name : "Association"
/// phone : null
/// mobile : "9842706855"
/// email : "association@youngminds.com.np"
/// website : null
/// description : "<p>Association Details</p>"
/// logo : "/medias/download1_2022_09_05_11_09_03.png"

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
  String? phone;
  String? mobile;
  String? email;
  String? website;
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
  String? phone,
  String? mobile,
  String? email,
  String? website,
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

/// id : 3
/// name : "Airlines Operators Association of Nepal"
/// pradesh_name : "बागमती प्रदेश"
/// district_name : "ललितपुर"
/// muni_name : "ललितपुर महानगरपालिका"
/// ward : 1
/// address : "Lalitpur"
/// email : "airlines@gmail.com"
/// contact_number : "9876541668"

class Organization {
  Organization({
      this.id, 
      this.name, 
      this.pradeshName, 
      this.districtName, 
      this.muniName, 
      this.ward, 
      this.address, 
      this.email, 
      this.contactNumber,});

  Organization.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    pradeshName = json['pradesh_name'];
    districtName = json['district_name'];
    muniName = json['muni_name'];
    ward = json['ward'];
    address = json['address'];
    email = json['email'];
    contactNumber = json['contact_number'];
  }
  int? id;
  String? name;
  String? pradeshName;
  String? districtName;
  String? muniName;
  int? ward;
  String? address;
  String? email;
  String? contactNumber;
Organization copyWith({  int? id,
  String? name,
  String? pradeshName,
  String? districtName,
  String? muniName,
  int? ward,
  String? address,
  String? email,
  String? contactNumber,
}) => Organization(  id: id ?? this.id,
  name: name ?? this.name,
  pradeshName: pradeshName ?? this.pradeshName,
  districtName: districtName ?? this.districtName,
  muniName: muniName ?? this.muniName,
  ward: ward ?? this.ward,
  address: address ?? this.address,
  email: email ?? this.email,
  contactNumber: contactNumber ?? this.contactNumber,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['pradesh_name'] = pradeshName;
    map['district_name'] = districtName;
    map['muni_name'] = muniName;
    map['ward'] = ward;
    map['address'] = address;
    map['email'] = email;
    map['contact_number'] = contactNumber;
    return map;
  }

}