import 'package:smuctian/domain/profile/profile_model.dart';

class UserProfileSingleton extends Profile{
  factory UserProfileSingleton(){
    return instance;
  }

  static UserProfileSingleton instance = UserProfileSingleton();


}