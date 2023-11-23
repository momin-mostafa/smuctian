import 'package:smuctian/domain/model_interface.dart';

class UserAuthModel implements Model{
  int? status;
  String? message;
  String? token;
  User? user;

  UserAuthModel({this.status, this.message, this.token, this.user});

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
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

