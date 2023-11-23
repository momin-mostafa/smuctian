import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:smuctian/app_const.dart';

class HttpService {
  final String _baseUrl = baseUrl;
  final Map<String, String>? header;

  HttpService(
      {this.header});

  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: json.encode(data),
      headers: header ?? {'Content-Type': 'application/json'},
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> multipartPost(String endpoint,
      Map<String, dynamic> data) async {
    final request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/$endpoint'));

    // Add fields and files to the request
    data.forEach((key, value) {
      if (value is String) {
        request.fields[key] = value;
      } else if (value is http.MultipartFile) {
        request.files.add(value);
      }
    });

    final response = await http.Response.fromStream(await request.send());
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> update(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      body: json.encode(data),
      headers: header ?? {'Content-Type': 'application/json'},
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      body: json.encode(data),
      headers: header ?? {'Content-Type': 'application/json'},
    );
    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final data = json.decode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      log('Request failed with status: ${response.statusCode}\nbody: ${jsonDecode(response.body)['message']}');
      throw Exception('Request failed with status: ${response.statusCode}\nbody: ${jsonDecode(response.body)['message']}');
    }
  }
}
