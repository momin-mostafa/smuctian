import 'package:smuctian/data/remote/http_service.dart';
import 'package:smuctian/domain/global_singleton.dart';

class ProfileService {
  HttpService httpService = HttpService(header: {
    'Authorization':'Bearer ${GlobalAppSingleton.instance.token}'
  });

  void getProfileData(){
    var profile = httpService.get('user');
    print(profile);
  }
}