import 'dart:convert';

class LatestTrainingModel {
  LatestTrainingModel({
    required this.id,
    required this.serviceProviderName,
    required this.title,
    required this.noOfParticipant,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.engEndDate,
    required this.endTime,
    required this.categoryName,
    required this.description,
    required this.pradeshName,
    required this.districtName,
    required this.muniName,
    required this.ward,
    required this.serviceProvider,
  });

  int id;
  String serviceProviderName;
  String title;
  int noOfParticipant;
  String startDate;
  String startTime;
  String endDate;
  String engEndDate;
  String endTime;
  String categoryName;
  String description;
  String pradeshName;
  String districtName;
  String muniName;
  String ward;
  ServiceProvider serviceProvider;

  factory LatestTrainingModel.fromJson(Map<String, dynamic> json) =>
      LatestTrainingModel(
        id: json["id"] ?? 0,
        serviceProviderName: json["service_provider_name"] ?? '',
        title: json["title"] ?? "",
        noOfParticipant: json["no_of_participant"] ?? 0,
        startDate: json["start_date"] ?? "",
        startTime: json["start_time"] ?? "",
        endDate: json["end_date"] ?? "",
        engEndDate: json["eng_end_date"] ?? "",
        endTime: json["end_time"] ?? '',
        categoryName: json["category_name"] ?? '',
        description: json["description"] ?? '',
        pradeshName: json["pradesh_name"] ?? '',
        districtName: json["district_name"] ?? '',
        muniName: json["muni_name"] ?? "",
        ward: json["ward"] ?? "",
        serviceProvider: ServiceProvider.fromJson(json["serviceProvider"]),
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

  int id;
  String name;
  String pradeshName;
  String districtName;
  String muniName;
  String ward;
  int type;
  String typeName;
  dynamic phone;
  String mobile;
  String email;
  dynamic website;
  String description;
  String logo;

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      ServiceProvider(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        pradeshName: json["pradesh_name"] ?? '',
        districtName: json["district_name"] ?? '',
        muniName: json["muni_name"] ?? '',
        ward: json["ward"] ?? '',
        type: json["type"] ?? 0,
        typeName: json["type_name"] ?? '',
        phone: json["phone"]??null,
        mobile: json["mobile"] ?? '',
        email: json["email"] ?? '',
        website: json["website"],
        description: json["description"] ?? '',
        logo: json["logo"] ??
            "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png?20220519031949",
      );
}
