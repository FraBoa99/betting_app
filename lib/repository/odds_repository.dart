import 'dart:convert';

import 'package:betting_app/models/apiModels/odds.dart';
import 'package:betting_app/services/api_service.dart';

class OddsRepository {
  final ApiService apiClient;

  OddsRepository({
    required this.apiClient,
  });

  Future<List<Odds>> getOdds(String sportKey, String regions, String? markets,
      String? eventId, String? bookmakers) async {
    try {
      final response = await apiClient.getOdds(
          sportKey, regions, markets, eventId, bookmakers);
      final data = json.decode(response.body);
      final finalData = (data as List<dynamic>).map((item) {
        return Odds.fromMap(item);
      }).toList();
      return finalData;
    } catch (e) {
      throw Exception(e);
    }
  }
}
