import 'package:api_client/api_client.dart';
import 'package:api_client/constants/app_constant.dart';
import 'package:http/http.dart' as http;

abstract class ApiClientBase {
  Future<http.Response> get();
  Future<http.Response> post();
}

class ApiClient implements ApiClientBase {
  @override
  Future<http.Response> get(
      {String baseUrl = FAConstant.baseUrl, String? endPoint}) async {
    try {
      var url = '$baseUrl$endPoint';
      http.Response response = await http.get(Uri.parse(url), headers: {
        'apikey': FAConstant.apiKey,
      });
      return response;
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }

  @override
  Future<http.Response> post({
    String? endpoint,
    String baseUrl = FAConstant.baseUrl,
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final response = await http.post(
        url,
        headers: headers ??
            {
              'Content-Type': 'application/json;charset=UTF-8',
              'Charset': 'utf-8',
            },
        body: body,
      );

      return response;
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }
}
