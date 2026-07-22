import 'dart:convert';
import 'package:http/http.dart' as http;

class DownloadService {
  static Future<String?> getVideoUrl(String url) async {
    try {
      final res = await http.get(
        Uri.parse(
          "https://www.tikwm.com/api/?url=${Uri.encodeComponent(url)}",
        ),
      );

      if (res.statusCode != 200) return null;

      final data = jsonDecode(res.body);

      if (data["data"] == null) return null;

      return data["data"]["play"];
    } catch (_) {
      return null;
    }
  }
}
