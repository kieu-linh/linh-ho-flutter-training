import 'package:api_client/api_client.dart';
import 'package:api_client/constants/app_constant.dart';
import 'package:http/http.dart' as http;

abstract class ApiClient {
  Future<http.Response> getUser();
}

class AccountServices implements ApiClient {
  @override
  Future<http.Response> getUser() async {
    try {
      const url = FAConstant.endPointLogin;
      http.Response response = await http.get(Uri.parse(url));
      print(response.body);
      return response;
    } catch (e) {
      throw ErrorHandler.handle(e).failure;
    }
  }
}
