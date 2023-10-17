/// email : "susandeep@gmail.com"

class ForgetPasswordSendModel {
  ForgetPasswordSendModel({this.email,});

  ForgetPasswordSendModel.fromJson(dynamic json) {
    email = json['email'];
  }

  String? email;

ForgetPasswordSendModel copyWith({  String? email,
}) => ForgetPasswordSendModel(  email: email ?? this.email,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }

}