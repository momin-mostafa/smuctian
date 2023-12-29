class ApiEndpoint {
  static final ApiEndpoint endpoint = ApiEndpoint();

  final String baseUrl = 'http://localhost:9090/api/v1/university';
  final String login = 'auth/login';
  final String _classroom = 'classroom/myclasses-student?';

  String classroom({
    required String academicId,
    required String institutionCode,
  }) {
    var contact = "academicId=$academicId&institutionCode=$institutionCode";
    return _classroom + contact;
  }
}

class SharedPrefKeys {
  static const tokenKey = "TOKEN";
}
