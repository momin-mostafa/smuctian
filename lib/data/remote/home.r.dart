import 'dart:developer';

import 'package:smuctian/app_const.dart';
import 'package:smuctian/data/remote/http_service.dart';

class HomeRepo {
  HttpService httpService = HttpService();
  ApiEndpoint apiEndpoint = ApiEndpoint();

  //http://localhost:9090/api/v1/university/classroom/myclasses-student?academicId=230110210001&institutionCode=1064641
  Future<void> fetchData() async {
    Map mapData = await httpService.post(
      apiEndpoint.classroom(
        academicId: "230110210001",
        institutionCode: "1064641",
      ),
      {""},
    );
    log(mapData.toString(),name: "HomeRepo.fetchData");
  }
}
