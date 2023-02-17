import 'dart:io';

mixin AuthHeadersMixin {
  static Map<String, String> getAuthHeaders(String apiKey) {
    return {HttpHeaders.authorizationHeader: 'Bearer $apiKey'};
  }
}
