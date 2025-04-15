// 📦 Package imports:
import 'package:http/http.dart' as http;

class ApiService {
  //API SPORT
  static const _hostSport = 'https://api.the-odds-api.com';
  static const _endpointSport = '/v4';
  static const _apikeySport = '6e325119bf19259c9223872a1757abdc';

  //API NEWS
  static const _hostNews = 'https://newsapi.org';
  static const _endpointNews = '/v2/everything';
  static const _apikeyNews = 'fbb12e8b757941298d4be8c36c70e5f7';

  Future<dynamic> getOdds(String sportKey, String regions, String? markets,
      String? eventId, String? bookmakers) async {
    final Map<String, String> params = {};

    final apiKey = <String, String>{
      'apiKey': _apikeySport,
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

    final url = Uri.parse('$_hostSport$_endpointSport/sports/$sportKey/odds')
        .replace(queryParameters: params);

    final response = await http.get(url);
    print(url);

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

  Future<dynamic> getNews(String sportName) async {
    final Uri url = Uri.parse('$_hostNews$_endpointNews').replace(
      queryParameters: {
        'q': sportName,
        'language': 'en',
        'pageSize': '5',
        'apiKey': _apikeyNews,
      },
    );

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
