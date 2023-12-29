import 'package:flutter/material.dart';
import 'package:smuctian/data/remote/classroom.r.dart';
import 'package:smuctian/domain/classroom/classroom.list.dart';

import '../routing/routings.dart';

class ClassroomProvider with ChangeNotifier {
  ClassroomRepo repo = ClassroomRepo();

  List<ClassRoomList> totalClasses = [];

  ClassRoomList? selectedClassRoom;

  Future<void> allClasses() async {
    totalClasses = await repo.getAllClasses("230110210001", "1064641");
    notifyListeners();
  }

  navigateToClassDetails(BuildContext context,{required ClassRoomList classRoom}){
    selectedClassRoom = classRoom;
    Navigator.pushNamed(
      context,
      Routes.instance.classDetails,
    );
  }
}
