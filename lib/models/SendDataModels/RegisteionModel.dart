/// name : "utsav11"
/// email : "utsab212@gmail.com"
/// password : "password"
/// password_confirmation : "password"
/// per_pradesh_id : 1
/// per_district_id : 1
/// gender : "1"
/// per_muni_id : 1
/// per_ward : 1
/// pradesh_id : 1
/// district_id : 1
/// muni_id : 1
/// ward : 1
/// mobile : 9860831906

class RegisteionModel {
  RegisteionModel({
      String? name, 
      String? email, 
      String? password, 
      String? passwordConfirmation, 
      num? perPradeshId, 
      num? perDistrictId, 
      String? gender, 
      num? perMuniId, 
      num? perWard, 
      num? pradeshId, 
      num? districtId, 
      num? muniId, 
      num? ward, 
      num? mobile,}){
    _name = name;
    _email = email;
    _password = password;
    _passwordConfirmation = passwordConfirmation;
    _perPradeshId = perPradeshId;
    _perDistrictId = perDistrictId;
    _gender = gender;
    _perMuniId = perMuniId;
    _perWard = perWard;
    _pradeshId = pradeshId;
    _districtId = districtId;
    _muniId = muniId;
    _ward = ward;
    _mobile = mobile;
}

  RegisteionModel.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _passwordConfirmation = json['password_confirmation'];
    _perPradeshId = json['per_pradesh_id'];
    _perDistrictId = json['per_district_id'];
    _gender = json['gender'];
    _perMuniId = json['per_muni_id'];
    _perWard = json['per_ward'];
    _pradeshId = json['pradesh_id'];
    _districtId = json['district_id'];
    _muniId = json['muni_id'];
    _ward = json['ward'];
    _mobile = json['mobile'];
  }
  String? _name;
  String? _email;
  String? _password;
  String? _passwordConfirmation;
  num? _perPradeshId;
  num? _perDistrictId;
  String? _gender;
  num? _perMuniId;
  num? _perWard;
  num? _pradeshId;
  num? _districtId;
  num? _muniId;
  num? _ward;
  num? _mobile;
RegisteionModel copyWith({  String? name,
  String? email,
  String? password,
  String? passwordConfirmation,
  num? perPradeshId,
  num? perDistrictId,
  String? gender,
  num? perMuniId,
  num? perWard,
  num? pradeshId,
  num? districtId,
  num? muniId,
  num? ward,
  num? mobile,
}) => RegisteionModel(  name: name ?? _name,
  email: email ?? _email,
  password: password ?? _password,
  passwordConfirmation: passwordConfirmation ?? _passwordConfirmation,
  perPradeshId: perPradeshId ?? _perPradeshId,
  perDistrictId: perDistrictId ?? _perDistrictId,
  gender: gender ?? _gender,
  perMuniId: perMuniId ?? _perMuniId,
  perWard: perWard ?? _perWard,
  pradeshId: pradeshId ?? _pradeshId,
  districtId: districtId ?? _districtId,
  muniId: muniId ?? _muniId,
  ward: ward ?? _ward,
  mobile: mobile ?? _mobile,
);
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  String? get passwordConfirmation => _passwordConfirmation;
  num? get perPradeshId => _perPradeshId;
  num? get perDistrictId => _perDistrictId;
  String? get gender => _gender;
  num? get perMuniId => _perMuniId;
  num? get perWard => _perWard;
  num? get pradeshId => _pradeshId;
  num? get districtId => _districtId;
  num? get muniId => _muniId;
  num? get ward => _ward;
  num? get mobile => _mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['password_confirmation'] = _passwordConfirmation;
    map['per_pradesh_id'] = _perPradeshId;
    map['per_district_id'] = _perDistrictId;
    map['gender'] = _gender;
    map['per_muni_id'] = _perMuniId;
    map['per_ward'] = _perWard;
    map['pradesh_id'] = _pradeshId;
    map['district_id'] = _districtId;
    map['muni_id'] = _muniId;
    map['ward'] = _ward;
    map['mobile'] = _mobile;
    return map;
  }

}