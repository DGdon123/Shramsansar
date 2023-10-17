/// data : {"id":13,"name":"kundan","per_pradesh_id":1,"per_pradesh_name":"प्रदेश नं. १","per_district_id":1,"per_district_name":"ताप्लेजुङ","per_muni_id":1,"per_muni_name":"फुङ्लिङ नगरपालिका","per_ward":"1","pradesh_id":1,"temp_pradesh_name":"प्रदेश नं. १","district_id":1,"temp_district_name":"ताप्लेजुङ","muni_id":1,"temp_muni_name":"फुङ्लिङ नगरपालिका","ward":"1","dob":"2006-01-01","preference_job_cat":null,"gender":"पुरुष","mobile":"123456789","phone":"01733887657","citizenship_no":"1234546","expected_salary":"2500","ethnicity_type":"4","ethnicity_name":"नेवार","differently_able":1,"migrant_worker":1,"minority_group":1,"file":"/profilePicture/13/app_icon.png","educations":[{"id":3,"level_id":1,"level_name":"डाक्टरेट","program":"csit","board":"csit","institute":"csit","graduation_year":"2022-02-02","marks_secured":"10","levels":{"id":1,"name":"डाक्टरेट"}}],"experiences":[{"id":5,"organization":"youngMinds Pvt Ltd","location":"birtamode","title":"experience1","is_currently_working":0,"start_date":"2022-10-15","end_date":"2022-10-20","reference_name":"diwakar","reference_contact":"9842706856","file":"/experience/13/5/app_icon.png"}],"trainings":[{"title":"YM training","provider":"youngminds","duration":"2 month","year":"2015-10-20","details":"Young minds Creation kathmandu Nepal"}],"languages":[{"id":2,"language_name":"english","language_rating_speaking":"1","language_rating_reading":"2","language_rating_writing":"3","language_rating_listening":"4"}],"locations":[{"id":3,"location":"kathmandu","per_pradesh_id":1,"pradesh_name":"प्रदेश नं. १","per_district_id":1,"district_name":"ताप्लेजुङ","per_muni_id":1,"muni_name":"फुङ्लिङ नगरपालिका"},{"id":4,"location":"kathmandu","per_pradesh_id":1,"pradesh_name":"प्रदेश नं. १","per_district_id":1,"district_name":"ताप्लेजुङ","per_muni_id":1,"muni_name":"फुङ्लिङ नगरपालिका"}],"socialAccounts":[{"id":5,"name":"Instagram","url":"jhjhj"},{"id":6,"name":"Twitter","url":"qwqwq"},{"id":7,"name":"YouTube","url":"dsd"}],"specialization":{"id":1,"specialization":"In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available"},"aboutYourself":{"id":2,"description":"In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available"},"skills":[{"id":8,"skill_id":1,"skill_name":"ऑफिस मैसेंजर"},{"id":9,"skill_id":2,"skill_name":"स्टोर कीपर"},{"id":10,"skill_id":3,"skill_name":"ऑफिस रनर"},{"id":11,"skill_id":1,"skill_name":"ऑफिस मैसेंजर"},{"id":12,"skill_id":2,"skill_name":"स्टोर कीपर"},{"id":13,"skill_id":3,"skill_name":"ऑफिस रनर"}]}

class MyProfileModel {
  MyProfileModel({
    this.data,
  });

