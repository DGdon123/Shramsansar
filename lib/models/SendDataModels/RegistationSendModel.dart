/// name : "utsav"
/// email : "utsab@gmail.com"
/// password : "password"
/// password_confirmation : "password"
/// per_pradesh_id : 1
/// per_district_id : 1
/// per_muni_id : 1
/// per_ward : 1
/// pradesh_id : 1
/// district_id : 1
/// muni_id : 1
/// ward : 1
/// mobile : 9860831906

class RegistationSendModel {
  RegistationSendModel({
      this.name,
      this.email, 
      this.password, 
      this.passwordConfirmation, 
      this.perPradeshId, 
      this.perDistrictId, 
      this.perMuniId, 
      this.perWard, 
      this.pradeshId, 
      this.districtId, 
      this.muniId, 
      this.ward, 
      this.mobile,
      this.gender,
      this.preferenceJobCat,
      this.documentType
  });

  // RegistationSendModel.fromJson(dynamic json) {
  //   name = json['name'];
  //   email = json['email'];
  //   password = json['password'];
  //   passwordConfirmation = json['password_confirmation'];
  //   perPradeshId = json['per_pradesh_id'];
  //   perDistrictId = json['per_district_id'];
  //   perMuniId = json['per_muni_id'];
  //   perWard = json['per_ward'];
  //   pradeshId = json['pradesh_id'];
  //   districtId = json['district_id'];
  //   muniId = json['muni_id'];
  //   ward = json['ward'];
  //   mobile = json['mobile'];
  //   gender = json['gender'];
  //   preferenceJobCat = json['preference_job_cat[0]'];
  //   documentType = json['document_type'];
  // }






  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  int? perPradeshId;
  int? perDistrictId;
  int? perMuniId;
  int? perWard;
  int? pradeshId;
  int? districtId;
  int? muniId;
  int? ward;
  int? mobile;
  int? gender;
  String? preferenceJobCat;
  String? documentType;

RegistationSendModel copyWith({  String? name,
  String? email,
  String? password,
  String? passwordConfirmation,
  int? perPradeshId,
  int? perDistrictId,
  int? perMuniId,
  int? perWard,
  int? pradeshId,
  int? districtId,
  int? muniId,
  int? ward,
  int? mobile,
  int? gender,
  String? preferenceJobCat,
  String? documentType,
}) => RegistationSendModel(
  name: name ?? this.name,
  email: email ?? this.email,
  password: password ?? this.password,
  passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
  perPradeshId: perPradeshId ?? this.perPradeshId,
  perDistrictId: perDistrictId ?? this.perDistrictId,
  perMuniId: perMuniId ?? this.perMuniId,
  perWard: perWard ?? this.perWard,
  pradeshId: pradeshId ?? this.pradeshId,
  districtId: districtId ?? this.districtId,
  muniId: muniId ?? this.muniId,
  ward: ward ?? this.ward,
  mobile: mobile ?? this.mobile,
  gender: gender ?? this.gender,
  preferenceJobCat: preferenceJobCat ?? this.preferenceJobCat,
  documentType: documentType ?? this.documentType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['password_confirmation'] = passwordConfirmation;
    map['per_pradesh_id'] = perPradeshId;
    map['per_district_id'] = perDistrictId;
    map['per_muni_id'] = perMuniId;
    map['per_ward'] = perWard;
    map['pradesh_id'] = pradeshId;
    map['district_id'] = districtId;
    map['muni_id'] = muniId;
    map['ward'] = ward;
    map['mobile'] = mobile;
    map['gender'] = gender;
    map['preference_job_cat'] = preferenceJobCat;
    map['document_type'] = documentType;
    return map;
  }

}