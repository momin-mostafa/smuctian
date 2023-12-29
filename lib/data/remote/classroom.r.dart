import 'dart:convert';
import 'dart:developer';

import 'package:smuctian/app_const.dart';
import 'package:smuctian/data/remote/http_service.dart';
import 'package:smuctian/domain/classroom/classroom.list.dart';
import 'package:smuctian/domain/global_singleton.dart';

class ClassroomRepo {
  HttpService httpService = HttpService(
      header: {"authorization": GlobalAppSingleton.instance.getToken});
  ApiEndpoint apiEndpoint = ApiEndpoint();

  Future<List<ClassRoomList>> getAllClasses(String academicId, String institutionCode) async {
    var map = await httpService.post(
      apiEndpoint.classroom(
        academicId: academicId,
        institutionCode: institutionCode,
      ),
      {},
    );
    List<ClassRoomList> classes = [];
    try{
      for(var element in map["data"]){
        classes.add(ClassRoomList.fromJson(element));
      }
    }catch(e){
      log("ClassRoomList.fromJson",error: "ClassroomRepo.getAllClasses -> Parse Error");
    }
    return classes;
  }
}