  MyProfileModel.fromJson(dynamic json) {
    data = json['data'] != null ? MyProfileData.fromJson(json['data']) : null;
  }
  MyProfileData? data;
  MyProfileModel copyWith({
    MyProfileData? data,
  }) =>
      MyProfileModel(
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class MyProfileData {
  MyProfileData({
    this.id,
    this.name,
    this.email,
    this.perPradeshId,
    this.perPradeshName,
    this.perDistrictId,
    this.perDistrictName,
    this.perMuniId,
    this.perMuniName,
    this.perWard,
    this.pradeshId,
    this.tempPradeshName,
    this.districtId,
    this.tempDistrictName,
    this.muniId,
    this.tempMuniName,
    this.ward,
    this.dob,
    this.preferenceJobCat,
    this.gender,
    this.mobile,
    this.phone,
    this.otherSkills,
    this.citizenshipNo,
    this.expectedSalary,
    this.ethnicityType,
    this.ethnicityName,
    this.differentlyAble,
    this.migrantWorker,
    this.minorityGroup,
    this.file,
    this.jobseekerPreferenceCategory,
    this.educations,
    this.experiences,
    this.trainings,
    this.languages,
    this.locations,
    this.socialAccounts,
    this.specialization,
    this.aboutYourself,
    this.skills,
  });

  MyProfileData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    perPradeshId = json['per_pradesh_id'];
    perPradeshName = json['per_pradesh_name'];
    perDistrictId = json['per_district_id'];
    perDistrictName = json['per_district_name'];
    perMuniId = json['per_muni_id'];
    perMuniName = json['per_muni_name'];
    perWard = json['per_ward'];
    pradeshId = json['pradesh_id'];
    tempPradeshName = json['temp_pradesh_name'];
    districtId = json['district_id'];
    tempDistrictName = json['temp_district_name'];
    muniId = json['muni_id'];
    tempMuniName = json['temp_muni_name'];
    ward = json['ward'];
    dob = json['dob'];
    preferenceJobCat = json['preference_job_cat'];
    gender = json['gender'];
    mobile = json['mobile'];
    phone = json['phone'];
    otherSkills = json["other_skills"] ;
    citizenshipNo = json['citizenship_no'];
    expectedSalary = json['expected_salary'];
    ethnicityType = json['ethnicity_type'];
    ethnicityName = json['ethnicity_name'];
    differentlyAble = json['differently_able'];
    migrantWorker = json['migrant_worker'];
    minorityGroup = json['minority_group'];
    file = json['file'];
    if (json['jobseeker_preference_category'] != null) {
      jobseekerPreferenceCategory = [];
      json['jobseeker_preference_category'].forEach((v) {
        jobseekerPreferenceCategory
            ?.add(JobseekerPreferenceCategory.fromJson(v));
      });
    }
    if (json['educations'] != null) {
      educations = [];
      json['educations'].forEach((v) {
        educations?.add(Educations.fromJson(v));
      });
    }
    if (json['experiences'] != null) {
      experiences = [];
      json['experiences'].forEach((v) {
        experiences?.add(Experiences.fromJson(v));
      });
    }
    if (json['trainings'] != null) {
      trainings = [];
      json['trainings'].forEach((v) {
        trainings?.add(Trainings.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      languages = [];
      json['languages'].forEach((v) {
        languages?.add(Languages.fromJson(v));
      });
    }
    if (json['locations'] != null) {
      locations = [];
      json['locations'].forEach((v) {
        locations?.add(Locations.fromJson(v));
      });
    }
    if (json['socialAccounts'] != null) {
      socialAccounts = [];
      json['socialAccounts'].forEach((v) {
        socialAccounts?.add(SocialAccounts.fromJson(v));
      });
    }
    specialization = json['specialization'] != null
        ? Specialization.fromJson(json['specialization'])
        : null;
    aboutYourself = json['aboutYourself'] != null
        ? AboutYourself.fromJson(json['aboutYourself'])
        : null;
    if (json['skills'] != null) {
      skills = [];
      json['skills'].forEach((v) {
        skills?.add(Skills.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? email;
  int? perPradeshId;
  String? perPradeshName;
  int? perDistrictId;
  String? perDistrictName;
  int? perMuniId;
  String? perMuniName;
  String? perWard;
  int? pradeshId;
  String? tempPradeshName;
  int? districtId;
  String? tempDistrictName;
  int? muniId;
  String? tempMuniName;
  String? ward;
  String? dob;
  dynamic preferenceJobCat;
  String? gender;
  String? mobile;
  String? phone;

  String? otherSkills;
  String? citizenshipNo;
  String? expectedSalary;
  String? ethnicityType;
  String? ethnicityName;
  int? differentlyAble;
  int? migrantWorker;
  int? minorityGroup;
  String? file;
  List<JobseekerPreferenceCategory>? jobseekerPreferenceCategory;
  List<Educations>? educations;
  List<Experiences>? experiences;
  List<Trainings>? trainings;
  List<Languages>? languages;
  List<Locations>? locations;
  List<SocialAccounts>? socialAccounts;
  Specialization? specialization;
  AboutYourself? aboutYourself;
  List<Skills>? skills;
  MyProfileData copyWith({
    int? id,
    String? name,
    String? email,
    int? perPradeshId,
    String? perPradeshName,
    int? perDistrictId,
    String? perDistrictName,
    int? perMuniId,
    String? perMuniName,
    String? perWard,
    int? pradeshId,
    String? tempPradeshName,
    int? districtId,
    String? tempDistrictName,
    int? muniId,
    String? tempMuniName,
    String? ward,
    String? dob,
    dynamic preferenceJobCat,
    String? gender,
    String? mobile,
    String? phone,
    String? otherSkills,
    String? citizenshipNo,
    String? expectedSalary,
    String? ethnicityType,
    String? ethnicityName,
    int? differentlyAble,
    int? migrantWorker,
    int? minorityGroup,
    String? file,
    List<JobseekerPreferenceCategory>? jobseekerPreferenceCategory,
    List<Educations>? educations,
    List<Experiences>? experiences,
    List<Trainings>? trainings,
    List<Languages>? languages,
    List<Locations>? locations,
    List<SocialAccounts>? socialAccounts,
    Specialization? specialization,
    AboutYourself? aboutYourself,
    List<Skills>? skills,
  }) =>
      MyProfileData(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        perPradeshId: perPradeshId ?? this.perPradeshId,
        perPradeshName: perPradeshName ?? this.perPradeshName,
        perDistrictId: perDistrictId ?? this.perDistrictId,
        perDistrictName: perDistrictName ?? this.perDistrictName,
        perMuniId: perMuniId ?? this.perMuniId,
        perMuniName: perMuniName ?? this.perMuniName,
        perWard: perWard ?? this.perWard,
        pradeshId: pradeshId ?? this.pradeshId,
        tempPradeshName: tempPradeshName ?? this.tempPradeshName,
        districtId: districtId ?? this.districtId,
        tempDistrictName: tempDistrictName ?? this.tempDistrictName,
        muniId: muniId ?? this.muniId,
        tempMuniName: tempMuniName ?? this.tempMuniName,
        ward: ward ?? this.ward,
        dob: dob ?? this.dob,
        preferenceJobCat: preferenceJobCat ?? this.preferenceJobCat,
        gender: gender ?? this.gender,
        mobile: mobile ?? this.mobile,
        phone: phone ?? this.phone,
        otherSkills: otherSkills ?? this.otherSkills,
        citizenshipNo: citizenshipNo ?? this.citizenshipNo,
        expectedSalary: expectedSalary ?? this.expectedSalary,
        ethnicityType: ethnicityType ?? this.ethnicityType,
        ethnicityName: ethnicityName ?? this.ethnicityName,
        differentlyAble: differentlyAble ?? this.differentlyAble,
        migrantWorker: migrantWorker ?? this.migrantWorker,
        minorityGroup: minorityGroup ?? this.minorityGroup,
        file: file ?? this.file,
        jobseekerPreferenceCategory:
            jobseekerPreferenceCategory ?? this.jobseekerPreferenceCategory,
        educations: educations ?? this.educations,
        experiences: experiences ?? this.experiences,
        trainings: trainings ?? this.trainings,
        languages: languages ?? this.languages,
        locations: locations ?? this.locations,
        socialAccounts: socialAccounts ?? this.socialAccounts,
        specialization: specialization ?? this.specialization,
        aboutYourself: aboutYourself ?? this.aboutYourself,
        skills: skills ?? this.skills,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['per_pradesh_id'] = perPradeshId;
    map['per_pradesh_name'] = perPradeshName;
    map['per_district_id'] = perDistrictId;
    map['per_district_name'] = perDistrictName;
    map['per_muni_id'] = perMuniId;
    map['per_muni_name'] = perMuniName;
    map['per_ward'] = perWard;
    map['pradesh_id'] = pradeshId;
    map['temp_pradesh_name'] = tempPradeshName;
    map['district_id'] = districtId;
    map['temp_district_name'] = tempDistrictName;
    map['muni_id'] = muniId;
    map['temp_muni_name'] = tempMuniName;
    map['ward'] = ward;
    map['dob'] = dob;
    map['preference_job_cat'] = preferenceJobCat;
    map['gender'] = gender;
    map['mobile'] = mobile;
    map["other_skills"] = otherSkills;
    map['phone'] = phone;
    map['citizenship_no'] = citizenshipNo;
    map['expected_salary'] = expectedSalary;
    map['ethnicity_type'] = ethnicityType;
    map['ethnicity_name'] = ethnicityName;
    map['differently_able'] = differentlyAble;
    map['migrant_worker'] = migrantWorker;
    map['minority_group'] = minorityGroup;
    map['file'] = file;
    if (jobseekerPreferenceCategory != null) {
      map['jobseeker_preference_category'] =
          jobseekerPreferenceCategory?.map((v) => v.toJson()).toList();
    }
    if (educations != null) {
      map['educations'] = educations?.map((v) => v.toJson()).toList();
    }
    if (experiences != null) {
      map['experiences'] = experiences?.map((v) => v.toJson()).toList();
    }
    if (trainings != null) {
      map['trainings'] = trainings?.map((v) => v.toJson()).toList();
    }
    if (languages != null) {
      map['languages'] = languages?.map((v) => v.toJson()).toList();
    }
    if (locations != null) {
      map['locations'] = locations?.map((v) => v.toJson()).toList();
    }
    if (socialAccounts != null) {
      map['socialAccounts'] = socialAccounts?.map((v) => v.toJson()).toList();
    }
    if (specialization != null) {
      map['specialization'] = specialization?.toJson();
    }
    if (aboutYourself != null) {
      map['aboutYourself'] = aboutYourself?.toJson();
    }
    if (skills != null) {
      map['skills'] = skills?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 8
/// skill_id : 1
/// skill_name : "ऑफिस मैसेंजर"

class Skills {
  Skills({
    this.id,
    this.skillId,
    this.skillName,
  });

  Skills.fromJson(dynamic json) {
    id = json['id'];
    skillId = json['skill_id'];
    skillName = json['skill_name'];
  }
  int? id;
  int? skillId;
  String? skillName;
  Skills copyWith({
    int? id,
    int? skillId,
    String? skillName,
  }) =>
      Skills(
        id: id ?? this.id,
        skillId: skillId ?? this.skillId,
        skillName: skillName ?? this.skillName,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['skill_id'] = skillId;
    map['skill_name'] = skillName;
    return map;
  }
}

/// id : 2
/// description : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available"

class AboutYourself {
  AboutYourself({
    this.id,
    this.description,
  });

  AboutYourself.fromJson(dynamic json) {
    id = json['id'];
    description = json['description'];
  }
  int? id;
  String? description;
  AboutYourself copyWith({
    int? id,
    String? description,
  }) =>
      AboutYourself(
        id: id ?? this.id,
        description: description ?? this.description,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['description'] = description;
    return map;
  }
}

/// id : 1
/// specialization : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available"

class Specialization {
  Specialization({
    this.id,
    this.specialization,
  });

  Specialization.fromJson(dynamic json) {
    id = json['id'];
    specialization = json['specialization'];
  }
  int? id;
  String? specialization;
  Specialization copyWith({
    int? id,
    String? specialization,
  }) =>
      Specialization(
        id: id ?? this.id,
        specialization: specialization ?? this.specialization,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['specialization'] = specialization;
    return map;
  }
}

/// id : 5
/// name : "Instagram"
/// url : "jhjhj"

class SocialAccounts {
  SocialAccounts({
    this.id,
    this.name,
    this.url,
  });

  SocialAccounts.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }
  int? id;
  String? name;
  String? url;
  SocialAccounts copyWith({
    int? id,
    String? name,
    String? url,
  }) =>
      SocialAccounts(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    return map;
  }
}

/// id : 3
/// location : "kathmandu"
/// per_pradesh_id : 1
/// pradesh_name : "प्रदेश नं. १"
/// per_district_id : 1
/// district_name : "ताप्लेजुङ"
/// per_muni_id : 1
/// muni_name : "फुङ्लिङ नगरपालिका"

class Locations {
  Locations({
    this.id,
    this.location,
    this.perPradeshId,
    this.pradeshName,
    this.perDistrictId,
    this.districtName,
    this.perMuniId,
    this.muniName,
  });

  Locations.fromJson(dynamic json) {
    id = json['id'];
    location = json['location'];
    perPradeshId = json['per_pradesh_id'];
    pradeshName = json['pradesh_name'];
    perDistrictId = json['per_district_id'];
    districtName = json['district_name'];
    perMuniId = json['per_muni_id'];
    muniName = json['muni_name'];
  }
  int? id;
  String? location;
  int? perPradeshId;
  String? pradeshName;
  int? perDistrictId;
  String? districtName;
  int? perMuniId;
  String? muniName;
  Locations copyWith({
    int? id,
    String? location,
    int? perPradeshId,
    String? pradeshName,
    int? perDistrictId,
    String? districtName,
    int? perMuniId,
    String? muniName,
  }) =>
      Locations(
        id: id ?? this.id,
        location: location ?? this.location,
        perPradeshId: perPradeshId ?? this.perPradeshId,
        pradeshName: pradeshName ?? this.pradeshName,
        perDistrictId: perDistrictId ?? this.perDistrictId,
        districtName: districtName ?? this.districtName,
        perMuniId: perMuniId ?? this.perMuniId,
        muniName: muniName ?? this.muniName,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['location'] = location;
    map['per_pradesh_id'] = perPradeshId;
    map['pradesh_name'] = pradeshName;
    map['per_district_id'] = perDistrictId;
    map['district_name'] = districtName;
    map['per_muni_id'] = perMuniId;
    map['muni_name'] = muniName;
    return map;
  }
}

/// id : 2
/// language_name : "english"
/// language_rating_speaking : "1"
/// language_rating_reading : "2"
/// language_rating_writing : "3"
/// language_rating_listening : "4"

class Languages {
  Languages({
    this.id,
    this.languageName,
    this.languageRatingSpeaking,
    this.languageRatingReading,
    this.languageRatingWriting,
    this.languageRatingListening,
  });

  Languages.fromJson(dynamic json) {
    id = json['id'];
    languageName = json['language_name'];
    languageRatingSpeaking = json['language_rating_speaking'];
    languageRatingReading = json['language_rating_reading'];
    languageRatingWriting = json['language_rating_writing'];
    languageRatingListening = json['language_rating_listening'];
  }
  int? id;
  String? languageName;
  String? languageRatingSpeaking;
  String? languageRatingReading;
  String? languageRatingWriting;
  String? languageRatingListening;
  Languages copyWith({
    int? id,
    String? languageName,
    String? languageRatingSpeaking,
    String? languageRatingReading,
    String? languageRatingWriting,
    String? languageRatingListening,
  }) =>
      Languages(
        id: id ?? this.id,
        languageName: languageName ?? this.languageName,
        languageRatingSpeaking:
            languageRatingSpeaking ?? this.languageRatingSpeaking,
        languageRatingReading:
            languageRatingReading ?? this.languageRatingReading,
        languageRatingWriting:
            languageRatingWriting ?? this.languageRatingWriting,
        languageRatingListening:
            languageRatingListening ?? this.languageRatingListening,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['language_name'] = languageName;
    map['language_rating_speaking'] = languageRatingSpeaking;
    map['language_rating_reading'] = languageRatingReading;
    map['language_rating_writing'] = languageRatingWriting;
    map['language_rating_listening'] = languageRatingListening;
    return map;
  }
}

/// title : "YM training"
/// provider : "youngminds"
/// duration : "2 month"
/// year : "2015-10-20"
/// details : "Young minds Creation kathmandu Nepal"

class Trainings {
  Trainings({
    this.id,
    this.title,
    this.provider,
    this.duration,
    this.year,
    this.details,
    this.file,
  });

  Trainings.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    provider = json['provider'];
    duration = json['duration'];
    year = json['year'];
    details = json['details'];
    file = json['file'];
  }
  int? id;
  String? title;
  String? provider;
  String? duration;
  String? year;
  String? details;
  String? file;
  Trainings copyWith({
    int? id,
    String? title,
    String? provider,
    String? duration,
    String? year,
    String? details,
    String? file,
  }) =>
      Trainings(
        id: id ?? this.id,
        title: title ?? this.title,
        provider: provider ?? this.provider,
        duration: duration ?? this.duration,
        year: year ?? this.year,
        details: details ?? this.details,
        file: file ?? this.file,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['provider'] = provider;
    map['duration'] = duration;
    map['year'] = year;
    map['details'] = details;
    map['file'] = file;
    return map;
  }
}

/// id : 5
/// organization : "youngMinds Pvt Ltd"
/// location : "birtamode"
/// title : "experience1"
/// is_currently_working : 0
/// start_date : "2022-10-15"
/// end_date : "2022-10-20"
/// reference_name : "diwakar"
/// reference_contact : "9842706856"
/// file : "/experience/13/5/app_icon.png"

class Experiences {
  Experiences({
    this.id,
    this.organization,
    this.location,
    this.title,
    this.isCurrentlyWorking,
    this.startDate,
    this.endDate,
    this.referenceName,
    this.referenceContact,
    this.file,
  });

  Experiences.fromJson(dynamic json) {
    id = json['id'];
    organization = json['organization'];
    location = json['location'];
    title = json['title'];
    isCurrentlyWorking = json['is_currently_working'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    referenceName = json['reference_name'];
    referenceContact = json['reference_contact'];
    file = json['file'];
  }
  int? id;
  String? organization;
  String? location;
  String? title;
  int? isCurrentlyWorking;
  String? startDate;
  String? endDate;
  String? referenceName;
  String? referenceContact;
  String? file;
  List<JobseekerPreferenceCategory>? jobseekerPreferenceCategory;
  Experiences copyWith({
    int? id,
    String? organization,
    String? location,
    String? title,
    int? isCurrentlyWorking,
    String? startDate,
    String? endDate,
    String? referenceName,
    String? referenceContact,
    String? file,
  }) =>
      Experiences(
        id: id ?? this.id,
        organization: organization ?? this.organization,
        location: location ?? this.location,
        title: title ?? this.title,
        isCurrentlyWorking: isCurrentlyWorking ?? this.isCurrentlyWorking,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        referenceName: referenceName ?? this.referenceName,
        referenceContact: referenceContact ?? this.referenceContact,
        file: file ?? this.file,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['organization'] = organization;
    map['location'] = location;
    map['title'] = title;
    map['is_currently_working'] = isCurrentlyWorking;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    map['reference_name'] = referenceName;
    map['reference_contact'] = referenceContact;
    map['file'] = file;
    return map;
  }
}

/// id : 3
/// level_id : 1
/// level_name : "डाक्टरेट"
/// program : "csit"
/// board : "csit"
/// institute : "csit"
/// graduation_year : "2022-02-02"
/// marks_secured : "10"
/// levels : {"id":1,"name":"डाक्टरेट"}

class Educations {
  Educations({
    this.id,
    this.levelId,
    this.levelName,
    this.program,
    this.board,
    this.institute,
    this.graduationYear,
    this.marksSecured,
    this.levels,
  });

  Educations.fromJson(dynamic json) {
    id = json['id'];
    levelId = json['level_id'];
    levelName = json['level_name'];
    program = json['program'];
    board = json['board'];
    institute = json['institute'];
    graduationYear = json['graduation_year'];
    marksSecured = json['marks_secured'];
    levels = json['levels'] != null ? Levels.fromJson(json['levels']) : null;
  }
  int? id;
  int? levelId;
  String? levelName;
  String? program;
  String? board;
  String? institute;
  String? graduationYear;
  String? marksSecured;
  Levels? levels;
  Educations copyWith({
    int? id,
    int? levelId,
    String? levelName,
    String? program,
    String? board,
    String? institute,
    String? graduationYear,
    String? marksSecured,
    Levels? levels,
  }) =>
      Educations(
        id: id ?? this.id,
        levelId: levelId ?? this.levelId,
        levelName: levelName ?? this.levelName,
        program: program ?? this.program,
        board: board ?? this.board,
        institute: institute ?? this.institute,
        graduationYear: graduationYear ?? this.graduationYear,
        marksSecured: marksSecured ?? this.marksSecured,
        levels: levels ?? this.levels,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['level_id'] = levelId;
    map['level_name'] = levelName;
    map['program'] = program;
    map['board'] = board;
    map['institute'] = institute;
    map['graduation_year'] = graduationYear;
    map['marks_secured'] = marksSecured;
    if (levels != null) {
      map['levels'] = levels?.toJson();
    }
    return map;
  }
}

/// id : 1
/// name : "डाक्टरेट"

class Levels {
  Levels({
    this.id,
    this.name,
  });

  Levels.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;
  Levels copyWith({
    int? id,
    String? name,
  }) =>
      Levels(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

/// id : 41
/// category_id : "2"
/// category_name : "ऑउटडोर्स सेल्स बोय"

class JobseekerPreferenceCategory {
  JobseekerPreferenceCategory({
    this.id,
    this.categoryId,
    this.categoryName,
  });

  JobseekerPreferenceCategory.fromJson(dynamic json) {
    id = json['id'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }
  int? id;
  String? categoryId;
  String? categoryName;
  JobseekerPreferenceCategory copyWith({
    int? id,
    String? categoryId,
    String? categoryName,
  }) =>
      JobseekerPreferenceCategory(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_id'] = categoryId;
    map['category_name'] = categoryName;
    return map;
  }
}
