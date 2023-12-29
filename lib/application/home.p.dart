import 'package:flutter/material.dart';
import 'package:smuctian/data/remote/home.r.dart';


class HomeProvider with ChangeNotifier{
  HomeRepo repo = HomeRepo();

  List courses = [];
  List exams = [];
  List assignments = [];
  List notices = [];

  Future<void> getAll()async{
    await repo.fetchData();
  }
  getCourses(){}
  getExams(){}
  getAssignments(){}
  getNotices(){}
}