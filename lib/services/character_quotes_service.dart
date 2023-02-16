import 'dart:convert';
import 'package:progettodart/mixins/http_connect_api_mixin.dart';

class CharacterQuotesService {
  static Future<List<String>> getCharacterQuote(
      String apiKey, String characterID) async {
    final resBody = await HttpConnectionMixin.connetcToApiAsync(
        apiKey, 'character/$characterID/quote');

    final data = jsonDecode(resBody) as Map<String, dynamic>;
    var listCharacterQuote = data['docs'] as List;
    List<String> quotes = [];
    for (var i = 0; i < listCharacterQuote.length - 1; i++) {
      quotes.add(listCharacterQuote[i]['dialog']);
    }

    return quotes;
  }
}
