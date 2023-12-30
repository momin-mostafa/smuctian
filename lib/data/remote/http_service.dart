import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:smuctian/app_const.dart';

class HttpService {
  final String _baseUrl = ApiEndpoint.endpoint.baseUrl;
  final Map<String, String>? header;

  HttpService({this.header});

  Future<Map<String, dynamic>> get(String endpoint) async {
    EasyLoading.show();
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    EasyLoading.dismiss();
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    EasyLoading.show();
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      body: json.encode(data),
      headers: header ?? {'Content-Type': 'application/json'},
    );
    EasyLoading.dismiss();
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> multipartPost(
      String endpoint, Map<String, dynamic> data) async {
    EasyLoading.show();
    final request =
        http.MultipartRequest('POST', Uri.parse('$_baseUrl/$endpoint'));

    // Add fields and files to the request
    data.forEach((key, value) {
      if (value is String) {
        request.fields[key] = value;
      } else if (value is http.MultipartFile) {
        request.files.add(value);
      }
    });

    final response = await http.Response.fromStream(await request.send());
    EasyLoading.dismiss();
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> update(String endpoint, dynamic data) async {
    EasyLoading.show();
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      body: json.encode(data),
      headers: header ?? {'Content-Type': 'application/json'},
    );
    EasyLoading.dismiss();
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    EasyLoading.show();
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      body: json.encode(data),
      headers: header ?? {'Content-Type': 'application/json'},
    );
    EasyLoading.dismiss();
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    EasyLoading.show();
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    EasyLoading.dismiss();
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    log("response.body : ${response.body}",
        name: "HttpService._handleResponse");
    log("response.body.runtimeType : ${response.body.runtimeType}",
        name: "HttpService._handleResponse");
    final data = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (data is Map<String, dynamic>) {
        return data;
      } else {
        return {"data": data};
      }
    } else {
      log('Request failed with status: ${response.statusCode}\nbody: ${jsonDecode(response.body)['message']}');
      throw Exception(
          'Request failed with status: ${response.statusCode}\nbody: ${jsonDecode(response.body)['message']}');
    }
  }
}
