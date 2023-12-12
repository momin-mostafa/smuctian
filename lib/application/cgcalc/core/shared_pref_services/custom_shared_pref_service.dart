import 'package:shared_preferences/shared_preferences.dart';

class CustomSharedPreferencesGetterSetter {
  late final _prefs;
  CustomSharedPreferencesGetterSetter() {
    initCustomSharedPreferencesGetterSetter();
  }
  Future<void> initCustomSharedPreferencesGetterSetter() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _prefs = pref;
  }

  String getPrefDataFromFeild(String fieldName) {
    String data = _prefs.getString(fieldName) ?? "";
    return data;
  }

  double getPrefDataFromDouble(String fieldName) {
    double data = _prefs.getDouble(fieldName) ?? 0;
    return data;
  }

  // List getPrefDataFromFeildList(String fieldName) {
  //   List data = _prefs.getList(fieldName) ?? "";
  //   return data;
  // }

  double wrapperGetPrefDataFromFeild(String fieldName) {
    return double.parse(getPrefDataFromFeild(fieldName));
  }

  SharedPreferences getPref() {
    return _prefs;
  }

  void setPrefDataFromFeild(String fieldName, String replacedData) {
    _prefs.setString(fieldName, replacedData);
  }

  void setPrefDataFromDouble(String fieldName, double replacedData) {
    _prefs.setDouble(fieldName, replacedData);
  }

  // void setPrefDataFromFeildStringList(
  //     String fieldName, List<String> replacedData) {
  //   _prefs.setString(fieldName, replacedData);
  // }

  void deletePrefDataFromFeild(String fieldName) {
    _prefs.remove(fieldName);
  }

  void setDefault() {
    setPrefDataFromFeild("ID", "193061001");
    setPrefDataFromFeild("Password", "smuct@admin");
    setPrefDataFromFeild("DepartmentName", "CSE");
    setPrefDataFromDouble("previousSemesterResult", 4.0);
    // setPrefDataFromFeildStringList("listOfAvailableWaiver", ["0"]);
    setPrefDataFromDouble("sscResult", 4.68);
    setPrefDataFromDouble("hscResult", 4.33);
    setPrefDataFromDouble("newIntakeCredit", 14.0);
    setPrefDataFromDouble("retakeCredit", 0);
    setPrefDataFromDouble("prevTotalRegisteredCredit", 14.0);
    setPrefDataFromDouble("semesterfeeTotal", 20600);
    setPrefDataFromDouble("registrationFee", 2000);
  }
}
