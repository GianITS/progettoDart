import 'dart:convert';
import 'package:progettodart/mixins/http_connect_api_mixin.dart';

class CharacterIdService {
  static Future<String> getCharacterId(String apiKey, String name) async {
    final res =
        await HttpConnectionMixin.connetcToApiAsync(apiKey, 'character');

    final data = jsonDecode(res) as Map<String, dynamic>;
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
