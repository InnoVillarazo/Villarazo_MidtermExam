import 'dart:convert';
import 'package:http/http.dart' as http;

class CatService {
  static const _baseUrl = "https://api.thecatapi.com/v1/images/search";
  static const _apiKey =
      "live_SS2F2FWH91FFMvAdQ6kgnXIgO32tkt6EZyZAkcrfqk0EvJ5eIql9IADOF88DkfED";

  static Future<String?> getRandomCat() async {
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl?mime_types=jpg,png"),
        headers: {"x-api-key": _apiKey},
      );

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        final url = data[0]["url"];

        // Ensure it's a usable image
        if (url != null && (url.endsWith(".jpg") || url.endsWith(".png"))) {
          print("🐱 Cat API returned: $url");
          return url;
        } else {
          print("⚠️ Invalid or unsupported image URL: $url");
          return null;
        }
      } else {
        print("❌ API Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("⚠️ Exception: $e");
      return null;
    }
  }

  // Expose API key for image headers
  static String get apiKey => _apiKey;
}
