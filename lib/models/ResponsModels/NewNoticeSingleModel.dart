/// id : 12
/// published_date : null
/// location : "Itahari"
/// title : "Campaign number 2 nepal and uae"
/// description : "<p>&nbsp;osdjfjdiskfja sdifj ldjslf&nbsp; hesfiuhsriufgn iuser fgiuhai fguhsdiufghaieworug flad iuf gaeriufg kruegfi ugsreiuf girsejbvi urwfhuaiwegrfuoiwheiou wdiouf gw4iug hfiuwd gf87w3iufg wdiou fgioure gfiuer ufiiuf vgfreio ug fvA meeting of a Joint Committee os taking place atday.nd Minister for Human Resources of the UAE, Dr Abdul Rahaman Abdul Manan Al Awar, would address the meeting in the inaugural session.ould lead the Nepali delegation in the meeting of technical group scheduled after the inaugural session.According to theview would be carried out on the implementation of the labour agreement signed between Nepal and the UAE in 2019.Discussion would be held on various issues including social securityeir safety in the workplace, arrangement of health service and insurance, skill development and increase in salary in the joint meeting.Similarly, the meeting would also held discussion to resolve problems of those Nepalis, who are in the UAE ind stranded there.Likewise, Minister Shrestha and Minister of the UAE, Dr Awar, are holding meeting today itself and discussion would be held on various issues related to safety and welfare of the Nepali workers.On the occasion, Minister Shrestha would discuss with his counterpart about the tourist visa and measures to resolve the problems created due to this, according to the Minister Shrestha&#39;s Secretariat.A Nepali delegation under the leadership of Minister Shrestha had left for the UAE on Monday. Nepali Ambassador to the UAE, Krishna Prasad Dhakal, welcomed the Nepali delegation at Abu Dhabi Airport.Minister Shrestha is scheduled to hold discussion with Nepali community regarding the problems facing by Nepali workers and measures to resolve it at the Nepali Embassy on Wednesday.</p>"
/// type : 1
/// type_name : "News"
/// file : "/notice/12/Test docx.docx"

class NewNoticeSingleModel {
  NewNoticeSingleModel({
      this.id, 
      this.publishedDate, 
      this.location, 
      this.title, 
      this.description, 
      this.type, 
      this.typeName, 
      this.file,});

  NewNoticeSingleModel.fromJson(dynamic json) {
    id = json['id'];
    publishedDate = json['published_date'];
    location = json['location'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    typeName = json['type_name'];
    file = json['file'];
  }
  num? id;
  dynamic publishedDate;
  String? location;
  String? title;
  String? description;
  num? type;
  String? typeName;
  String? file;
NewNoticeSingleModel copyWith({  num? id,
  dynamic publishedDate,
  String? location,
  String? title,
  String? description,
  num? type,
  String? typeName,
  String? file,
}) => NewNoticeSingleModel(  id: id ?? this.id,
  publishedDate: publishedDate ?? this.publishedDate,
  location: location ?? this.location,
  title: title ?? this.title,
  description: description ?? this.description,
  type: type ?? this.type,
  typeName: typeName ?? this.typeName,
  file: file ?? this.file,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['published_date'] = publishedDate;
    map['location'] = location;
    map['title'] = title;
    map['description'] = description;
    map['type'] = type;
    map['type_name'] = typeName;
    map['file'] = file;
    return map;
  }

}