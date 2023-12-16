
import 'package:smuctian/app_const.dart';
import 'package:smuctian/data/remote/http_service.dart';

class ClassroomRepo{
  HttpService httpService = HttpService();
  ApiEndpoint apiEndpoint = ApiEndpoint();

  Future<void> getAllClasses()async{
    Map map = await httpService.get(apiEndpoint.classroom);
    print(map);
  }
}