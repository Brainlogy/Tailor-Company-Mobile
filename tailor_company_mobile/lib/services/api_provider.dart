import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tailor_company_mobile/services/response_handler.dart';
import 'package:tailor_company_mobile/utils/store.dart';

class ApiProvider {
  Future<http.Response> get({
    required String url,
    required Map<String, dynamic>? parameters,
  }) async {
    Uri uri = Uri.parse(url);
    uri.replace(queryParameters: parameters);
    var token = Store.getToken();

    Map<String, String> headers = {
      "Accept": 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final response = await http.get(uri, headers: headers);
      return responseHandler.reponse(response, uri);
    } catch (e) {
      log("ERROR :::::: GET $e");
      rethrow;
    }
  }

  Future<http.Response> post({
    required String url,
    required Map<String, dynamic>? parameters,
  }) async {
    Uri uri = Uri.parse(url);
    final body = jsonEncode(parameters);
    final token = Store.getToken();

    Map<String, String> headers = {
      "Accept": 'application/json',
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers.addEntries({'Authorization': 'Bearer $token'}.entries);
    }

    try {
      final response = await http.post(uri, headers: headers, body: body);
      return responseHandler.reponse(response, uri);
    } catch (e) {
      log("ERROR :::::: POST $e");
      rethrow;
    }
  }

  Future<http.Response> put({
    required String url,
    required Map<String, dynamic>? parameters,
  }) async {
    Uri uri = Uri.parse(url);
    final body = jsonEncode(parameters);
    final token = Store.getToken();

    Map<String, String> headers = {
      "Accept": 'application/json',
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers.addEntries({'Authorization': 'Bearer $token'}.entries);
    }

    try {
      final response = await http.put(uri, headers: headers, body: body);
      return responseHandler.reponse(response, uri);
    } catch (e) {
      log("ERROR :::::: POST $e");
      rethrow;
    }
  }

  Future<http.Response> delete({
    required String url,
    required Map<String, dynamic>? parameters,
  }) async {
    Uri uri = Uri.parse(url);
    final body = jsonEncode(parameters);
    final token = Store.getToken();

    Map<String, String> headers = {
      "Accept": 'application/json',
      'Content-Type': 'application/json',
    };
    if (token != null) {
      headers.addEntries({'Authorization': 'Bearer $token'}.entries);
    }

    try {
      final response = await http.delete(uri, headers: headers, body: body);
      return responseHandler.reponse(response, uri);
    } catch (e) {
      log("ERROR :::::: POST $e");
      rethrow;
    }
  }
}
