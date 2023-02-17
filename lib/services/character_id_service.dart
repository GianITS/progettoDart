import 'dart:convert';
import 'package:progettodart/mixins/auth_headers_mixin.dart';
import 'package:http/http.dart' as http;

class CharacterIdService {
  static Future<String> getCharacterId(String apiKey, String name) async {
    final url = Uri.parse('https://the-one-api.dev/v2/character');
    final response = await http.get(
      url,
      headers: AuthHeadersMixin.getAuthHeaders(apiKey),
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    var list = data['docs'] as List;

    String characterID = '';
    for (var i = 0; i < list.length - 1; i++) {
      if (list[i]['name'] == name) {
        characterID = data['docs'][i]['_id'];
        break;
      }
    }

    return characterID;
  }
}
