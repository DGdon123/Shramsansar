// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewViewAllJobModel {
  final int id;
  final String service_provider_name;
  final String title;
  final String position_type;
  final int categoryId;
  final String categoryName;
  final String openings;
  final int pradeshId;
  final String pradesh_name;
  final String district_name;
  final int districtId;
  final int muniId;
  final String muniName;
  final int ward;
  final String address;
  final String deadline;
  final String engDeadline;
  final String description;
  final String specification;
  final String salaryMin;
  final String salaryMax;
  final String requiredExperience;
  final String requiredEducation;
  final int discloseOrgAddress;
  final Organization organization;
  final ServiceProvider serviceProvider;
  NewViewAllJobModel({
    required this.id,
    required this.service_provider_name,
    required this.title,
    required this.position_type,
    required this.categoryId,
    required this.categoryName,
    required this.openings,
    required this.pradeshId,
    required this.pradesh_name,
    required this.district_name,
    required this.districtId,
    required this.muniId,
    required this.muniName,
    required this.ward,
    required this.address,
    required this.deadline,
    required this.engDeadline,
    required this.description,
    required this.specification,
    required this.salaryMin,
    required this.salaryMax,
    required this.requiredExperience,
    required this.requiredEducation,
    required this.discloseOrgAddress,
    required this.organization,
    required this.serviceProvider,
  });

  NewViewAllJobModel copyWith({
    int? id,
    String? service_provider_name,
    String? title,
    String? position_type,
    int? categoryId,
    String? categoryName,
    String? openings,
    int? pradeshId,
    String? pradesh_name,
    String? district_name,
    int? districtId,
    int? muniId,
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
  }) {
    return NewViewAllJobModel(
      id: id ?? this.id,
      service_provider_name:
          service_provider_name ?? this.service_provider_name,
      title: title ?? this.title,
      position_type: position_type ?? this.position_type,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      openings: openings ?? this.openings,
      pradeshId: pradeshId ?? this.pradeshId,
      pradesh_name: pradesh_name ?? this.pradesh_name,
      district_name: district_name ?? this.district_name,
      districtId: districtId ?? this.districtId,
      muniId: muniId ?? this.muniId,
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
    );
  }

  factory NewViewAllJobModel.fromMap(Map<String, dynamic> map) {
    return NewViewAllJobModel(
      id: map['id'] ?? "",
      service_provider_name: map['service_provider_name'] ?? "",
      title: map['title'] ?? "",
      position_type: map['position_type'] ?? "",
      categoryId: map['category_id'] ?? 0,
      categoryName: map['category_name'] ?? "",
      openings: map['openings'] ?? "",
      pradeshId: map['pradesh_id'] ?? 0,
      pradesh_name: map['pradesh_name'] ?? "",
      district_name: map['district_name'] ?? "",
      districtId: map['district_id'] ?? 0,
      muniId: map['muni_id'] ?? 0,
      muniName: map['muni_name'] ?? "",
      ward: map['ward'] ?? 0,
      address: map['address'] ?? "",
      deadline: map['deadline'] ?? "",
      engDeadline: map['eng_deadline'] ?? "",
      description: map['description'] ?? "",
      specification: map['specification'] ?? "",
      salaryMin: map['salary_min'] ?? "",
      salaryMax: map['salary_max'] ?? "",
      requiredExperience: map['required_experience'] ?? "",
      requiredEducation: map['required_education'] ?? "",
      discloseOrgAddress: map['disclose_org_address'] ?? 0,
      organization:
          Organization.fromMap(map['organization'] as Map<String, dynamic>),
      serviceProvider: ServiceProvider.fromMap(
          map['serviceProvider'] as Map<String, dynamic>),
    );
  }

  factory NewViewAllJobModel.fromJson(String source) =>
      NewViewAllJobModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ViewAllJobModel(id: $id, service_provider_name: $service_provider_name, title: $title, position_type: $position_type, categoryId: $categoryId, categoryName: $categoryName, openings: $openings, pradeshId: $pradeshId, pradesh_name: $pradesh_name, district_name: $district_name, districtId: $districtId, muniId: $muniId, muniName: $muniName, ward: $ward, address: $address, deadline: $deadline, engDeadline: $engDeadline, description: $description, specification: $specification, salaryMin: $salaryMin, salaryMax: $salaryMax, requiredExperience: $requiredExperience, requiredEducation: $requiredEducation, discloseOrgAddress: $discloseOrgAddress, organization: $organization, serviceProvider: $serviceProvider)';
  }

  @override
  bool operator ==(covariant NewViewAllJobModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.service_provider_name == service_provider_name &&
        other.title == title &&
        other.position_type == position_type &&
        other.categoryId == categoryId &&
        other.categoryName == categoryName &&
        other.openings == openings &&
        other.pradeshId == pradeshId &&
        other.pradesh_name == pradesh_name &&
        other.district_name == district_name &&
        other.districtId == districtId &&
        other.muniId == muniId &&
        other.muniName == muniName &&
        other.ward == ward &&
        other.address == address &&
        other.deadline == deadline &&
        other.engDeadline == engDeadline &&
        other.description == description &&
        other.specification == specification &&
        other.salaryMin == salaryMin &&
        other.salaryMax == salaryMax &&
        other.requiredExperience == requiredExperience &&
        other.requiredEducation == requiredEducation &&
        other.discloseOrgAddress == discloseOrgAddress &&
        other.organization == organization &&
        other.serviceProvider == serviceProvider;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        service_provider_name.hashCode ^
        title.hashCode ^
        position_type.hashCode ^
        categoryId.hashCode ^
        categoryName.hashCode ^
        openings.hashCode ^
        pradeshId.hashCode ^
        pradesh_name.hashCode ^
        district_name.hashCode ^
        districtId.hashCode ^
        muniId.hashCode ^
        muniName.hashCode ^
        ward.hashCode ^
        address.hashCode ^
        deadline.hashCode ^
        engDeadline.hashCode ^
        description.hashCode ^
        specification.hashCode ^
        salaryMin.hashCode ^
        salaryMax.hashCode ^
        requiredExperience.hashCode ^
        requiredEducation.hashCode ^
        discloseOrgAddress.hashCode ^
        organization.hashCode ^
        serviceProvider.hashCode;
  }
}

