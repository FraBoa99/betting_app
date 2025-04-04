// 📦 Package imports:
import 'package:http/http.dart' as http;

class ApiService {
  //Base URL
  static const host = 'https://api.the-odds-api.com';

  static const endpoint = '/v4';

  //ApiKey
  static const String apikey = '03fd41c6e5111594672857d1318cbdc4';

  Future<dynamic> getOdds(String sportKey, String regions, String? markets,
      String? eventId, String? bookmakers) async {
    final Map<String, String> params = {};

    final apiKey = <String, String>{
      'apiKey': apikey,
    };
    params.addEntries(apiKey.entries);

    params.addEntries([MapEntry('regions', regions)]);

    if (markets != null) {
      params.addEntries([
        MapEntry('markets', markets),
      ]);
    }
    if (eventId != null) {
      params.addEntries([
        MapEntry('eventId', eventId),
      ]);
    }

    if (bookmakers != null) {
      params.addEntries([
        MapEntry('bookmakers', bookmakers),
      ]);
    }

    final url = Uri.parse('$host$endpoint/sports/$sportKey/odds')
        .replace(queryParameters: params);

    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Error status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
