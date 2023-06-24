import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_constant.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  Future<http.Response> get(
      {required String path, required Map<String, String> headers}) async {
    debugPrint('🌍 🌍 🌍-------------------------------');
    debugPrint('GET Request');
    debugPrint(path);
    debugPrint(headers.toString());
    debugPrint('🌍 🌍 🌍-------------------------------');

    final response = await _client
        .get(Uri.parse('${ApiConstant.BASE_URL}$path'), headers: headers);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
