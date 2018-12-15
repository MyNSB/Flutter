import 'dart:convert';
import 'dart:io';

import "package:http/http.dart" as http;

class Session {
  static String _userData;

  static Future<http.Response> auth(String url, String username, String password) async {
    String token = "Basic " + base64.encode(utf8.encode("$username:$password"));

    http.Response response = await http.post(
      url,
      headers: {
        HttpHeaders.authorizationHeader: token
      }
    );

    Session._userData = response.headers["set-cookie"];

    return response;
  }

  static Future<http.Response> get(String url) {
    return http.get(
      url,
      headers: {
        "cookie": Session._userData
      }
    );
  }

  static Future<http.Response> post(String url) {
    return http.post(
      url,
      headers: {
        "cookie": Session._userData
      }
    );
  }
}
