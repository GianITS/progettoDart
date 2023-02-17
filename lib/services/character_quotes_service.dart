import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:progettodart/mixins/auth_headers_mixin.dart';

class CharacterQuotesService {
  static Future<List<String>> getCharacterQuote(
      String apiKey, String characterID) async {
    final url =
        Uri.parse('https://the-one-api.dev/v2/character/$characterID/quote');
    final response = await http.get(
      url,
      headers: AuthHeadersMixin.getAuthHeaders(apiKey),
    );

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    var listCharacterQuote = data['docs'] as List;
    List<String> quotes = [];
    for (var i = 0; i < listCharacterQuote.length - 1; i++) {
      quotes.add(listCharacterQuote[i]['dialog']);
    }

    return quotes;
  }
}
