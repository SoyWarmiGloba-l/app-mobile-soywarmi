import 'package:http/http.dart' as http;

class HttpHeadersGlobal {
  static Future<http.Response> headerGetHttpWithToken(token, url) async {
    http.Response req = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": 'application/json',
        "Authorization": 'Bearer $token',
      },
    );
    return req;
  }
}
