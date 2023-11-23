import 'package:smuctian/domain/model_interface.dart';

class Profile implements Model{
  int? status;
  String? message;
  UserInfo? userInfo;
  Profile();

  @override
  Profile.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userInfo = json['user_info'] != null
        ? UserInfo.fromJson(json['user_info'])
        : null;
  }


 @override
 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data ={};
   data['status'] = status;
   data['message'] = message;
   if (userInfo != null) {
     data['user_info'] = userInfo!.toJson();
   }
   return data;
 }
}

class UserInfo {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? phoneNumber;
  String? phoneCode;
  String? loginMedium;
  int? isVerified;
  int? isPhoneVerified;
  int? isEmailVerified;
  String? temporaryToken;
  String? kycVerification;
  String? fatherName;
  String? motherName;
  String? dateOfBirth;
  String? age;
  String? maritalStatus;
  String? permanentVillage;
  String? permanentDistrict;
  String? permanentThana;
  String? addressOfWorkPlace;
  String? religion;
  String? occupation;
  String? educationalQualification;
  String? nid;
  String? passport;
  int? profileCompleted;
  int? isActive;
  String? otp;
  List<String>? fileManager;
  String? emergencyContact;
  List<String>? member;

  UserInfo(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.phoneNumber,
        this.phoneCode,
        this.loginMedium,
        this.isVerified,
        this.isPhoneVerified,
        this.isEmailVerified,
        this.temporaryToken,
        this.kycVerification,
        this.fatherName,
        this.motherName,
        this.dateOfBirth,
        this.age,
        this.maritalStatus,
        this.permanentVillage,
        this.permanentDistrict,
        this.permanentThana,
        this.addressOfWorkPlace,
        this.religion,
        this.occupation,
        this.educationalQualification,
        this.nid,
        this.passport,
        this.profileCompleted,
        this.isActive,
        this.otp,
        this.fileManager,
        this.emergencyContact,
        this.member});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phoneNumber = json['phone_number'];
    phoneCode = json['phone_code'];
    loginMedium = json['login_medium'];
    isVerified = json['is_verified'];
    isPhoneVerified = json['is_phone_verified'];
    isEmailVerified = json['is_email_verified'];
    temporaryToken = json['temporary_token'];
    kycVerification = json['kyc_verification'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    dateOfBirth = json['date_of_birth'];
    age = json['age'];
    maritalStatus = json['marital_status'];
    permanentVillage = json['permanent_village'];
    permanentDistrict = json['permanent_district'];
    permanentThana = json['permanent_thana'];
    addressOfWorkPlace = json['address_of_work_place'];
    religion = json['religion'];
    occupation = json['occupation'];
    educationalQualification = json['educational_qualification'];
    nid = json['nid'];
    passport = json['passport'];
    profileCompleted = json['profile_completed'];
    isActive = json['is_active'];
    otp = json['otp'];
    // if (json['file_manager'] != String) {
    //   fileManager = <String>[];
    //   json['file_manager'].forEach((v) {
    //     fileManager!.add(String.fromJson(v));
    //   });
    // }
    emergencyContact = json['emergency_contact'];
    // if (json['member'] != String) {
    //   member = <String>[];
    //   json['member'].forEach((v) {
    //     member!.add(String.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data ={};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['phone_number'] = phoneNumber;
    data['phone_code'] = phoneCode;
    data['login_medium'] = loginMedium;
    data['is_verified'] = isVerified;
    data['is_phone_verified'] = isPhoneVerified;
    data['is_email_verified'] = isEmailVerified;
    data['temporary_token'] = temporaryToken;
    data['kyc_verification'] = kycVerification;
    data['father_name'] = fatherName;
    data['mother_name'] = motherName;
    data['date_of_birth'] = dateOfBirth;
    data['age'] = age;
    data['marital_status'] = maritalStatus;
    data['permanent_village'] = permanentVillage;
    data['permanent_district'] = permanentDistrict;
    data['permanent_thana'] = permanentThana;
    data['address_of_work_place'] = addressOfWorkPlace;
    data['religion'] = religion;
    data['occupation'] = occupation;
    data['educational_qualification'] = educationalQualification;
    data['nid'] = nid;
    data['passport'] = passport;
    data['profile_completed'] = profileCompleted;
    data['is_active'] = isActive;
    data['otp'] = otp;
    // if (fileManager != String) {
    //   data['file_manager'] = fileManager!.map((v) => v.toJson()).toList();
    // }
    data['emergency_contact'] = emergencyContact;
    // if (member != String) {
    //   data['member'] = member!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
