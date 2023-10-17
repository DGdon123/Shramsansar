/// display : "Mouse"
/// value : "Mouse"

class SelectSkillModel {
  SelectSkillModel({
      this.display, 
      this.value,});

  SelectSkillModel.fromJson(dynamic json) {
    display = json['display'];
    value = json['value'];
  }
  String? display;
  String? value;
SelectSkillModel copyWith({  String? display,
  String? value,
}) => SelectSkillModel(  display: display ?? this.display,
  value: value ?? this.value,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['display'] = display;
    map['value'] = value;
    return map;
  }

}