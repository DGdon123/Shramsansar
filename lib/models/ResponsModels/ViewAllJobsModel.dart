
class ViewAllJobsModel {
  ViewAllJobsModel({
      this.data, 
      this.links, 
      this.meta,});

  ViewAllJobsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ViewAllJobsData.fromJson(v));
      });
    }
    links = json['links'] != null ? Meta.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<ViewAllJobsData>? data;
  Meta? links;
  Meta? meta;
ViewAllJobsModel copyWith({  List<ViewAllJobsData>? data,
  Meta? links,
  Meta? meta,
}) => ViewAllJobsModel(  data: data ?? this.data,
  links: links ?? this.links,
  meta: meta ?? this.meta,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      map['links'] = links?.toJson();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }

}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,});

  Meta.fromJson(dynamic json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = [];
      json['links'].forEach((v) {
        links?.add(LinksMeta.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }
  int? currentPage;
  int? from;
  int? lastPage;
  List<LinksMeta>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;
  Meta copyWith({  int? currentPage,
    int? from,
    int? lastPage,
    List<LinksMeta>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
  }) => Meta(  currentPage: currentPage ?? this.currentPage,
    from: from ?? this.from,
    lastPage: lastPage ?? this.lastPage,
    links: links ?? this.links,
    path: path ?? this.path,
    perPage: perPage ?? this.perPage,
    to: to ?? this.to,
    total: total ?? this.total,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['from'] = from;
    map['last_page'] = lastPage;
    if (links != null) {
      map['links'] = links?.map((v) => v.toJson()).toList();
    }
    map['path'] = path;
    map['per_page'] = perPage;
    map['to'] = to;
    map['total'] = total;
    return map;
  }


}

class LinksMeta {
  LinksMeta({
    this.url,
    this.label,
    this.active,});

  LinksMeta.fromJson(dynamic json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }
  String? url;
  String? label;
  bool? active;
  LinksMeta copyWith({
    String? url,
    String? label,
    bool? active,
  }) => LinksMeta(  url: url ?? this.url,
    label: label ?? this.label,
    active: active ?? this.active,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['label'] = label;
    map['active'] = active;
    return map;
  }

}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,});

  Links.fromJson(dynamic json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }
  String? first;
  String? last;
  dynamic prev;
  String? next;
  Links copyWith({  String? first,
    String? last,
    dynamic prev,
    String? next,
  }) => Links(  first: first ?? this.first,
    last: last ?? this.last,
    prev: prev ?? this.prev,
    next: next ?? this.next,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = first;
    map['last'] = last;
    map['prev'] = prev;
    map['next'] = next;
    return map;
  }

}

class ViewAllJobsData {
  ViewAllJobsData({
      this.id, 
      this.serviceProviderId, 
      this.serviceProviderName, 
      this.title, 
      this.positionType, 
      this.categoryId, 
      this.categoryName, 
      this.openings, 
      this.orgId, 
      this.orgName, 
      this.pradeshId, 
      this.pradeshName, 
      this.districtId, 
      this.districtName, 
      this.muniId, 
      this.muniName, 
      this.ward, 
      this.address, 
      this.discloseAddress, 
      this.deadline, 
      this.engDeadline, 
      this.description, 
      this.specification, 
      this.salaryMin, 
      this.salaryMax, 
      this.requiredExperience, 
      this.requiredEducation, 
      this.status, 
      this.discloseOrgAddress, 
      this.organization, 
      this.jobCategory, 
      this.serviceProvider,});

