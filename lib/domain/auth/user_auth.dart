import 'package:smuctian/domain/model_interface.dart';

// {
//   "status": 200,
//   "message": "Password update successfully",
//   "data": "Successfully updated, check your email:: mominmostafa.g@outlook.com",
//   "timestamp": "2023-12-29 11:58:57 PM",
//   "endpoint": "/api/v1/university/auth/update"
// }

class UserAuthModel implements Model{
  int? status;
  String? message;
  String? data;
  User? user;

  UserAuthModel({this.status, this.message, this.data, this.user});

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}

class User {
  String? phoneNumber;
  int? id;
  String? name;
  String? email;

  User({this.phoneNumber, this.id, this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['phone_number'] = phoneNumber;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

