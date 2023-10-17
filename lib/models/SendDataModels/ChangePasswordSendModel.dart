class ChangePasswordSendModel {
  ChangePasswordSendModel({
       this.currentpassword,
       this.password,
       this.passwordConfirmation,});

  ChangePasswordSendModel.fromJson(dynamic json) {
    currentpassword = json['current-password'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }
  String? currentpassword;
  String? password;
  String? passwordConfirmation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current-password'] = currentpassword;
    map['password'] = password;
    map['password_confirmation'] = passwordConfirmation;
    return map;
  }

}