  ViewAllJobsData.fromJson(dynamic json) {
    id = json['id'];
    serviceProviderId = json['service_provider_id'];
    serviceProviderName = json['service_provider_name'];
    title = json['title'];
    positionType = json['position_type'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    openings = json['openings'];
    orgId = json['org_id'];
    orgName = json['org_name'];
    pradeshId = json['pradesh_id'];
    pradeshName = json['pradesh_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    muniId = json['muni_id'];
    muniName = json['muni_name'];
    ward = json['ward'];
    address = json['address'];
    discloseAddress = json['disclose_address'];
    deadline = json['deadline'];
    engDeadline = json['eng_deadline'];
    description = json['description'];
    specification = json['specification'];
    salaryMin = json['salary_min'];
    salaryMax = json['salary_max'];
    requiredExperience = json['required_experience'];
    requiredEducation = json['required_education'];
    status = json['status'];
    discloseOrgAddress = json['disclose_org_address'];
    organization = json['organization'] != null ? Organization.fromJson(json['organization']) : null;
    jobCategory = json['job_category'] != null ? JobCategory.fromJson(json['job_category']) : null;
    serviceProvider = json['serviceProvider'] != null ? ServiceProvider.fromJson(json['serviceProvider']) : null;
  }
  int? id;
  int? serviceProviderId;
  String? serviceProviderName;
  String? title;
  String? positionType;
  int? categoryId;
  String? categoryName;
  String? openings;
  int? orgId;
  String? orgName;
  int? pradeshId;
  String? pradeshName;
  int? districtId;
  String? districtName;
  int? muniId;
  String? muniName;
  int? ward;
  String? address;
  int? discloseAddress;
  String? deadline;
  String? engDeadline;
  String? description;
  String? specification;
  String? salaryMin;
  String? salaryMax;
  String? requiredExperience;
  String? requiredEducation;
  String? status;
  int? discloseOrgAddress;
  Organization? organization;
  JobCategory? jobCategory;
  ServiceProvider? serviceProvider;
ViewAllJobsData copyWith({  int? id,
  int? serviceProviderId,
  String? serviceProviderName,
  String? title,
  String? positionType,
  int? categoryId,
  String? categoryName,
  String? openings,
  int? orgId,
  String? orgName,
  int? pradeshId,
  String? pradeshName,
  int? districtId,
  String? districtName,
  int? muniId,
  String? muniName,
  int? ward,
  String? address,
  int? discloseAddress,
  String? deadline,
  String? engDeadline,
  String? description,
  String? specification,
  String? salaryMin,
  String? salaryMax,
  String? requiredExperience,
  String? requiredEducation,
  String? status,
  int? discloseOrgAddress,
  Organization? organization,
  JobCategory? jobCategory,
  ServiceProvider? serviceProvider,
}) => ViewAllJobsData(  id: id ?? this.id,
  serviceProviderId: serviceProviderId ?? this.serviceProviderId,
  serviceProviderName: serviceProviderName ?? this.serviceProviderName,
  title: title ?? this.title,
  positionType: positionType ?? this.positionType,
  categoryId: categoryId ?? this.categoryId,
  categoryName: categoryName ?? this.categoryName,
  openings: openings ?? this.openings,
  orgId: orgId ?? this.orgId,
  orgName: orgName ?? this.orgName,
  pradeshId: pradeshId ?? this.pradeshId,
  pradeshName: pradeshName ?? this.pradeshName,
  districtId: districtId ?? this.districtId,
  districtName: districtName ?? this.districtName,
  muniId: muniId ?? this.muniId,
  muniName: muniName ?? this.muniName,
  ward: ward ?? this.ward,
  address: address ?? this.address,
  discloseAddress: discloseAddress ?? this.discloseAddress,
  deadline: deadline ?? this.deadline,
  engDeadline: engDeadline ?? this.engDeadline,
  description: description ?? this.description,
  specification: specification ?? this.specification,
  salaryMin: salaryMin ?? this.salaryMin,
  salaryMax: salaryMax ?? this.salaryMax,
  requiredExperience: requiredExperience ?? this.requiredExperience,
  requiredEducation: requiredEducation ?? this.requiredEducation,
  status: status ?? this.status,
  discloseOrgAddress: discloseOrgAddress ?? this.discloseOrgAddress,
  organization: organization ?? this.organization,
  jobCategory: jobCategory ?? this.jobCategory,
  serviceProvider: serviceProvider ?? this.serviceProvider,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['service_provider_id'] = serviceProviderId;
    map['service_provider_name'] = serviceProviderName;
    map['title'] = title;
    map['position_type'] = positionType;
    map['category_id'] = categoryId;
    map['category_name'] = categoryName;
    map['openings'] = openings;
    map['org_id'] = orgId;
    map['org_name'] = orgName;
    map['pradesh_id'] = pradeshId;
    map['pradesh_name'] = pradeshName;
    map['district_id'] = districtId;
    map['district_name'] = districtName;
    map['muni_id'] = muniId;
    map['muni_name'] = muniName;
    map['ward'] = ward;
    map['address'] = address;
    map['disclose_address'] = discloseAddress;
    map['deadline'] = deadline;
    map['eng_deadline'] = engDeadline;
    map['description'] = description;
    map['specification'] = specification;
    map['salary_min'] = salaryMin;
    map['salary_max'] = salaryMax;
    map['required_experience'] = requiredExperience;
    map['required_education'] = requiredEducation;
    map['status'] = status;
    map['disclose_org_address'] = discloseOrgAddress;
    if (organization != null) {
      map['organization'] = organization?.toJson();
    }
    if (jobCategory != null) {
      map['job_category'] = jobCategory?.toJson();
    }
    if (serviceProvider != null) {
      map['serviceProvider'] = serviceProvider?.toJson();
    }
    return map;
  }

}

/// id : 4
/// name : "Association"
/// pradesh_id : 1
/// pradesh_name : "प्रदेश नं. १"
/// district_id : 5
/// district_name : "मोरङ"
/// muni_id : 43
/// muni_name : "विराटनगर महानगरपालिका"
/// ward : "10"
/// type : 4
/// type_name : "Association"
/// estd_at : "2021-07-01"
/// pan : "123456789"
/// phone : null
/// mobile : "9842706855"
/// fax : null
/// website : null
/// org_type : "ltd"
/// cp_name : "AssociationHr"
/// cp_designation : "HR"
/// cp_mobile : "1234567890"
/// cp_email : null
/// status : 1
/// description : "<p>Association Details</p>"
/// logo : "/medias/download1_2022_09_05_11_09_03.png"

class ServiceProvider {
  ServiceProvider({
      this.id, 
      this.name, 
      this.pradeshId, 
      this.pradeshName, 
      this.districtId, 
      this.districtName, 
      this.muniId, 
      this.muniName, 
      this.ward, 
      this.type, 
      this.typeName, 
      this.estdAt, 
      this.pan, 
      this.phone, 
      this.mobile, 
      this.fax, 
      this.website, 
      this.orgType, 
      this.cpName, 
      this.designation,
      this.cpMobile, 
      this.email,
      this.status, 
      this.description, 
      this.logo,});

  ServiceProvider.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    pradeshId = json['pradesh_id'];
    pradeshName = json['pradesh_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    muniId = json['muni_id'];
    muniName = json['muni_name'];
    ward = json['ward'];
    type = json['type'];
    typeName = json['type_name'];
    estdAt = json['estd_at'];
    pan = json['pan'];
    phone = json['phone'];
    mobile = json['mobile'];
    fax = json['fax'];
    website = json['website'];
    orgType = json['org_type'];
    cpName = json['cp_name'];
    designation = json['designation'];
    cpMobile = json['cp_mobile'];
    email = json['email'];
    status = json['status'];
    description = json['description'];
    logo = json['logo'];
  }
  int? id;
  String? name;
  int? pradeshId;
  String? pradeshName;
  int? districtId;
  String? districtName;
  int? muniId;
  String? muniName;
  String? ward;
  int? type;
  String? typeName;
  String? estdAt;
  String? pan;
  String? phone;
  String? mobile;
  String? fax;
  String? website;
  String? orgType;
  String? cpName;
  String? designation;
  String? cpMobile;
  String? email;
  int? status;
  String? description;
  String? logo;
ServiceProvider copyWith({  int? id,
  String? name,
  int? pradeshId,
  String? pradeshName,
  int? districtId,
  String? districtName,
  int? muniId,
  String? muniName,
  String? ward,
  int? type,
  String? typeName,
  String? estdAt,
  String? pan,
  String? phone,
  String? mobile,
  String? fax,
  String? website,
  String? orgType,
  String? cpName,
  String? designation,
  String? cpMobile,
  String? email,
  int? status,
  String? description,
  String? logo,
}) => ServiceProvider(  id: id ?? this.id,
  name: name ?? this.name,
  pradeshId: pradeshId ?? this.pradeshId,
  pradeshName: pradeshName ?? this.pradeshName,
  districtId: districtId ?? this.districtId,
  districtName: districtName ?? this.districtName,
  muniId: muniId ?? this.muniId,
  muniName: muniName ?? this.muniName,
  ward: ward ?? this.ward,
  type: type ?? this.type,
  typeName: typeName ?? this.typeName,
  estdAt: estdAt ?? this.estdAt,
  pan: pan ?? this.pan,
  phone: phone ?? this.phone,
  mobile: mobile ?? this.mobile,
  fax: fax ?? this.fax,
  website: website ?? this.website,
  orgType: orgType ?? this.orgType,
  cpName: cpName ?? this.cpName,
  designation: designation ?? this.designation,
  cpMobile: cpMobile ?? this.cpMobile,
  email: email ?? this.email,
  status: status ?? this.status,
  description: description ?? this.description,
  logo: logo ?? this.logo,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['pradesh_id'] = pradeshId;
    map['pradesh_name'] = pradeshName;
    map['district_id'] = districtId;
    map['district_name'] = districtName;
    map['muni_id'] = muniId;
    map['muni_name'] = muniName;
    map['ward'] = ward;
    map['type'] = type;
    map['type_name'] = typeName;
    map['estd_at'] = estdAt;
    map['pan'] = pan;
    map['phone'] = phone;
    map['mobile'] = mobile;
    map['fax'] = fax;
    map['website'] = website;
    map['org_type'] = orgType;
    map['cp_name'] = cpName;
    map['designation'] = designation;
    map['cp_mobile'] = cpMobile;
    map['email'] = email;
    map['status'] = status;
    map['description'] = description;
    map['logo'] = logo;
    return map;
  }

}

/// id : 15
/// name : "मार्केटिंग ऑफिसर"
/// status : 1

class JobCategory {
  JobCategory({
      this.id, 
      this.name, 
      this.status,});

  JobCategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }
  int? id;
  String? name;
  int? status;
JobCategory copyWith({  int? id,
  String? name,
  int? status,
}) => JobCategory(  id: id ?? this.id,
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

/// id : 3
/// service_provider_id : 8
/// name : "Airlines Operators Association of Nepal"
/// description : "<p>Pokhara, Nepal based travel company server Ticketing (Bus, Train and Air) Sightseeing, Jungle safari, Rafting, Tours etc.</p>\r\n\r\n<p><a name=\"hours\"></a></p>"
/// pradesh_id : 3
/// pradesh_name : "बागमती प्रदेश"
/// district_id : 25
/// district_name : "ललितपुर"
/// muni_id : 325
/// muni_name : "ललितपुर महानगरपालिका"
/// ward : 1
/// address : "Lalitpur"
/// email : "airlines@gmail.com"
/// contact_intber : "9876541668"

class Organization {
  Organization({
      this.id, 
      this.serviceProviderId, 
      this.name, 
      this.description, 
      this.pradeshId, 
      this.pradeshName, 
      this.districtId, 
      this.districtName, 
      this.muniId, 
      this.muniName, 
      this.ward, 
      this.address, 
      this.email, 
      this.contactNumber,});

  Organization.fromJson(dynamic json) {
    id = json['id'];
    serviceProviderId = json['service_provider_id'];
    name = json['name'];
    description = json['description'];
    pradeshId = json['pradesh_id'];
    pradeshName = json['pradesh_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    muniId = json['muni_id'];
    muniName = json['muni_name'];
    ward = json['ward'];
    address = json['address'];
    email = json['email'];
    contactNumber = json['contact_number'];
  }
  int? id;
  int? serviceProviderId;
  String? name;
  String? description;
  int? pradeshId;
  String? pradeshName;
  int? districtId;
  String? districtName;
  int? muniId;
  String? muniName;
  int? ward;
  String? address;
  String? email;
  String? contactNumber;
Organization copyWith({  int? id,
  int? serviceProviderId,
  String? name,
  String? description,
  int? pradeshId,
  String? pradeshName,
  int? districtId,
  String? districtName,
  int? muniId,
  String? muniName,
  int? ward,
  String? address,
  String? email,
  String? contactNumber,
}) => Organization(  id: id ?? this.id,
  serviceProviderId: serviceProviderId ?? this.serviceProviderId,
  name: name ?? this.name,
  description: description ?? this.description,
  pradeshId: pradeshId ?? this.pradeshId,
  pradeshName: pradeshName ?? this.pradeshName,
  districtId: districtId ?? this.districtId,
  districtName: districtName ?? this.districtName,
  muniId: muniId ?? this.muniId,
  muniName: muniName ?? this.muniName,
  ward: ward ?? this.ward,
  address: address ?? this.address,
  email: email ?? this.email,
  contactNumber: contactNumber ?? this.contactNumber,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['service_provider_id'] = serviceProviderId;
    map['name'] = name;
    map['description'] = description;
    map['pradesh_id'] = pradeshId;
    map['pradesh_name'] = pradeshName;
    map['district_id'] = districtId;
    map['district_name'] = districtName;
    map['muni_id'] = muniId;
    map['muni_name'] = muniName;
    map['ward'] = ward;
    map['address'] = address;
    map['email'] = email;
    map['contact_number'] = contactNumber;
    return map;
  }

}