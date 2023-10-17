/// data : [{"message":"Your TEST JOB FOR API Application has been Hired","name":"TEST JOB FOR API","service_provider_name":"युवा जोब्स","service_provider_logo":"/assets/website/images/icons/demo-img.jpg","time":"36 minutes ago"},{"message":"Your TEST JOB FOR API Application has been Shortlisted","name":"TEST JOB FOR API","service_provider_name":"युवा जोब्स","service_provider_logo":"/assets/website/images/icons/demo-img.jpg","time":"36 minutes ago"},{"message":"Your Job Application For TEST JOB FOR API has been submitted successfully","name":"TEST JOB FOR API","service_provider_name":"युवा जोब्स","service_provider_logo":"/assets/website/images/icons/demo-img.jpg","time":"38 minutes ago"}]

class NotificationModel {
  NotificationModel({
      this.data,});

  NotificationModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(NotificationData.fromJson(v));
      });
    }
  }
  List<NotificationData>? data;
NotificationModel copyWith({  List<NotificationData>? data,
}) => NotificationModel(  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// message : "Your TEST JOB FOR API Application has been Hired"
/// name : "TEST JOB FOR API"
/// service_provider_name : "युवा जोब्स"
/// service_provider_logo : "/assets/website/images/icons/demo-img.jpg"
/// time : "36 minutes ago"

class NotificationData {
  NotificationData({
      this.message, 
      this.name, 
      this.serviceProviderName, 
      this.serviceProviderLogo, 
      this.time,});

  NotificationData.fromJson(dynamic json) {
    message = json['message'];
    name = json['name'];
    serviceProviderName = json['service_provider_name'];
    serviceProviderLogo = json['service_provider_logo'];
    time = json['time'];
  }
  String? message;
  String? name;
  String? serviceProviderName;
  String? serviceProviderLogo;
  String? time;
NotificationData copyWith({  String? message,
  String? name,
  String? serviceProviderName,
  String? serviceProviderLogo,
  String? time,
}) => NotificationData(  message: message ?? this.message,
  name: name ?? this.name,
  serviceProviderName: serviceProviderName ?? this.serviceProviderName,
  serviceProviderLogo: serviceProviderLogo ?? this.serviceProviderLogo,
  time: time ?? this.time,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['name'] = name;
    map['service_provider_name'] = serviceProviderName;
    map['service_provider_logo'] = serviceProviderLogo;
    map['time'] = time;
    return map;
  }

}