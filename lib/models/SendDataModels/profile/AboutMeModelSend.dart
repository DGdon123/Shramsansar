class AboutMeModelSend {
  AboutMeModelSend({
    this.aboutMe,});

  AboutMeModelSend.fromJson(dynamic json) {
    aboutMe = json['about_me'];
  }
  String? aboutMe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['about_me'] = aboutMe;
    return map;
  }

}