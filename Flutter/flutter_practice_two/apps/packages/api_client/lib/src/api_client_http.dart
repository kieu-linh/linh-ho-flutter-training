import 'package:api_client/api_client.dart';
import 'package:api_client/constants/app_constant.dart';
import 'package:http/http.dart' as http;

abstract class ApiClient {
 // Future<http.Response> getUser();
 // Future<http.Response> getGoal();
  Future<http.Response> get();
}

class AccountServices implements ApiClient {
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
}
