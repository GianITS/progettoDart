// import 'package:progettodart/progettodart.dart' as progettodart;
// import 'package:progettodart/mixins/do_something-mixin.dart';
// import 'package:progettodart/services/future_service.dart';
// import 'package:progettodart/services/quote_service.dart';
import 'dart:io';
import 'package:dotenv/dotenv.dart';
import 'package:progettodart/services/character_id_service.dart';
import 'package:progettodart/services/character_quotes_service.dart';

void main(List<String> arguments) async {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  String apiKey = env['API_KEY'].toString();
  // print(await QuoteService.getQuote(apiKey, 1));
  print("Enter character name...");
  String characterName = stdin.readLineSync().toString();
  try {
    String characterID =
        await CharacterIdService.getCharacterId(apiKey, characterName);
    print(characterID);
    List<String> cits =
        await CharacterQuotesService.getCharacterQuote(apiKey, characterID);
    for (var cit in cits) {
      print(cit);
    }
  } catch (identifier) {
    print("No characters found!");
    print("Try again!");
  }
}
// export PATH="$PATH:/Users/gian/Developer/flutter/bin"