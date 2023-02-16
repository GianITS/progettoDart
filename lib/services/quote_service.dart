import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

class QuoteService {
  static Future<String> getQuote(String apiKey, int index) async {
    final url = Uri.parse('https://the-one-api.dev/v2/quote');
    final res = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $apiKey',
    });

    final data = jsonDecode(res.body) as Map<String, dynamic>;
    final cit = data['docs'][index]['dialog'];

    return cit;
  }
}
