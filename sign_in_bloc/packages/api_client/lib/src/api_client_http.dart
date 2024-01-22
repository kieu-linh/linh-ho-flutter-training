import 'dart:convert';
import 'dart:developer';

import 'package:api_client/api_client.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://10.0.2.2:3001/';

class ApiClient {
  ApiClient(
    http.Client? client,
  ) {
    _client = client ?? http.Client();
  }

  late http.Client _client;

  http.Client getHttpClient() {
    return _client;
  }

  Future<http.Response> get(
    String? endpoint, {
    String baseUrl = baseUrl,
    // Map<String, String>? headers,
  }) async {
    try {
      var url = Uri.parse('$baseUrl$endpoint');
      var response = await _client.get(
        url,
        // headers: headers,
      );
      return response;
    } catch (e) {
      log(e.toString());
      throw ErrorHandler.handle(e).failure;
    }
  }

  Future<http.Response> post(
    String? endpoint, {
    String baseUrl = baseUrl,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final response = await _client.post(
        url,
        headers: headers ??
            {
              'Content-Type': 'application/json;charset=UTF-8',
              'Charset': 'utf-8',
            },
        body: body,
        encoding: encoding,
      );

      return response;
    } catch (e) {
      log(e.toString());
      throw ErrorHandler.handle(e).failure;
    }
  }

  Future<http.Response> put(
    String? endpoint, {
    String baseUrl = baseUrl,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    try {
      var url = Uri.parse('$baseUrl$endpoint');
      var response = await _client.put(
        url,
        headers: headers,
        body: body,
        encoding: encoding,
      );
      return response;
    } catch (e) {
      log(e.toString());
      throw ErrorHandler.handle(e).failure;
    }
  }

  Future<http.Response> delete(
    String? endpoint, {
    String baseUrl = baseUrl,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    try {
      var url = Uri.parse('$baseUrl$endpoint');
      var response = await _client.delete(
        url,
        headers: headers,
        body: body,
        encoding: encoding,
      );
      return response;
    } catch (e) {
      log(e.toString());
      throw ErrorHandler.handle(e).failure;
    }
  }
}