class ServiceProvider {
  final int id;
  final String name;
  final String pradesh_name;
  final String district_name;
  final String muni_name;
  final String ward;
  final int type;
  final String type_name;
  final String phone;
  final String mobile;
  final String email;
  final String website;
  final String description;
  final String logo;
  ServiceProvider({
    required this.id,
    required this.name,
    required this.pradesh_name,
    required this.district_name,
    required this.muni_name,
    required this.ward,
    required this.type,
    required this.type_name,
    required this.phone,
    required this.mobile,
    required this.email,
    required this.website,
    required this.description,
    required this.logo,
  });

  ServiceProvider copyWith({
    int? id,
    String? name,
    String? pradesh_name,
    String? district_name,
    String? muni_name,
    String? ward,
    int? type,
    String? type_name,
    String? phone,
    String? mobile,
    String? email,
    String? website,
    String? description,
    String? logo,
  }) {
    return ServiceProvider(
      id: id ?? this.id,
      name: name ?? this.name,
      pradesh_name: pradesh_name ?? this.pradesh_name,
      district_name: district_name ?? this.district_name,
      muni_name: muni_name ?? this.muni_name,
      ward: ward ?? this.ward,
      type: type ?? this.type,
      type_name: type_name ?? this.type_name,
      phone: phone ?? this.phone,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      website: website ?? this.website,
      description: description ?? this.description,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'pradesh_name': pradesh_name,
      'district_name': district_name,
      'muni_name': muni_name,
      'ward': ward,
      'type': type,
      'type_name': type_name,
      'phone': phone,
      'mobile': mobile,
      'email': email,
      'website': website,
      'description': description,
      'logo': logo,
    };
  }

