import 'package:http/http.dart' as http;
import 'dart:io';

mixin HttpConnectionMixin {
  static Future<String> connetcToApiAsync(
      String apiKey, String endPoint) async {
    final url = Uri.parse('https://the-one-api.dev/v2/$endPoint');
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $apiKey',
    });
    final res = response.body;

    return res;
  }
}
