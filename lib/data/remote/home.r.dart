import 'package:smuctian/app_const.dart';
import 'package:smuctian/data/remote/http_service.dart';

class HomeRepo {
  HttpService httpService = HttpService();
  ApiEndpoint apiEndpoint = ApiEndpoint();




  fetchData()async{
    Map mapData = await httpService.post(apiEndpoint.classroom, {""});
    print(mapData);
  }


}