  factory ServiceProvider.fromMap(Map<String, dynamic> map) {
    return ServiceProvider(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      pradesh_name: map['pradesh_name'] ?? "",
      district_name: map['district_name'] ?? "",
      muni_name: map['muni_name'] ?? "",
      ward: map['ward'] ?? "",
      type: map['type'] ?? "",
      type_name: map['type_name'] ?? "",
      phone: map['phone'] ?? "",
      mobile: map['mobile'] ?? "",
      email: map['email'] ?? "",
      website: map['website'] ?? "",
      description: map['description'] ?? "",
      logo: map['logo'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceProvider.fromJson(String source) =>
      ServiceProvider.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ServiceProvider(id: $id, name: $name, pradesh_name: $pradesh_name, district_name: $district_name, muni_name: $muni_name, ward: $ward, type: $type, type_name: $type_name, phone: $phone, mobile: $mobile, email: $email, website: $website, description: $description, logo: $logo)';
  }

  @override
  bool operator ==(covariant ServiceProvider other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.pradesh_name == pradesh_name &&
        other.district_name == district_name &&
        other.muni_name == muni_name &&
        other.ward == ward &&
        other.type == type &&
        other.type_name == type_name &&
        other.phone == phone &&
        other.mobile == mobile &&
        other.email == email &&
        other.website == website &&
        other.description == description &&
        other.logo == logo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        pradesh_name.hashCode ^
        district_name.hashCode ^
        muni_name.hashCode ^
        ward.hashCode ^
        type.hashCode ^
        type_name.hashCode ^
        phone.hashCode ^
        mobile.hashCode ^
        email.hashCode ^
        website.hashCode ^
        description.hashCode ^
        logo.hashCode;
  }
}

class Organization {
  final int id;
  final String name;
  final String pradesh_name;
  final String district_name;
  final String muni_name;
  final int word;
  final String address;
  final String email;
  final String contact_number;
  Organization({
    required this.id,
    required this.name,
    required this.pradesh_name,
    required this.district_name,
    required this.muni_name,
    required this.word,
    required this.address,
    required this.email,
    required this.contact_number,
  });

  Organization copyWith({
    int? id,
    String? name,
    String? pradesh_name,
    String? district_name,
    String? muni_name,
    int? word,
    String? address,
    String? email,
    String? contact_number,
  }) {
    return Organization(
      id: id ?? this.id,
      name: name ?? this.name,
      pradesh_name: pradesh_name ?? this.pradesh_name,
      district_name: district_name ?? this.district_name,
      muni_name: muni_name ?? this.muni_name,
      word: word ?? this.word,
      address: address ?? this.address,
      email: email ?? this.email,
      contact_number: contact_number ?? this.contact_number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'pradesh_name': pradesh_name,
      'district_name': district_name,
      'muni_name': muni_name,
      'word': word,
      'address': address,
      'email': email,
      'contact_number': contact_number,
    };
  }

  factory Organization.fromMap(Map<String, dynamic> map) {
    return Organization(
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      pradesh_name: map['pradesh_name'] ?? "",
      district_name: map['district_name'] ?? "",
      muni_name: map['muni_name'] ?? "",
      word: map['word'] ?? 0,
      address: map['address'] ?? "",
      email: map['email'] ?? "",
      contact_number: map['contact_number'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory Organization.fromJson(String source) =>
      Organization.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Origanization(id: $id, name: $name, pradesh_name: $pradesh_name, district_name: $district_name, muni_name: $muni_name, word: $word, address: $address, email: $email, contact_number: $contact_number)';
  }

  @override
  bool operator ==(covariant Organization other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.pradesh_name == pradesh_name &&
        other.district_name == district_name &&
        other.muni_name == muni_name &&
        other.word == word &&
        other.address == address &&
        other.email == email &&
        other.contact_number == contact_number;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        pradesh_name.hashCode ^
        district_name.hashCode ^
        muni_name.hashCode ^
        word.hashCode ^
        address.hashCode ^
        email.hashCode ^
        contact_number.hashCode;
  }
}
