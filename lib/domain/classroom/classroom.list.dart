class ClassRoomList {
  String? id;
  String? teacherRegistrationId;
  String? classJoinCode;
  String? classTitle;
  String? courseCode;
  String? courseCredit;
  String? classStatus;
  String? classRoomNumber;
  String? teacherName;
  String? teacherEmail;
  String? institutionCode;
  Null? teacherContact;
  Null? totalStudent;
  Null? teacherLectureSheets;
  Null? crContact;
  Null? referenceBooks;
  Null? classObjectives;
  Null? classLink;
  List<Students>? students;
  Null? assignmentList;
  Null? examsList;
  Null? attendancesLIst;
  ClassCreationDateTime? classCreationDateTime;
  String? classCreatedBy;

  ClassRoomList(
      {this.id,
        this.teacherRegistrationId,
        this.classJoinCode,
        this.classTitle,
        this.courseCode,
        this.courseCredit,
        this.classStatus,
        this.classRoomNumber,
        this.teacherName,
        this.teacherEmail,
        this.institutionCode,
        this.teacherContact,
        this.totalStudent,
        this.teacherLectureSheets,
        this.crContact,
        this.referenceBooks,
        this.classObjectives,
        this.classLink,
        this.students,
        this.assignmentList,
        this.examsList,
        this.attendancesLIst,
        this.classCreationDateTime,
        this.classCreatedBy});

  ClassRoomList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherRegistrationId = json['teacherRegistrationId'];
    classJoinCode = json['classJoinCode'];
    classTitle = json['classTitle'];
    courseCode = json['courseCode'];
    courseCredit = json['courseCredit'];
    classStatus = json['classStatus'];
    classRoomNumber = json['classRoomNumber'];
    teacherName = json['teacherName'];
    teacherEmail = json['teacherEmail'];
    institutionCode = json['institutionCode'];
    teacherContact = json['teacherContact'];
    totalStudent = json['totalStudent'];
    teacherLectureSheets = json['teacherLectureSheets'];
    crContact = json['crContact'];
    referenceBooks = json['referenceBooks'];
    classObjectives = json['classObjectives'];
    classLink = json['classLink'];
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
    assignmentList = json['assignmentList'];
    examsList = json['examsList'];
    attendancesLIst = json['attendancesLIst'];
    classCreationDateTime = json['classCreationDateTime'] != null
        ? new ClassCreationDateTime.fromJson(json['classCreationDateTime'])
        : null;
    classCreatedBy = json['classCreatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['teacherRegistrationId'] = this.teacherRegistrationId;
    data['classJoinCode'] = this.classJoinCode;
    data['classTitle'] = this.classTitle;
    data['courseCode'] = this.courseCode;
    data['courseCredit'] = this.courseCredit;
    data['classStatus'] = this.classStatus;
    data['classRoomNumber'] = this.classRoomNumber;
    data['teacherName'] = this.teacherName;
    data['teacherEmail'] = this.teacherEmail;
    data['institutionCode'] = this.institutionCode;
    data['teacherContact'] = this.teacherContact;
    data['totalStudent'] = this.totalStudent;
    data['teacherLectureSheets'] = this.teacherLectureSheets;
    data['crContact'] = this.crContact;
    data['referenceBooks'] = this.referenceBooks;
    data['classObjectives'] = this.classObjectives;
    data['classLink'] = this.classLink;
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    data['assignmentList'] = this.assignmentList;
    data['examsList'] = this.examsList;
    data['attendancesLIst'] = this.attendancesLIst;
    if (this.classCreationDateTime != null) {
      data['classCreationDateTime'] = this.classCreationDateTime!.toJson();
    }
    data['classCreatedBy'] = this.classCreatedBy;
    return data;
  }
}

class Students {
  String? academicId;
  String? studentName;
  Null? institutionCode;
  Null? studentNote;

  Students(
      {this.academicId,
        this.studentName,
        this.institutionCode,
        this.studentNote});

  Students.fromJson(Map<String, dynamic> json) {
    academicId = json['academicId'];
    studentName = json['studentName'];
    institutionCode = json['institutionCode'];
    studentNote = json['studentNote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['academicId'] = this.academicId;
    data['studentName'] = this.studentName;
    data['institutionCode'] = this.institutionCode;
    data['studentNote'] = this.studentNote;
    return data;
  }
}

class ClassCreationDateTime {
  List<int>? localDateTime;
  String? localDateTimeString;
  String? localDateTimeStringAMPM;
  int? localDateTimeLong;
  String? dateString;
  int? dateLong;
  String? timeString;
  int? timeLong;

  ClassCreationDateTime(
      {this.localDateTime,
        this.localDateTimeString,
        this.localDateTimeStringAMPM,
        this.localDateTimeLong,
        this.dateString,
        this.dateLong,
        this.timeString,
        this.timeLong});

  ClassCreationDateTime.fromJson(Map<String, dynamic> json) {
    localDateTime = json['localDateTime'].cast<int>();
    localDateTimeString = json['localDateTimeString'];
    localDateTimeStringAMPM = json['localDateTimeStringAMPM'];
    localDateTimeLong = json['localDateTimeLong'];
    dateString = json['dateString'];
    dateLong = json['dateLong'];
    timeString = json['timeString'];
    timeLong = json['timeLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localDateTime'] = this.localDateTime;
    data['localDateTimeString'] = this.localDateTimeString;
    data['localDateTimeStringAMPM'] = this.localDateTimeStringAMPM;
    data['localDateTimeLong'] = this.localDateTimeLong;
    data['dateString'] = this.dateString;
    data['dateLong'] = this.dateLong;
    data['timeString'] = this.timeString;
    data['timeLong'] = this.timeLong;
    return data;
  }
}
