import 'package:http/http.dart' as http;
import 'package:trikeright/core/utils/log.dart';

class NetworkUtility {
  static Future<String?> fetchUrl(Uri uri,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      Log.e(e.toString());
    }
    return null;
  }
}
