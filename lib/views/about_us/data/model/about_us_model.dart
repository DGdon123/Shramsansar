class AboutUsModel {
  final String aboutUs;
  AboutUsModel({
    required this.aboutUs,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(aboutUs: json["about_us"] ?? "");
  }
}
