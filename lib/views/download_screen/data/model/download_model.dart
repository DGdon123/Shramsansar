// ignore_for_file: public_member_api_docs, sort_constructors_first
class DownloadModel {
  final int id;
  final String title;
  final String published_at;
  final String description;
  final String download_file;
  final String created_at;
  final String updated_at;
  DownloadModel({
    required this.id,
    required this.title,
    required this.published_at,
    required this.description,
    required this.download_file,
    required this.created_at,
    required this.updated_at,
  });
  factory DownloadModel.fromJson(Map<String, dynamic> json) {
    return DownloadModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        published_at: json["published_at"] ?? "",
        description: json["description"] ?? "",
        download_file: json["download_file"] ?? "",
        created_at: json["created_at"] ?? "",
        updated_at: json["updated_at"] ?? "");
  }
}
