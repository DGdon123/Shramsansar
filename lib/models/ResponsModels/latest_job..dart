// To parserequired this JSON data, do
//
//     final latestJobModel = latestJobModelFromJson(jsonString);

import 'dart:convert';

class LatestJobModel {
  LatestJobModel({
    required this.id,
    required this.serviceProviderName,
    required this.title,
    required this.positionType,
    required this.categoryId,
    required this.categoryName,
    required this.openings,
    required this.pradeshId,
    required this.pradeshName,
    required this.districtId,
    required this.districtName,
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
    // required this.organization,
    required this.serviceProvider,
  });

  final int id;
  final String serviceProviderName;
  final String title;
  final String positionType;
  final int categoryId;
  final String categoryName;
  final String openings;
  final int pradeshId;
  final String pradeshName;
  final int districtId;
  final String districtName;
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
  // final Organization organization;
  final ServiceProvider serviceProvider;

  factory LatestJobModel.fromJson(Map<String, dynamic> json) => LatestJobModel(
        id: json["id"]??0,
        serviceProviderName: json["service_provider_name"]??"",
        title: json["title"]??"",
        positionType: json["position_type"]??'',
        categoryId: json["category_id"]??0,
        categoryName: json["category_name"]??"",
        openings: json["openings"]??"",
        pradeshId: json["pradesh_id"]??0,
        pradeshName: json["pradesh_name"]??"",
        districtId: json["district_id"]??0,
        districtName: json["district_name"]??'',
        muniId: json["muni_id"]??0,
        muniName: json["muni_name"]??"",
        ward: json["ward"]??0,
        address: json["address"]??"",
        deadline: json["deadline"]??'',
        engDeadline: json["eng_deadline"]??"",
        description: json["description"]??'',
        specification: json["specification"]??'',
        salaryMin: json["salary_min"]??'',
        salaryMax: json["salary_max"]??'',
        requiredExperience: json["required_experience"]??'',
        requiredEducation: json["required_education"]??"",
        discloseOrgAddress: json["disclose_org_address"]??0,
        // organization: Organization.fromJson(json["organization"]),
        serviceProvider: ServiceProvider.fromJson(json["serviceProvider"]),
      );
}

class Organization {
  Organization({
    required this.id,
    required this.name,
    required this.pradeshName,
    required this.districtName,
    required this.muniName,
    required this.ward,
    required this.address,
    required this.email,
    required this.contactNumber,
  });

  final int id;
 final String name;
 final String pradeshName;
 final String districtName;
final  String muniName;
final  int ward;
final  String address;
 final String email;
final  String contactNumber;

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
        id: json["id"]??0,
        name: json["name"]??"",
        pradeshName: json["pradesh_name"]??"",
        districtName: json["district_name"]??'',
        muniName: json["muni_name"]??"",
        ward: json["ward"]??0,
        address: json["address"]??"",
        email: json["email"]??'',
        contactNumber: json["contact_number"]??'',
      );
}

class ServiceProvider {
  ServiceProvider({
    required this.id,
    required this.name,
    required this.pradeshName,
    required this.districtName,
    required this.muniName,
    required this.ward,
    required this.type,
    required this.typeName,
    required this.phone,
    required this.mobile,
    required this.email,
    required this.website,
    required this.description,
    required this.logo,
  });

 final int id;
 final String name;
 final String pradeshName;
 final String districtName;
 final String muniName;
final  String ward;
final  int type;
 final String typeName;
 final String phone;
final  String mobile;
final  String email;
final  String website;
 final String description;
 final String logo;

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      ServiceProvider(
        id: json["id"]??0,
        name: json["name"]??0,
        pradeshName: json["pradesh_name"]??"",
        districtName: json["district_name"]??"",
        muniName: json["muni_name"]??"",
        ward: json["ward"]??'',
        type: json["type"]??0,
        typeName: json["type_name"]??'',
        phone: json["phone"] ?? "",
        mobile: json["mobile"]??'',
        email: json["email"]??"",
        website: json["website"] ??"",
        description: json["description"]??"",
        logo: json["logo"]??'',
      );
}
