class ViewAllTrainingsModel {
  ViewAllTrainingsModel({
      this.data, 
      this.links, 
      this.meta,
      this.isApplied,
  });

  ViewAllTrainingsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ViewAllTrainingsData.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    isApplied = json['isApplied'];
  }
  List<ViewAllTrainingsData>? data;
  Links? links;
  Meta? meta;
  bool? isApplied;
ViewAllTrainingsModel copyWith({  List<ViewAllTrainingsData>? data,
  Links? links,
  Meta? meta,
  bool? isApplied,
}) => ViewAllTrainingsModel(  data: data ?? this.data,
  links: links ?? this.links,
  meta: meta ?? this.meta,
  isApplied: isApplied ?? this.isApplied,
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
    map['isApplied'] = isApplied;
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


class ViewAllTrainingsData {
  ViewAllTrainingsData({
      this.id, 
      this.serviceProviderId, 
      this.serviceProviderName, 
      this.title, 
      this.noOfParticipant, 
      this.startDate, 
      this.startTime, 
      this.endDate, 
      this.engEndDate, 
      this.endTime, 
      this.categoryId, 
      this.categoryName, 
      this.status, 
      this.description, 
      this.trainers, 
      this.applyFromOnline, 
      this.pradeshId, 
      this.pradeshName, 
      this.districtId, 
      this.districtName, 
      this.muniId, 
      this.muniName, 
      this.ward, 
      this.serviceProvider, 
      this.category,});

  ViewAllTrainingsData.fromJson(dynamic json) {
    id = json['id'];
    serviceProviderId = json['service_provider_id'];
    serviceProviderName = json['service_provider_name'];
    title = json['title'];
    noOfParticipant = json['no_of_participant'];
    startDate = json['start_date'];
    startTime = json['start_time'];
    endDate = json['end_date'];
    engEndDate = json['eng_end_date'];
    endTime = json['end_time'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    status = json['status'];
    description = json['description'];
    trainers = json['trainers'];
    applyFromOnline = json['apply_from_online'];
    pradeshId = json['pradesh_id'];
    pradeshName = json['pradesh_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    muniId = json['muni_id'];
    muniName = json['muni_name'];
    ward = json['ward'];
    serviceProvider = json['serviceProvider'] != null ? ServiceProvider.fromJson(json['serviceProvider']) : null;
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  int? id;
  int? serviceProviderId;
  String? serviceProviderName;
  String? title;
  int? noOfParticipant;
  String? startDate;
  String? startTime;
  String? endDate;
  String? engEndDate;
  String? endTime;
  int? categoryId;
  String? categoryName;
  int? status;
  String? description;
  String? trainers;
  int? applyFromOnline;
  int? pradeshId;
  String? pradeshName;
  int? districtId;
  String? districtName;
  int? muniId;
  String? muniName;
  String? ward;
  ServiceProvider? serviceProvider;
  Category? category;
ViewAllTrainingsData copyWith({  int? id,
  int? serviceProviderId,
  String? serviceProviderName,
  String? title,
  int? noOfParticipant,
  String? startDate,
  String? startTime,
  String? endDate,
  String? engEndDate,
  String? endTime,
  int? categoryId,
  String? categoryName,
  int? status,
  String? description,
  String? trainers,
  int? applyFromOnline,
  int? pradeshId,
  String? pradeshName,
  int? districtId,
  String? districtName,
  int? muniId,
  String? muniName,
  String? ward,
  ServiceProvider? serviceProvider,
  Category? category,
}) => ViewAllTrainingsData(  id: id ?? this.id,
  serviceProviderId: serviceProviderId ?? this.serviceProviderId,
  serviceProviderName: serviceProviderName ?? this.serviceProviderName,
  title: title ?? this.title,
  noOfParticipant: noOfParticipant ?? this.noOfParticipant,
  startDate: startDate ?? this.startDate,
  startTime: startTime ?? this.startTime,
  endDate: endDate ?? this.endDate,
  engEndDate: engEndDate ?? this.engEndDate,
  endTime: endTime ?? this.endTime,
  categoryId: categoryId ?? this.categoryId,
  categoryName: categoryName ?? this.categoryName,
  status: status ?? this.status,
  description: description ?? this.description,
  trainers: trainers ?? this.trainers,
  applyFromOnline: applyFromOnline ?? this.applyFromOnline,
  pradeshId: pradeshId ?? this.pradeshId,
  pradeshName: pradeshName ?? this.pradeshName,
  districtId: districtId ?? this.districtId,
  districtName: districtName ?? this.districtName,
  muniId: muniId ?? this.muniId,
  muniName: muniName ?? this.muniName,
  ward: ward ?? this.ward,
  serviceProvider: serviceProvider ?? this.serviceProvider,
  category: category ?? this.category,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['service_provider_id'] = serviceProviderId;
    map['service_provider_name'] = serviceProviderName;
    map['title'] = title;
    map['no_of_participant'] = noOfParticipant;
    map['start_date'] = startDate;
    map['start_time'] = startTime;
    map['end_date'] = endDate;
    map['eng_end_date'] = engEndDate;
    map['end_time'] = endTime;
    map['category_id'] = categoryId;
    map['category_name'] = categoryName;
    map['status'] = status;
    map['description'] = description;
    map['trainers'] = trainers;
    map['apply_from_online'] = applyFromOnline;
    map['pradesh_id'] = pradeshId;
    map['pradesh_name'] = pradeshName;
    map['district_id'] = districtId;
    map['district_name'] = districtName;
    map['muni_id'] = muniId;
    map['muni_name'] = muniName;
    map['ward'] = ward;
    if (serviceProvider != null) {
      map['serviceProvider'] = serviceProvider?.toJson();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    return map;
  }

}

/// id : 19
/// name : "वूल प्रोसेस्सर, २००८"
/// status : 1

class Category {
  Category({
      this.id, 
      this.name, 
      this.status,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
  }
  int? id;
  String? name;
  int? status;
Category copyWith({  int? id,
  String? name,
  int? status,
}) => Category(  id: id ?? this.id,
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

/// id : 6
/// name : "रोजगारी  सर्विस"
/// pradesh_id : 1
/// pradesh_name : "प्रदेश नं. १"
/// district_id : 5
/// district_name : "मोरङ"
/// muni_id : 43
/// muni_name : "विराटनगर महानगरपालिका"
/// ward : "10"
/// type : 1
/// type_name : "ESP"
/// estd_at : "2015-11-15"
/// pan : "Mollitia dolor vel s"
/// phone : "+1 (248) 808-4846"
/// mobile : "8976546576"
/// fax : "+1 (324) 323-6654"
/// website : "https://www.muwo.org"
/// org_type : "asdf ghjk"
/// cp_name : "Kitra Pugh"
/// cp_designation : "Rerum facilis aut ad"
/// cp_mobile : "1234567890"
/// cp_email : "hudyjukib@mailinator.com"
/// status : 1
/// description : "<p>&nbsp;रोजगारी सर्विसेज प्राइवेट लिमिटेड &nbsp; २०१२ का अंतर्गत दर्ता भएको थियो &nbsp;यस उदेस्यका साथ की &nbsp;कर्मचारी र कामदारी का बिच काम को जोड़न हुन &nbsp;सकोस र नेपालका बेरोजगार हरुले सकेसम्म छिटो &nbsp;भन्दा छिटो रोजगार पाउन सकुन&nbsp;। नेपालका &nbsp;कतिपय नागरिक संग सिप भएता पनि सूचना को कमीले रोजगारको कमि मा बस्नु परेको पाइएको छ र हाम्रो यस संस्था ले त्यस्ता सिप पूर्ण व्यक्ति हरुलाई रोजगारी को सूचना उपलब्द गराउन सहयोग गर्नुका साथै त्यसमा परिरत गराउन ठुलो भूमिका खेल्ने छ&nbsp;।</p>"
/// logo : null

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
    cpName = json['name'];
    designation = json['designation'];
    cpMobile = json['mobile'];
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
  dynamic logo;
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
  String? cpDesignation,
  String? cpMobile,
  String? cpEmail,
  int? status,
  String? description,
  dynamic logo,
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
  designation: cpDesignation ?? this.designation,
  cpMobile: cpMobile ?? this.cpMobile,
  email: cpEmail ?? this.email,
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
    map['name'] = cpName;
    map['designation'] = designation;
    map['mobile'] = cpMobile;
    map['email'] = email;
    map['status'] = status;
    map['description'] = description;
    map['logo'] = logo;
    return map;
  }

}