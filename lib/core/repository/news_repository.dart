import 'dart:convert';

import 'package:betting_app/core/network/api_service.dart';
import 'package:betting_app/data/models/article.dart';

class NewsRepository {
  final ApiService apiClient;

  NewsRepository({required this.apiClient});

  Future<List<Article>> getArticles(String sportName) async {
    try {
      final response = await apiClient.getNews(sportName);

      final data = json.decode(response.body);

      final finalData = (data['articles'] as List<dynamic>).map((item) {
        return Article.fromJson(item);
      }).toList();

      return finalData;
    } catch (e) {
      throw Exception('Errore nel recupero degli articoli');
    }
  }
}
