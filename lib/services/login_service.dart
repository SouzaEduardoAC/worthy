import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:worthy/entities/user.dart';
import 'package:worthy/utils/api_response.dart';

class LoginService {
  static Future<bool> login(String login, String password) async {
    return true;

    var _serviceUrl = "https://??";
    Map params = {'login': login, 'password': password};
    var response = await http.post(_serviceUrl as Uri, body: params);
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
  }

  static Future<ApiResponse> loginJWT(String login, String password) async {
    var _serviceUrl = "https://??";

    Map<String, String> headers = {
      "Content-Type" : "application/json"
    };

    Map params = {
      "login": login,
      "password":
      password
    };

    try {
      String payload = jsonEncode(params);
      var response = await http.post(
          _serviceUrl as Uri, body: payload, headers: headers);
      var mappedResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final user = User.fromJson(mappedResponse);
        return ApiResponse.ok(user);
      }

      return ApiResponse.error(mappedResponse["error"]);
    } catch(error, exception) {
      print("Fail to login $error > $exception");
      return ApiResponse.error("We could not connect to the server, please check you connections");
    }
  }
}

