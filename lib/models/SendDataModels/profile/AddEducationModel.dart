/// level_id : 2
/// program : "program"
/// board : "board"
/// institute : "institute"
/// graduation_year : "graduation_year"
/// marks_secured : "sdf"

class AddEducationModel {
  AddEducationModel({
      this.levelId, 
      this.program, 
      this.board, 
      this.institute, 
      this.graduationYear, 
      this.marksSecured,});

  AddEducationModel.fromJson(dynamic json) {
    levelId = json['level_id'];
    program = json['program'];
    board = json['board'];
    institute = json['institute'];
    graduationYear = json['graduation_year'];
    marksSecured = json['marks_secured'];
  }
  String? levelId;
  String? program;
  String? board;
  String? institute;
  String? graduationYear;
  String? marksSecured;
AddEducationModel copyWith({  String? levelId,
  String? program,
  String? board,
  String? institute,
  String? graduationYear,
  String? marksSecured,
}) => AddEducationModel(  levelId: levelId ?? this.levelId,
  program: program ?? this.program,
  board: board ?? this.board,
  institute: institute ?? this.institute,
  graduationYear: graduationYear ?? this.graduationYear,
  marksSecured: marksSecured ?? this.marksSecured,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['level_id'] = levelId;
    map['program'] = program;
    map['board'] = board;
    map['institute'] = institute;
    map['graduation_year'] = graduationYear;
    map['marks_secured'] = marksSecured;
    return map;
  }

}